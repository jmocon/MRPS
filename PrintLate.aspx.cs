﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintLate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblwho.InnerText = " (By: " + Session["name"].ToString() + ", " + DateTime.Now.ToString("MMMM d yyyy h:mm tt") + ")";

        lblCurrentDisplay.Text = DateTime.Now.ToString("yyyy");
        Produce cls = new Produce();
        int yy = int.Parse(DateTime.Now.ToString("yyyy"));

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Month" });
        th.Cells.Add(new TableHeaderCell { Text = "Count" });
        tbl_late.Rows.Add(th);


        for (int i = 1; i <= 12; i++)
        {
            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = new DateTime(yy, i, 1).ToString("MMMM") });
            tr.Cells.Add(new TableCell { Text = cls.GetLate(i, yy).ToString() });
            tbl_late.Rows.Add(tr);
        }
    }
}