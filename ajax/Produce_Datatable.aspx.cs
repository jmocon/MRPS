using Newtonsoft.Json;
using System;
using System.Data;

public partial class ajax_Produce_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Produce cls = new Produce();
        DataTable dt = cls.GetForDatatable();
        string json = JsonConvert.SerializeObject(dt);
        Response.Write("{\"data\":");
        Response.Write(json);
        Response.Write("}");
    }
}