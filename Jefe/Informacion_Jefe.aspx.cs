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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarGrid();
        }

        void CargarGrid()
        {
            string sql = "SELECT * FROM Requisicion";

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
                PintarEstados();
            }
        }

        void PintarEstados()
        {
            foreach (System.Web.UI.WebControls.GridViewRow row in GridView1.Rows)
            {
                var lbl = row.FindControl("lblEstado")
                    as System.Web.UI.WebControls.Label;

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

        protected void ImageButton2_Click(object sender,
            System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("Jefe_Inicio.aspx");
        }
    }
}