using Newtonsoft.Json;
using System;
using System.Data;

public partial class ajax_Item_Datatable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetItems();
    }

    private void GetItems()
    {
        Item cls = new Item();
        DataTable dt = cls.GetForDatatable();
        string json = JsonConvert.SerializeObject(dt);
        Response.Write("{\"data\":");
        Response.Write(json);
        Response.Write("}");
    }
}