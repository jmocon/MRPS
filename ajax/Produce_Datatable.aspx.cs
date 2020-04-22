using Newtonsoft.Json;
using System;
using System.Data;

public partial class ajax_Produce_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Cart"] == null)
        {
            Produce cls = new Produce();
            DataTable dt = cls.GetForDatatable();
            string json = JsonConvert.SerializeObject(dt);
            Response.Write("{\"data\":");
            Response.Write(json);
            Response.Write("}");
        }
        else
        {
            Produce cls = new Produce();
            DataTable dt = cls.GetForDatatable(int.Parse(Request.QueryString["Cart"].ToString()));
            string json = JsonConvert.SerializeObject(dt);
            Response.Write("{\"data\":");
            Response.Write(json);
            Response.Write("}");
        }
    }
}