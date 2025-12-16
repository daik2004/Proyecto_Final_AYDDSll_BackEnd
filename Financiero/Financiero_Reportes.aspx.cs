using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Proyecto_Final_Diseño_
{
    public partial class Financiero_Reportes : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["dboSistemaAuditoria"].ConnectionString;

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
                               r.Estado
                        FROM Requisicion r
                        INNER JOIN Usuario u ON r.id_Comprador = u.id_Usuario
                        WHERE r.Estado IN ('Pendiente', 'Aprobada', 'Rechazada')";

                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvRequisiciones.DataSource = dt;
                    gvRequisiciones.DataBind();
                }
            }
            catch (Exception ex)
            {
                
            }
        }

        private int ObtenerIdFinanciero()
        {
            if (Session["Usuario"] == null)
                return 0;

            int idFinanciero = 0;
            string usuarioLogueado = Session["Usuario"].ToString();

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"
                        SELECT id_Usuario 
                        FROM Usuario 
                        WHERE Usuario=@usuario 
                          AND id_Rol=(SELECT id_Rol FROM Rol WHERE Nombre='Aprobador Financiero')";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@usuario", usuarioLogueado);
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                            idFinanciero = Convert.ToInt32(result);
                    }
                }
            }
            catch
            {
                idFinanciero = 0;
            }

            return idFinanciero;
        }
    }
}
