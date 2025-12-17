using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Proyecto_Final_Diseño_
{
    public partial class Administrador_TI_Estado : System.Web.UI.Page
    {
        string cn = ConfigurationManager
            .ConnectionStrings["Auditoria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        // 🔹 Cargar usuarios activos
        void CargarUsuarios()
        {
            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id_Usuario FROM Usuario", con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                ddlUsuarios.Items.Clear();
                ddlUsuarios.Items.Add("-- Seleccione Usuario --");

                while (dr.Read())
                {
                    ddlUsuarios.Items.Add(dr["id_Usuario"].ToString());
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ddlUsuarios.SelectedIndex == 0)
                return;

            int idUsuario = Convert.ToInt32(ddlUsuarios.SelectedValue);

            string estado = DropDownList1.SelectedValue == "Activar"
                ? "Activo"
                : "Inactivo";

            string motivo = TextBox13.Text.Trim();

            using (SqlConnection con = new SqlConnection(cn))
            {
                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Usuario
                    SET Estado = @estado
                    WHERE id_Usuario = @id", con);

                cmd.Parameters.AddWithValue("@estado", estado);
                cmd.Parameters.AddWithValue("@id", idUsuario);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            RegistrarAuditoria(idUsuario, estado, motivo);

            ddlUsuarios.SelectedIndex = 0;
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
