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

        // 🔹 Obtener el departamento del jefe logueado
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

        // 🔹 Cargar SOLO requisiciones:
        //    - Pendientes
        //    - Nivel = Jefe
        //    - Del mismo departamento
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
                    AND u.Departamento = @Departamento", con);

                da.SelectCommand.Parameters.AddWithValue("@Departamento", departamentoJefe);

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

            lblId.Text = row.Cells[1].Text;
            lblMonto.Text = row.Cells[9].Text;
            pnlDetalle.Visible = true;
        }

        // 🔥 APROBAR (pasa a FINANCIERO según monto)
        protected void btnAprobar_Click(object sender, EventArgs e)
        {
            int idRequisicion = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();

                // 1️⃣ Aprobar como JEFE
                SqlCommand cmdJefe = new SqlCommand(@"
                    UPDATE Aprobacion
                    SET 
                        id_Aprobador = @idJefe,
                        FechaAprobacion = GETDATE(),
                        Decision = 'Aprobado',
                        Observaciones = @Obs
                    WHERE id_Requisicion = @Id
                    AND Nivel = 'Jefe'", con);

                cmdJefe.Parameters.AddWithValue("@idJefe", idJefe);
                cmdJefe.Parameters.AddWithValue("@Obs", txtObservaciones.Text);
                cmdJefe.Parameters.AddWithValue("@Id", idRequisicion);
                cmdJefe.ExecuteNonQuery();

                // 2️⃣ Insertar aprobación FINANCIERA
                SqlCommand cmdFin = new SqlCommand(@"
                    INSERT INTO Aprobacion (id_Requisicion, Nivel)
                    SELECT id_Requisicion, 'Financiero'
                    FROM Requisicion
                    WHERE id_Requisicion = @Id
                    AND NOT EXISTS (
                        SELECT 1 FROM Aprobacion
                        WHERE id_Requisicion = @Id
                        AND Nivel = 'Financiero'
                    )", con);

                cmdFin.Parameters.AddWithValue("@Id", idRequisicion);
                cmdFin.ExecuteNonQuery();
            }

            txtObservaciones.Text = "";
            pnlDetalle.Visible = false;
            CargarGrid();
        }

        // ❌ RECHAZAR
        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            int idRequisicion = Convert.ToInt32(gvRequisiciones.SelectedDataKey.Value);

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Aprobacion
                    SET 
                        id_Aprobador = @idJefe,
                        FechaAprobacion = GETDATE(),
                        Decision = 'Rechazado',
                        Observaciones = @Obs
                    WHERE id_Requisicion = @Id
                    AND Nivel = 'Jefe'", con);

                cmd.Parameters.AddWithValue("@idJefe", idJefe);
                cmd.Parameters.AddWithValue("@Obs", txtObservaciones.Text);
                cmd.Parameters.AddWithValue("@Id", idRequisicion);
                cmd.ExecuteNonQuery();

                SqlCommand cmdReq = new SqlCommand(
                    "UPDATE Requisicion SET Estado = 'Rechazada' WHERE id_Requisicion = @Id", con);

                cmdReq.Parameters.AddWithValue("@Id", idRequisicion);
                cmdReq.ExecuteNonQuery();
            }

            txtObservaciones.Text = "";
            pnlDetalle.Visible = false;
            CargarGrid();
        }
    }
}