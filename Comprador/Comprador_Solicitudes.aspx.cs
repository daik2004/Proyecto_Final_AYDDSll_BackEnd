using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Comprador_Solicitudes : System.Web.UI.Page
    {
		string cn = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{
			// 🔐 Control de acceso
			if (Session["Rol"] == null || Session["Rol"].ToString() != "Comprador")
			{
				Response.Redirect("~/Login.aspx");
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			// Validaciones básicas
			if (string.IsNullOrWhiteSpace(TextBox2.Text) ||
				string.IsNullOrWhiteSpace(TextBox4.Text))
			{
				return;
			}

			int idComprador = Convert.ToInt32(Session["idUsuario"]);

			using (SqlConnection con = new SqlConnection(cn))
			{
				string sql = @"
                INSERT INTO Requisicion
                (id_Comprador, Fecha_Creacion, Descripcion, Categoria,
                 CantidadSolicitada, UnidadMedida, MotivoSolicitud,
                 MetodoSolicitud, Monto, Estado)
                VALUES
                (@idComprador, GETDATE(), @descripcion, @categoria,
                 @cantidad, @unidad, @motivo,
                 'Web', @monto, 'Pendiente');

                SELECT SCOPE_IDENTITY();";

				SqlCommand cmd = new SqlCommand(sql, con);

				cmd.Parameters.AddWithValue("@idComprador", idComprador);
				cmd.Parameters.AddWithValue("@descripcion", txtDescripcion.Text.Trim());
				cmd.Parameters.AddWithValue("@categoria", ddlCategoria.SelectedValue);
				cmd.Parameters.AddWithValue("@cantidad", Convert.ToInt32(txtCantidad.Text));
				cmd.Parameters.AddWithValue("@unidad", ddlUnidad.SelectedValue);
				cmd.Parameters.AddWithValue("@motivo", txtMotivo.Text.Trim());
				cmd.Parameters.AddWithValue("@monto", Convert.ToDecimal(txtMonto.Text));

				con.Open();
				int idRequisicion = Convert.ToInt32(cmd.ExecuteScalar());

				// Registrar auditoría
				RegistrarAuditoria(idComprador, idRequisicion);

				LimpiarFormulario();
			}
		}

		private void RegistrarAuditoria(int usuario, int idRequisicion)
		{
			using (SqlConnection con = new SqlConnection(cn))
			{
				SqlCommand cmd = new SqlCommand(@"
                INSERT INTO RegistroAuditoria
                (UsuarioResponsable, Accion, EntidadAfectada, IdEntidad,
                 DescripcionCambio, Resultado)
                VALUES
                (@u, 'Crear Requisición', 'Requisicion', @id,
                 'Requisición creada por el comprador', 'Éxito')", con);

				cmd.Parameters.AddWithValue("@u", usuario);
				cmd.Parameters.AddWithValue("@id", idRequisicion);

				con.Open();
				cmd.ExecuteNonQuery();
			}
		}

		private void LimpiarFormulario()
		{
			txtCantidad.Text = "";
			txtDescripcion.Text = "";
			txtMonto.Text = "";
			txtMotivo.Text = "";
			ddlUnidad.SelectedIndex = 0;
			ddlCategoria.SelectedIndex = 0;
			ddlPrioridad.SelectedIndex = 0;
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Comprador/Comprador_Inicio.aspx");
		}
	}
}