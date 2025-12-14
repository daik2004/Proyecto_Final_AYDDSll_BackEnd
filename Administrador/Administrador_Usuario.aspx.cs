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
    public partial class Administrador_Usuario : System.Web.UI.Page
    {
		string cn = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;

		protected void Button1_Click(object sender, EventArgs e)
		{
			// Validación básica
			if (string.IsNullOrWhiteSpace(txtUser.Text) ||
				string.IsNullOrWhiteSpace(TextBox5.Text) ||
				string.IsNullOrWhiteSpace(TextBox6.Text) ||
				string.IsNullOrWhiteSpace(TextBox7.Text) ||
				string.IsNullOrWhiteSpace(TextBox8.Text))
			{
				return; // aquí puedes mostrar Label de error si quieres
			}

			// Contraseña temporal
			string passwordTemporal = "Temp123";

			// Rol por defecto → Comprador
			int idRol = 2;

			using (SqlConnection con = new SqlConnection(cn))
			{
				string sql = @"
                INSERT INTO Usuario
                (Usuario, Cedula, Nombre, Apellido1, Email, Contrasena, id_Rol, Departamento, FechaNacimiento, Estado)
                VALUES
                (@usuario, @cedula, @nombre, @apellido, @correo, @clave, @rol, @depto, @fecha, 'Activo')";

				SqlCommand cmd = new SqlCommand(sql, con);

				cmd.Parameters.AddWithValue("@usuario", txtUser.Text.Trim());
				cmd.Parameters.AddWithValue("@cedula", TextBox7.Text.Trim());
				cmd.Parameters.AddWithValue("@nombre", TextBox5.Text.Trim());
				cmd.Parameters.AddWithValue("@apellido", TextBox6.Text.Trim());
				cmd.Parameters.AddWithValue("@correo", TextBox8.Text.Trim());
				cmd.Parameters.AddWithValue("@clave", passwordTemporal);
				cmd.Parameters.AddWithValue("@rol", idRol);
				cmd.Parameters.AddWithValue("@depto", TextBox10.Text.Trim());

				if (DateTime.TryParse(TextBox9.Text, out DateTime fecha))
					cmd.Parameters.AddWithValue("@fecha", fecha);
				else
					cmd.Parameters.AddWithValue("@fecha", DBNull.Value);

				con.Open();
				cmd.ExecuteNonQuery();
			}

			// Limpieza de campos
			txtUser.Text = "";
			TextBox5.Text = "";
			TextBox6.Text = "";
			TextBox7.Text = "";
			TextBox8.Text = "";
			TextBox9.Text = "";
			TextBox10.Text = "";
		}

		protected void Button3_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Administrador/Administrador_TI_Inicio.aspx");
		}
	}
}