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
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT r.id_Requisicion,
                           u.Nombre + ' ' + u.Apellido1 AS Solicitante,
                           r.Descripcion,
                           r.CantidadSolicitada,
                           r.Monto,
                           r.Prioridad,
                           r.Estado
                    FROM Requisicion r
                    INNER JOIN Usuario u ON r.id_Comprador = u.id_Usuario
                    WHERE r.Estado = 'Pendiente'";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
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

            // Normalizar decision para tabla Aprobacion
            string decisionAprobacion;
            if (decision.Equals("Aprobar", StringComparison.OrdinalIgnoreCase))
                decisionAprobacion = "Aprobado";
            else if (decision.Equals("Rechazar", StringComparison.OrdinalIgnoreCase))
                decisionAprobacion = "Rechazado";
            else
            {
                lblResultados.Text = "Decision inválida.";
                return;
            }

            // Normalizar estado para tabla Requisicion
            string estadoRequisicion;
            if (decision.Equals("Aprobar", StringComparison.OrdinalIgnoreCase))
                estadoRequisicion = "Aprobada";
            else
                estadoRequisicion = "Rechazada";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlTransaction tran = con.BeginTransaction())
                    {
                        // Actualiza estado de la requisición
                        string updateQuery = "UPDATE Requisicion SET Estado=@estado WHERE id_Requisicion=@id";
                        using (SqlCommand cmd = new SqlCommand(updateQuery, con, tran))
                        {
                            cmd.Parameters.AddWithValue("@estado", estadoRequisicion);
                            cmd.Parameters.AddWithValue("@id", id);
                            cmd.ExecuteNonQuery();
                        }

                        // Inserta registro de aprobación
                        string insertQuery = @"
                    INSERT INTO Aprobacion (id_Requisicion, id_Aprobador, Nivel, FechaAprobacion, Decision, Observaciones)
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
            // Validar que la sesión esté activa
            if (Session["idUsuario"] == null || Session["Rol"] == null)
                return 0;

            // Obtener rol y usuario de sesión
            string rol = Session["Rol"].ToString().Trim(); // elimina espacios extra
            int idUsuario = Convert.ToInt32(Session["idUsuario"]);

            // Verificar que el usuario sea aprobador financiero (ignorando mayúsculas/minúsculas)
            if (!rol.Equals("Aprobador Financiero", StringComparison.OrdinalIgnoreCase))
                return 0;

            return idUsuario;
        }


    }
}
