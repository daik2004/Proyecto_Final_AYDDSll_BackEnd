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
    public partial class Administrador_TI_Rol1 : System.Web.UI.Page
    {
        string conexion = ConfigurationManager
           .ConnectionStrings["Auditoria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList2.Visible = false;
            }
        }

        // 🔹 Mostrar / ocultar combo financiero
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Financiero")
                DropDownList2.Visible = true;
            else
                DropDownList2.Visible = false;
        }

        // 🔹 Asignar rol
        protected void Button1_Click(object sender, EventArgs e)
        {
            int idUsuario = Convert.ToInt32(TextBox12.Text);
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

        // 🔹 Determinar id_Rol según selección
        int ObtenerIdRolSeleccionado()
        {
            string rolPrincipal = DropDownList1.SelectedValue;

            if (rolPrincipal == "Administrador") return 1;
            if (rolPrincipal == "Comprador") return 2;
            if (rolPrincipal == "Aprobador Jefe") return 3;

            if (rolPrincipal == "Financiero")
            {
                if (DropDownList2.SelectedValue == "Aprobador 1") return 4;
                if (DropDownList2.SelectedValue == "Aprobador 2") return 5;
                if (DropDownList2.SelectedValue == "Aprobador 3") return 6;
            }

            return 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrador_Inicio.aspx");
        }

     
    }
}