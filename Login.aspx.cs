using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Login : System.Web.UI.Page
    {
		string cn = ConfigurationManager.ConnectionStrings["Auditoria"].ConnectionString;

		protected void btnIngresar_Click(object sender, EventArgs e)

		{

			using (SqlConnection con = new SqlConnection(cn))
			{
				string sql = @"
                SELECT u.id_Usuario, r.Nombre AS Rol
                FROM Usuario u
                INNER JOIN Rol r ON u.id_Rol = r.id_Rol
                WHERE u.Usuario = @usuario
                  AND u.Contrasena = @clave
                  AND u.Estado = 'Activo'";

				SqlCommand cmd = new SqlCommand(sql, con);
				cmd.Parameters.AddWithValue("@usuario", txtUsuario.Text.Trim());
				cmd.Parameters.AddWithValue("@clave", txtContrasena.Text.Trim());

				con.Open();
				SqlDataReader dr = cmd.ExecuteReader();

				if (dr.Read())
				{
					int idUsuario = Convert.ToInt32(dr["id_Usuario"]);
					string rol = dr["Rol"].ToString();

					Session["idUsuario"] = idUsuario;
					Session["Rol"] = rol;

					RegistrarAuditoria(idUsuario, "Login", "Inicio de sesión exitoso");

					// Redirección por rol
					if (rol == "Administrador")
						Response.Redirect("~/Administrador/Administrador_TI_Inicio.aspx");

					else if (rol == "Comprador")
						Response.Redirect("~/Comprador/Comprador_Inicio.aspx");

					else if (rol == "Aprobador Jefe")
						Response.Redirect("~/Jefe/Jefe_Inicio.aspx");

					else if (rol == "Aprobador Financiero")
						Response.Redirect("~/Financiero/Inicio_Financiero.aspx");

					else
						lb_mensaje.Text = "Rol no autorizado.";
				}
				else
				{
					lb_mensaje.Text = "Usuario o contraseña incorrectos.";
				}
			}
		}

		private void RegistrarAuditoria(int usuario, string accion, string descripcion)
		{
			using (SqlConnection con = new SqlConnection(cn))
			{
				SqlCommand cmd = new SqlCommand(@"
                INSERT INTO RegistroAuditoria
                (UsuarioResponsable, Accion, EntidadAfectada, IdEntidad, DescripcionCambio, Resultado)
                VALUES (@u, @a, 'Login', @u, @d, 'Éxito')", con);

				cmd.Parameters.AddWithValue("@u", usuario);
				cmd.Parameters.AddWithValue("@a", accion);
				cmd.Parameters.AddWithValue("@d", descripcion);

				con.Open();
				cmd.ExecuteNonQuery();
			}
		}
	}
}