using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Reports_Transaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCurrentDisplay.Text = DateTime.Now.ToString("MMMM yyyy");
        GetPurchaseCount();
        LoadBestSellers();
    }

    private void GetPurchaseCount()
    {
        Purchase clsPurchase = new Purchase();
        div_buy_count.InnerText = clsPurchase.GetBuyCount().ToString();
        div_sold_count.InnerText = clsPurchase.GetSoldCount().ToString();
        div_spoiled_count.InnerText = clsPurchase.GetSpoiledCount().ToString();
        div_subsidized_count.InnerText = clsPurchase.GetSubsidizedCount().ToString();
    }

    private void LoadBestSellers()
    {
        Produce cls = new Produce();

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Menu" });
        th.Cells.Add(new TableHeaderCell { Text = "Count" });
        tbl_betsellers.Rows.Add(th);

        foreach (DataRow dr in cls.GetBestSeller().Rows)
        {
            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = dr["Name"].ToString() });
            tr.Cells.Add(new TableCell { Text = dr["Count"].ToString() });
            tbl_betsellers.Rows.Add(tr);
        }
    }
}