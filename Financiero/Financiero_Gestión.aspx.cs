using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Proyecto_Final_Diseño_
{
    public partial class Financiero_Gestión : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarRequisiciones();
            }
        }

        private void CargarRequisiciones()
        {
            int idFinanciero = ObtenerIdFinanciero();
            if (idFinanciero == 0)
                return;

            decimal montoMin = 0;
            decimal montoMax = decimal.MaxValue;

            // Clasificación de aprobadores financieros
            if (idFinanciero == 1)
            {
                montoMax = 100000;
            }
            else if (idFinanciero == 2)
            {
                montoMin = 100000;
                montoMax = 1000000;
            }
            else
            {
                montoMin = 1000000;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT DISTINCT
                           r.id_Requisicion,
                           u.Nombre + ' ' + u.Apellido1 AS Solicitante,
                           r.Descripcion,
                           r.CantidadSolicitada,
                           r.Monto,
                           r.Prioridad,
                           r.Estado
                    FROM Requisicion r
                    INNER JOIN Usuario u ON r.id_Comprador = u.id_Usuario
                    INNER JOIN RegistroAuditoria ra 
                        ON ra.IdEntidad = r.id_Requisicion
                    WHERE r.Estado = 'Pendiente'
                      AND ra.EntidadAfectada = 'Requisicion'
                      AND ra.Resultado = 'Éxito'
                      AND r.Monto >= @MontoMin
                      AND r.Monto < @MontoMax";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@MontoMin", montoMin);
                da.SelectCommand.Parameters.AddWithValue("@MontoMax", montoMax);

                DataTable dt = new DataTable();
                da.Fill(dt);

                gvRequisiciones.DataSource = dt;
                gvRequisiciones.DataBind();
            }
        }

        protected void gvRequisiciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvRequisiciones.SelectedDataKey != null)
            {
                int idRequisicion = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);
                Session["RequisicionSeleccionada"] = idRequisicion;
                lblResultados.Text = "Requisición seleccionada: " + idRequisicion;
            }
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            if (Session["RequisicionSeleccionada"] != null)
            {
                int id = Convert.ToInt32(Session["RequisicionSeleccionada"]);
                ActualizarRequisicion(id, "Aprobar");
            }
        }

        protected void btnDenegar_Click(object sender, EventArgs e)
        {
            if (Session["RequisicionSeleccionada"] != null)
            {
                int id = Convert.ToInt32(Session["RequisicionSeleccionada"]);
                ActualizarRequisicion(id, "Rechazar");
            }
        }

        private void ActualizarRequisicion(int id, string decision)
        {
            int idFinanciero = ObtenerIdFinanciero();
            if (idFinanciero == 0)
            {
                lblResultados.Text = "Error: No se pudo determinar el aprobador financiero.";
                return;
            }

            string justificacion = string.IsNullOrEmpty(txtJustificacion.Text) ? null : txtJustificacion.Text;

            string decisionAprobacion = decision == "Aprobar" ? "Aprobado" : "Rechazado";
            string estadoRequisicion = decision == "Aprobar" ? "Aprobada" : "Rechazada";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlTransaction tran = con.BeginTransaction())
                    {
                        string updateQuery = "UPDATE Requisicion SET Estado=@estado WHERE id_Requisicion=@id";
                        using (SqlCommand cmd = new SqlCommand(updateQuery, con, tran))
                        {
                            cmd.Parameters.AddWithValue("@estado", estadoRequisicion);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.ExecuteNonQuery();
                        }

                        string insertQuery = @"
                            INSERT INTO Aprobacion 
                            (id_Requisicion, id_Aprobador, Nivel, FechaAprobacion, Decision, Observaciones)
                            VALUES (@idR, @idA, 'Financiero', GETDATE(), @decision, @obs)";
                        using (SqlCommand cmd = new SqlCommand(insertQuery, con, tran))
                        {
                            cmd.Parameters.AddWithValue("@idR", id);
                            cmd.Parameters.AddWithValue("@idA", idFinanciero);
                            cmd.Parameters.AddWithValue("@decision", decisionAprobacion);
                            cmd.Parameters.AddWithValue("@obs", (object)justificacion ?? DBNull.Value);
                            cmd.ExecuteNonQuery();
                        }

                        tran.Commit();
                    }
                }

                lblResultados.Text = $"Requisición {id} {estadoRequisicion.ToLower()} correctamente.";
                txtJustificacion.Text = "";
                CargarRequisiciones();
            }
            catch (Exception ex)
            {
                lblResultados.Text = "Error al procesar la requisición: " + ex.Message;
            }
        }

        private int ObtenerIdFinanciero()
        {
            if (Session["idUsuario"] == null || Session["Rol"] == null)
                return 0;

            string rol = Session["Rol"].ToString().Trim();
            int idUsuario = Convert.ToInt32(Session["idUsuario"]);

            if (!rol.Equals("Aprobador Financiero", StringComparison.OrdinalIgnoreCase))
                return 0;

            return idUsuario;
        }
    }
}