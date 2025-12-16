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
    public partial class Gestion_de_Reportes : System.Web.UI.Page
    {
        string conexion = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;
        int idJefe;
        string departamentoJefe;

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
                ObtenerDepartamentoJefe();
                CargarGrid();
            }
        }

        void ObtenerDepartamentoJefe()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT Departamento FROM Usuario WHERE id_Usuario = @id", con);

                cmd.Parameters.AddWithValue("@id", idJefe);
                con.Open();
                departamentoJefe = cmd.ExecuteScalar()?.ToString();
            }
        }

        void CargarGrid()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                    SELECT r.*
                    FROM Requisicion r
                    INNER JOIN Usuario u ON r.id_Comprador = u.id_Usuario
                    INNER JOIN Aprobacion a ON r.id_Requisicion = a.id_Requisicion
                    WHERE r.Estado = 'Pendiente'
                    AND a.Nivel = 'Jefe'
                    AND a.Decision IS NULL
                    AND u.Departamento = @Dep", con);

                da.SelectCommand.Parameters.AddWithValue("@Dep", departamentoJefe);

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

                if (lbl.Text == "Pendiente") lbl.CssClass = "estado-pendiente";
                else if (lbl.Text == "Aprobada") lbl.CssClass = "estado-aprobada";
                else if (lbl.Text == "Rechazada") lbl.CssClass = "estado-rechazada";
            }
        }

        protected void gvRequisiciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvRequisiciones.SelectedRow;

            lblId.Text = gvRequisiciones.SelectedDataKey.Value.ToString();

            Label lblMontoGrid = row.FindControl("lblMontoGrid") as Label;
            lblMonto.Text = lblMontoGrid?.Text;

            pnlDetalle.Visible = true;
        }

        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Aprobacion
                    SET id_Aprobador=@id,
                        FechaAprobacion=GETDATE(),
                        Decision='Aprobado',
                        Observaciones=@Obs
                    WHERE id_Requisicion=@Req AND Nivel='Jefe'", con);

                cmd.Parameters.AddWithValue("@id", idJefe);
                cmd.Parameters.AddWithValue("@Obs", txtObservaciones.Text);
                cmd.Parameters.AddWithValue("@Req", idReq);
                cmd.ExecuteNonQuery();
            }

            pnlDetalle.Visible = false;
            txtObservaciones.Text = "";
            CargarGrid();
        }

        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            int idReq = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Aprobacion
                    SET id_Aprobador=@id,
                        FechaAprobacion=GETDATE(),
                        Decision='Rechazado',
                        Observaciones=@Obs
                    WHERE id_Requisicion=@Req AND Nivel='Jefe'", con);

                cmd.Parameters.AddWithValue("@id", idJefe);
                cmd.Parameters.AddWithValue("@Obs", txtObservaciones.Text);
                cmd.Parameters.AddWithValue("@Req", idReq);
                cmd.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand(
                    "UPDATE Requisicion SET Estado='Rechazada' WHERE id_Requisicion=@Req", con);
                cmd2.Parameters.AddWithValue("@Req", idReq);
                cmd2.ExecuteNonQuery();
            }

            pnlDetalle.Visible = false;
            txtObservaciones.Text = "";
            CargarGrid();
        }
    }
}