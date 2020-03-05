using Newtonsoft.Json;
using System;
using System.Data;

public partial class ajax_MenuItem_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayTable();
    }

    private void DisplayTable()
    {
        MenuItem cls = new MenuItem();
        DataTable dt = cls.GetForDatatable(int.Parse(Request.QueryString["id"].ToString()));
        string json = JsonConvert.SerializeObject(dt);
        Response.Write("{\"data\":");
        Response.Write(json);
        Response.Write("}");
    }
}