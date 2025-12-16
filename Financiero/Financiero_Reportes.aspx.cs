using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Proyecto_Final_Diseño_
{
    public partial class Financiero_Reportes : System.Web.UI.Page
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
            try
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
                               r.Estado,
                               a.Decision AS DecisionFinanciero
                        FROM Requisicion r
                        INNER JOIN Usuario u ON r.id_Comprador = u.id_Usuario
                        INNER JOIN Aprobacion a ON r.id_Requisicion = a.id_Requisicion
                        WHERE a.id_Aprobador = @IdUsuario
                              AND a.Nivel = 'Financiero'";

                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    da.SelectCommand.Parameters.AddWithValue("@IdUsuario", ObtenerIdFinanciero());

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvRequisiciones.DataSource = dt;
                    gvRequisiciones.DataBind();
                }
            }
            catch (Exception ex)
            {
                // opcional: mostrar error
                // Response.Write("Error al cargar requisiciones: " + ex.Message);
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

