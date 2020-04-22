using System;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Session["id"].ToString() != "1")
        {
            Response.Redirect("Login.aspx");
        }
    }
}