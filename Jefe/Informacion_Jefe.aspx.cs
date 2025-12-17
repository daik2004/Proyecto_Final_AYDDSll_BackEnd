using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Informacion_Jefe : System.Web.UI.Page
    {
        string conexion = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;
        int idJefe;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idUsuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            idJefe = Convert.ToInt32(Session["idUsuario"]);

            if (!IsPostBack)
            {
                CargarGrid();
            }
        }

        void CargarGrid()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                string sql = @"
                    SELECT 
                        r.id_Requisicion,
                        r.Fecha_Creacion,
                        r.Descripcion,
                        r.Categoria,
                        r.CantidadSolicitada,
                        r.Monto,
                        r.Prioridad,
                        r.Estado,
                        a.Decision,
                        a.FechaAprobacion,
                        a.Observaciones
                    FROM Requisicion r
                    INNER JOIN Aprobacion a 
                        ON r.id_Requisicion = a.id_Requisicion
                    WHERE a.id_Aprobador = @idJefe
                      AND a.Nivel = 'Jefe'
                      AND a.Decision IS NOT NULL";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.SelectCommand.Parameters.AddWithValue("@idJefe", idJefe);

                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                PintarEstados();
            }
        }

        void PintarEstados()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label lbl = row.FindControl("lblEstado") as Label;
                if (lbl == null) continue;

                if (lbl.Text.Contains("Pendiente"))
                    lbl.CssClass = "estado-pendiente";
                else if (lbl.Text == "Aprobada")
                    lbl.CssClass = "estado-aprobada";
                else if (lbl.Text == "Rechazada")
                    lbl.CssClass = "estado-rechazada";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Jefe_Inicio.aspx");
        }

        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("Jefe_Inicio.aspx");
        }
    }
}