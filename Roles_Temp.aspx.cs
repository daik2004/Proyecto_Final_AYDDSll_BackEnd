using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Roles_Temp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comprador_Inicio.aspx");
        }

        protected void Btn_Jefe_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Jefe_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Jefe_Inicio.aspx");
        }

        protected void Financiero_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio_Financiero.aspx");
        }

        protected void Administrador_TI_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrador_TI_Inicio.aspx");
        }
    }
}