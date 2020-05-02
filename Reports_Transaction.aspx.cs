using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Reports_Transaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txt_Start_Date.Text = DateTime.Now.ToString("yyyy-MM");
            txt_End_Date.Text = DateTime.Now.ToString("yyyy-MM");
        }
        GetPurchaseCount();
        LoadBestSellers();
    }

    private void GetPurchaseCount()
    {
        btnPrint.HRef = "PrintSummary.aspx?Start="+ txt_Start_Date.Text + "&End=" + txt_End_Date.Text;
        DateTime DateStart = DateTime.Parse(txt_Start_Date.Text);
        DateTime DateEnd = DateTime.Parse(txt_End_Date.Text);
        int StartMonth = DateStart.Month;
        int StartYear = DateStart.Year;
        int EndMonth = DateEnd.Month;
        int EndYear = DateEnd.Year;

        if (DateStart > DateEnd)
        {
            txt_End_Date.CssClass = "is-invalid " + txt_End_Date.CssClass;
        }
        else
        {
            txt_End_Date.CssClass = txt_End_Date.CssClass.Replace("is-invalid ", "");
        }

        Purchase clsPurchase = new Purchase();
        div_buy_count.InnerText = clsPurchase.GetBuyCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
        div_sold_count.InnerText = clsPurchase.GetSoldCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
        div_spoiled_count.InnerText = clsPurchase.GetSpoiledCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
        div_subsidized_count.InnerText = clsPurchase.GetSubsidizedCount(StartMonth, StartYear, EndMonth, EndYear).ToString();
    }

    private void LoadBestSellers()
    {
        DateTime DateStart = DateTime.Parse(txt_Start_Date.Text);
        DateTime DateEnd = DateTime.Parse(txt_End_Date.Text);
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