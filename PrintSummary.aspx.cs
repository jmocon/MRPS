using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime DateStart = DateTime.Parse(Request.QueryString["Start"].ToString());
        DateTime DateEnd = DateTime.Parse(Request.QueryString["End"].ToString());
        dates.InnerText = " (Start Date: " + DateStart.ToString("MMMM yyyy") + " | End Date: " + DateStart.ToString("MMMM yyyy") + ")";
        lblwho.InnerText = " (By: " + Session["name"].ToString() + ", " + DateTime.Now.ToString("MMMM d yyyy h:mm tt") + ")";
        GetPurchaseCount();
        LoadBestSellers();
    }

    private void GetPurchaseCount()
    {
        DateTime DateStart = DateTime.Parse(Request.QueryString["Start"].ToString());
        DateTime DateEnd = DateTime.Parse(Request.QueryString["End"].ToString());
        int StartMonth = DateStart.Month;
        int StartYear = DateStart.Year;
        int EndMonth = DateEnd.Month;
        int EndYear = DateEnd.Year;

        Purchase clsPurchase = new Purchase();
        div_buy_count.InnerText = clsPurchase.GetBuyCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
        div_sold_count.InnerText = clsPurchase.GetSoldCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
        div_spoiled_count.InnerText = clsPurchase.GetSpoiledCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
        div_subsidized_count.InnerText = clsPurchase.GetSubsidizedCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
    }

    private void LoadBestSellers()
    {
        DateTime DateStart = DateTime.Parse(Request.QueryString["Start"].ToString());
        DateTime DateEnd = DateTime.Parse(Request.QueryString["End"].ToString());
        int StartMonth = DateStart.Month;
        int StartYear = DateStart.Year;
        int EndMonth = DateEnd.Month;
        int EndYear = DateEnd.Year;
        Produce cls = new Produce();

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Menu" });
        th.Cells.Add(new TableHeaderCell { Text = "Count" });
        tbl_betsellers.Rows.Add(th);

        foreach (DataRow dr in cls.GetBestSeller(StartMonth, StartYear, EndMonth, EndYear).Rows)
        {
            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = dr["Name"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Count"].ToString() });
            tbl_betsellers.Rows.Add(tr);
        }
    }
}