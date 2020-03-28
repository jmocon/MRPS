using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports_ProductionPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadOverall();
        LoadLastMonth();
    }

    private void LoadOverall()
    {
        Produce cls = new Produce();

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Menu" });
        th.Cells.Add(new TableHeaderCell { Text = "Lowest" });
        th.Cells.Add(new TableHeaderCell { Text = "Average" });
        th.Cells.Add(new TableHeaderCell { Text = "Highest" });
        tbl_overall.Rows.Add(th);

        foreach (DataRow dr in cls.GetOverallStats().Rows)
        {
            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = dr["Name"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["MIN"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["AVG"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["MAX"].ToString() });
            tbl_overall.Rows.Add(tr);
        }
    }

    private void LoadLastMonth()
    {
        Produce cls = new Produce();

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Menu" });
        th.Cells.Add(new TableHeaderCell { Text = "Lowest" });
        th.Cells.Add(new TableHeaderCell { Text = "Average" });
        th.Cells.Add(new TableHeaderCell { Text = "Highest" });
        tbl_lastmonth.Rows.Add(th);

        foreach (DataRow dr in cls.LastMonthStats().Rows)
        {
            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = dr["Name"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["MIN"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["AVG"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["MAX"].ToString() });
            tbl_lastmonth.Rows.Add(tr);
        }
    }
}