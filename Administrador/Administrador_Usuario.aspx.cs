using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Proyecto_Final_Diseño_
{
    public partial class Administrador_Usuario : System.Web.UI.Page
    {
        string cn = ConfigurationManager
            .ConnectionStrings["Auditoria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarRoles();
        }

        void CargarRoles()
        {
            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id_Rol, Nombre FROM Rol", con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlRol.Items.Clear();
                ddlRol.Items.Add("-- Seleccione Rol --");

                while (dr.Read())
                {
                    ddlRol.Items.Add(
                        new System.Web.UI.WebControls.ListItem(
                            dr["Nombre"].ToString(),
                            dr["id_Rol"].ToString()
                        )
                    );
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int idRol = Convert.ToInt32(ddlRol.SelectedValue);

                using (SqlConnection con = new SqlConnection(cn))
                {
                    string sql = @"
                    INSERT INTO Usuario
                    (Usuario, Cedula, Nombre, Apellido1, Email,
                     Contrasena, id_Rol, Departamento, FechaNacimiento, Estado)
                    VALUES
                    (@usuario, @cedula, @nombre, @apellido, @correo,
                     'Temp123', @rol, @depto, @fecha, 'Activo')";

                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@usuario", txtUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@cedula", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@nombre", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@apellido", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@correo", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@rol", idRol);
                    cmd.Parameters.AddWithValue("@depto", TextBox10.Text.Trim());

                    if (DateTime.TryParse(TextBox9.Text, out DateTime fecha))
                        cmd.Parameters.AddWithValue("@fecha", fecha);
                    else
                        cmd.Parameters.AddWithValue("@fecha", DBNull.Value);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMensaje.Text = "✅ Usuario creado correctamente";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                LimpiarCampos();
            }
            catch (SqlException ex)
            {
                lblMensaje.Text = "⚠ Error: usuario o cédula duplicada";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        void LimpiarCampos()
        {
            txtUser.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";

            ddlRol.SelectedIndex = 0;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrador/Administrador_TI_Inicio.aspx");
        }
    }
}
