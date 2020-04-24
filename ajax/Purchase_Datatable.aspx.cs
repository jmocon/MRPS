using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Purchase_Datatable : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Cart"] == null)
        {
            Purchase cls = new Purchase();
            DataTable dt = cls.GetForDatatable();
            string json = JsonConvert.SerializeObject(dt);
            Response.Write("{\"data\":");
            Response.Write(json);
            Response.Write("}");
        }
        else
        {
            Purchase cls = new Purchase();
            DataTable dt = cls.GetForDatatable(int.Parse(Request.QueryString["Cart"].ToString()));
            string json = JsonConvert.SerializeObject(dt);
            Response.Write("{\"data\":");
            Response.Write(json);
            Response.Write("}");
        }
    }
}