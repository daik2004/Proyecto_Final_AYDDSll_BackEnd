using Proyecto_Final_Diseño_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_Diseño_
{
    public partial class Inicio_Financiero : System.Web.UI.Page
    {

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }

        protected void ImageButton3_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Financiero_Gestión.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Financiero_Reportes.aspx");
        }

    }
}
