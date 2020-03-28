using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string uname = txtUsername.Text;
        string pword = txtPassword.Text;

        if (uname == "admin" && pword == "admin")
        {
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            string alert = "<div class=\"alert alert-danger\" role=\"alert\">";
            alert += "<button type =\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
            alert += "<span aria-hidden=\"true\">&times;</span>";
            alert += "</button> Authentication Failed";
            alert += "</div>";
            divnotif.InnerHtml= alert;
        }
    }
}