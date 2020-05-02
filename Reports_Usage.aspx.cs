using System;

public partial class Reports_Usage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckInput();
    }

    private void CheckInput()
    {
        btnPrint.HRef = "PrintUsage.aspx?Start=" + txt_Start_Date.Text + "&End=" + txt_End_Date.Text;
        if (!IsPostBack)
        {
            txt_Start_Date.Text = DateTime.Now.ToString("yyyy-MM");
            txt_End_Date.Text = DateTime.Now.ToString("yyyy-MM");
        }
        DateTime DateStart = DateTime.Parse(txt_Start_Date.Text);
        DateTime DateEnd = DateTime.Parse(txt_End_Date.Text);

        if (DateStart > DateEnd)
        {
            txt_End_Date.CssClass = "is-invalid " + txt_End_Date.CssClass;
        }
        else
        {
            txt_End_Date.CssClass = txt_End_Date.CssClass.Replace("is-invalid ", "");
        }
    }
}