using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Reports_Usage_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime DateStart = DateTime.Parse(Request.QueryString["Start"].ToString());
        DateTime DateEnd = DateTime.Parse(Request.QueryString["End"].ToString());
        Item cls = new Item();
        DataTable dt = cls.GetUsageForDatatable(DateStart.Month,DateStart.Year, DateEnd.Month, DateEnd.Year);
        string json = JsonConvert.SerializeObject(dt);
        Response.Write("{\"data\":");
        Response.Write(json);
        Response.Write("}");
    }
}