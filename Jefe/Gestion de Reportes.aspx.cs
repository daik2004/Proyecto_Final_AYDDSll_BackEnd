using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices;

namespace Proyecto_Final_Diseño_
{
    public partial class Gestion_Reportes : System.Web.UI.Page
    {
        string conexion = "Data Source=.;Initial Catalog=dboSistemaAuditoria;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) CargarGrid();
        }

        void CargarGrid()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Requisicion WHERE Estado LIKE 'Pendiente%'", con);

                DataTable dt = new DataTable();
                da.Fill(dt);

                gvRequisiciones.DataSource = dt;
                gvRequisiciones.DataBind();
                PintarEstadosGrid();
            }
        }

        void PintarEstadosGrid()
        {
            foreach (GridViewRow row in gvRequisiciones.Rows)
            {
                Label lbl = row.FindControl("lblEstadoGrid") as Label;
                if (lbl == null) continue;

                if (lbl.Text.Contains("Pendiente")) lbl.CssClass = "estado-pendiente";
                else if (lbl.Text == "Aprobada") lbl.CssClass = "estado-aprobada";
                else if (lbl.Text == "Rechazada") lbl.CssClass = "estado-rechazada";
            }
        }

        protected void gvRequisiciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvRequisiciones.SelectedRow;

            lblId.Text = "ID: " + row.Cells[1].Text;
            lblIdComprador.Text = "Comprador: " + row.Cells[2].Text;
            lblFecha.Text = "Fecha: " + row.Cells[3].Text;
            lblDescripcion.Text = "Descripción: " + row.Cells[4].Text;
            lblCategoria.Text = "Categoría: " + row.Cells[5].Text;
            lblCantidad.Text = "Cantidad: " + row.Cells[6].Text;
            lblUnidad.Text = "Unidad: " + row.Cells[7].Text;
            lblMotivo.Text = "Motivo: " + row.Cells[8].Text;
            lblMonto.Text = "Monto: " + row.Cells[9].Text;
            lblEstado.Text = "Estado: " + row.Cells[11].Text;

            pnlDetalle.Visible = true;
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            ActualizarEstado("Pendiente por Jefe Financiero");
        }

        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            ActualizarEstado("Rechazada");
        }

        void ActualizarEstado(string nuevoEstado)
        {
            int id = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Requisicion
                    SET Estado=@Estado, ObservacionesJefe=@Obs
                    WHERE id_Requisicion=@Id", con);

                cmd.Parameters.AddWithValue("@Estado", nuevoEstado);
                cmd.Parameters.AddWithValue("@Obs", txtObservaciones.Text);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            txtObservaciones.Text = "";
            pnlDetalle.Visible = false;
            CargarGrid();
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
        
        }

        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("Jefe_Inicio.aspx");
        }
    }
}