using Newtonsoft.Json;
using System;
using System.Data;

public partial class ajax_Menu_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Menus clsMenu = new Menus();
        DataTable dt = clsMenu.GetForDatatable();
        string json = JsonConvert.SerializeObject(dt);
        Response.Write("{\"data\":");
        Response.Write(json);
        Response.Write("}");
    }
}