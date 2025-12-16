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
            int idRequisicion = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);
            Session["RequisicionSeleccionada"] = idRequisicion;
            lblResultados.Text = "Requisición seleccionada: " + idRequisicion;
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            if (Session["RequisicionSeleccionada"] != null)
            {
                int id = Convert.ToInt32(Session["RequisicionSeleccionada"]);
                ActualizarRequisicion(id, "Aprobada");
            }
        }

        protected void btnDenegar_Click(object sender, EventArgs e)
        {
            if (Session["RequisicionSeleccionada"] != null)
            {
                int id = Convert.ToInt32(Session["RequisicionSeleccionada"]);
                ActualizarRequisicion(id, "Rechazada");
            }
        }

        private void ActualizarRequisicion(int id, string decision)
        {
            string justificacion = txtJustificacion.Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Actualiza estado
                string updateQuery = "UPDATE Requisicion SET Estado=@estado WHERE id_Requisicion=@id";
                using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                {
                    cmd.Parameters.AddWithValue("@estado", decision);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }

                // Inserta registro de aprobación
                string insertQuery = @"
                    INSERT INTO Aprobacion (id_Requisicion, id_Aprobador, Nivel, FechaAprobacion, Decision, Observaciones)
                    VALUES (@idR, @idA, 'Financiero', GETDATE(), @decision, @obs)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@idR", id);
                    cmd.Parameters.AddWithValue("@idA", ObtenerIdFinanciero());
                    cmd.Parameters.AddWithValue("@decision", decision);
                    cmd.Parameters.AddWithValue("@obs", justificacion);
                    cmd.ExecuteNonQuery();
                }
            }

            lblResultados.Text = $"Requisición {id} {decision.ToLower()} correctamente.";
            txtJustificacion.Text = "";
            CargarRequisiciones();
        }

        private int ObtenerIdFinanciero()
        {
            if (Session["Usuario"] == null)
                return 0;

            int idFinanciero = 0;
            string usuarioLogueado = Session["Usuario"].ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT id_Usuario FROM Usuario WHERE Usuario=@usuario AND id_Rol=(SELECT id_Rol FROM Rol WHERE Nombre='Aprobador Financiero')";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@usuario", usuarioLogueado);
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                        idFinanciero = Convert.ToInt32(result);
                }
            }

            return idFinanciero;
        }
    }
}