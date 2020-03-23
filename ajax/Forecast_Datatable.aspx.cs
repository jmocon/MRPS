using Newtonsoft.Json;
using System;
using System.Data;

public partial class ajax_Forecast_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Forecast cls = new Forecast();
        DataTable dt = cls.GetForDatatable();
        string json = JsonConvert.SerializeObject(dt);
        Response.Write("{\"data\":");
        Response.Write(json);
        Response.Write("}");
    }
}