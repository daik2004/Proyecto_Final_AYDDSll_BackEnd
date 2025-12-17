using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Proyecto_Final_Diseño_
{
    public partial class Administrador_TI_Rol1 : System.Web.UI.Page
    {
        string conexion = ConfigurationManager
            .ConnectionStrings["Auditoria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
                DropDownList2.Visible = false;
            }
        }

        // 🔹 Cargar IDs de usuarios
        void CargarUsuarios()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT id_Usuario FROM Usuario WHERE Estado = 'Activo'", con);

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

        // 🔹 Mostrar / ocultar rol financiero
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Visible = DropDownList1.SelectedValue == "Financiero";
        }

        // 🔹 Asignar rol
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ddlUsuarios.SelectedIndex == 0) return;

            int idUsuario = Convert.ToInt32(ddlUsuarios.SelectedValue);
            int idRol = ObtenerIdRolSeleccionado();

            if (idRol == 0) return;

            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Usuario SET id_Rol = @Rol WHERE id_Usuario = @Id", con);

                cmd.Parameters.AddWithValue("@Rol", idRol);
                cmd.Parameters.AddWithValue("@Id", idUsuario);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // 🔹 Determinar id_Rol
        int ObtenerIdRolSeleccionado()
        {
            if (DropDownList1.SelectedValue == "Administrador") return 1;
            if (DropDownList1.SelectedValue == "Comprador") return 2;

            if (DropDownList1.SelectedValue == "Financiero")
            {
                if (DropDownList2.SelectedValue == "Aprobador Financiero 1") return 4;
                if (DropDownList2.SelectedValue == "Aprobador Financiero 2") return 5;
                if (DropDownList2.SelectedValue == "Aprobador Financiero 3") return 6;
                if (DropDownList2.SelectedValue == "Aprobador Jefe") return 3;
            }

            return 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrador_Inicio.aspx");
        }
    }
}
