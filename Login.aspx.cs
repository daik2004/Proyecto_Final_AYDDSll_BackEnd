using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            String user = txtUsuario.Text;
            int Password;


            Password = int.Parse(txtContrasena.Text);

            if (user == "Anderson" && Password == 1234)
            {
                Response.Redirect("~/Comprador/Comprador_Inicio.aspx");
            }
            else if (user =="Danny" && Password == 1234)
            {
                Response.Redirect("~/Jefe/Jefe_Inicio.aspx");
            }
            else if (user == "Aaron" && Password == 1234)
            {
                Response.Redirect("~/Financiero/Inicio_Financiero.aspx");
            }
            else if (user == "Daimary")
            {
                Response.Redirect("~/Administrador/Administrador_TI_Inicio.aspx");
            }
            else
            {
                lb_mensaje.Text = "User o Password incorrecta!";
            }

            

            //Response.Redirect("Roles_Temp.aspx");
        }
    }
}