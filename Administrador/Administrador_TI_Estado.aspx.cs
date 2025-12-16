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
    public partial class Administrador_TI_Estado : System.Web.UI.Page
    {
		string cn = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;

		protected void Button1_Click(object sender, EventArgs e)
		{
			// Validaciones básicas
			if (!int.TryParse(TextBox12.Text.Trim(), out int idUsuario))
				return;

			string estado = DropDownList1.SelectedValue == "Activar"
				? "Activo"
				: "Inactivo";

			string motivo = TextBox13.Text.Trim();

			using (SqlConnection con = new SqlConnection(cn))
			{
				string sql = @"
                UPDATE Usuario
                SET Estado = @estado
                WHERE id_Usuario = @id";

				SqlCommand cmd = new SqlCommand(sql, con);
				cmd.Parameters.AddWithValue("@estado", estado);
				cmd.Parameters.AddWithValue("@id", idUsuario);

				con.Open();
				int filas = cmd.ExecuteNonQuery();

				if (filas == 0)
					return;
			}

			// Registrar auditoría
			RegistrarAuditoria(idUsuario, estado, motivo);

			// Limpieza
			TextBox12.Text = "";
			TextBox13.Text = "";
		}

		private void RegistrarAuditoria(int usuario, string estado, string motivo)
		{
			using (SqlConnection con = new SqlConnection(cn))
			{
				SqlCommand cmd = new SqlCommand(@"
                INSERT INTO RegistroAuditoria
                (UsuarioResponsable, Accion, EntidadAfectada, IdEntidad, DescripcionCambio, Resultado)
                VALUES
                (@u, 'Cambio de Estado', 'Usuario', @u, @d, 'Éxito')", con);

				string descripcion = $"Estado cambiado a {estado}. Motivo: {motivo}";

				cmd.Parameters.AddWithValue("@u", usuario);
				cmd.Parameters.AddWithValue("@d", descripcion);

				con.Open();
				cmd.ExecuteNonQuery();
			}
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Administrador/Administrador_TI_Inicio.aspx");
		}
	}
}