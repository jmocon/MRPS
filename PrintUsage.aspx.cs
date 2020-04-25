using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class PrintUsage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Item cls = new Item();
        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Name" });
        th.Cells.Add(new TableHeaderCell { Text = "Buy" });
        th.Cells.Add(new TableHeaderCell { Text = "Sold" });
        th.Cells.Add(new TableHeaderCell { Text = "Spoiled" });
        th.Cells.Add(new TableHeaderCell { Text = "Subsidized" });
        th.Cells.Add(new TableHeaderCell { Text = "Produced" });
        Table1.Rows.Add(th);

        foreach (DataRow dr in cls.GetUsageForDatatable().Rows)
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
    }
}