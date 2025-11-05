using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Administrador_TI_Inicio : System.Web.UI.Page
    {
    
     
        protected void ImageButton3_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Administrador_Usuario.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Administrador_TI_Estado.aspx");
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Administrador_TI_Rol.aspx");
        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }
    }
}