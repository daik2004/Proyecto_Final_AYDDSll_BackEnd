using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Comprador_Infomacion : System.Web.UI.Page
    {
        string cn = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Seguridad básica
            if (Session["idUsuario"] == null || Session["Rol"].ToString() != "Comprador")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarRequisiciones();
            }
        }

        // ================================
        // CARGAR REQUISICIONES DEL COMPRADOR
        // ================================
        private void CargarRequisiciones(string estado = "")
        {
            int idComprador = Convert.ToInt32(Session["idUsuario"]);

            using (SqlConnection con = new SqlConnection(cn))
            {
                string sql = @"
			                    SELECT 
                        r.id_Requisicion,
                        r.Fecha_Creacion,
                        r.MotivoSolicitud,
                        r.Categoria,
                        r.UnidadMedida,
                        r.CantidadSolicitada,
                        r.Monto,
                        r.Prioridad,
                        ISNULL(r.Estado, 'Pendiente') AS Estado,
                        ISNULL(rol.Nombre, '---') AS ProcesadoPor
                    FROM Requisicion r
                    LEFT JOIN Aprobacion a ON r.id_Requisicion = a.id_Requisicion
                    LEFT JOIN Usuario u ON a.id_Aprobador = u.id_Usuario
                    LEFT JOIN Rol rol ON u.id_Rol = rol.id_Rol
                    WHERE r.id_Comprador = @id";


				if (!string.IsNullOrEmpty(estado))
				{
					sql += " AND r.Estado = @estado";

                }

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", idComprador);

            if (!string.IsNullOrEmpty(estado))
                cmd.Parameters.AddWithValue("@estado", estado);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvRequisiciones.DataSource = dt;
            gvRequisiciones.DataBind();
        }
		}

		// ================================
		// FILTRO POR ESTADO
		// ================================
		protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            string estado = ddlEstado.SelectedValue;
            CargarRequisiciones(estado);
        }

        // ================================
        // BOTÓN VOLVER
        // ================================
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Comprador/Comprador_Inicio.aspx");
        }
    }
}