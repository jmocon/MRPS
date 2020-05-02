using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class PrintUsage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime DateStart = DateTime.Parse(Request.QueryString["Start"].ToString());
        DateTime DateEnd = DateTime.Parse(Request.QueryString["End"].ToString());
        Item cls = new Item();
        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Name" });
        th.Cells.Add(new TableHeaderCell { Text = "Buy" });
        th.Cells.Add(new TableHeaderCell { Text = "Sold" });
        th.Cells.Add(new TableHeaderCell { Text = "Spoiled" });
        th.Cells.Add(new TableHeaderCell { Text = "Subsidized" });
        th.Cells.Add(new TableHeaderCell { Text = "Produced" });
        Table1.Rows.Add(th);

        foreach (DataRow dr in cls.GetUsageForDatatable(DateStart.Month, DateStart.Year, DateEnd.Month, DateEnd.Year).Rows)
        {
            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = dr["Name"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Buy"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Sold"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Spoiled"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Subsidized"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Produced"].ToString() });
            Table1.Rows.Add(tr);
        }

        dates.InnerText = " (Start Date: "+DateStart.ToString("MMMM yyyy")+" | End Date: "+ DateStart.ToString("MMMM yyyy") + ")";
        lblwho.InnerText = "By: "+Session["name"].ToString() +", "+ DateTime.Now.ToString("MMMM d yyyy h:mm tt");
    }
}