using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

public partial class Criticals : System.Web.UI.Page
{
    private List<CriticalModel> lst;

    protected void Page_Load(object sender, EventArgs e)
    {
        lst = new List<CriticalModel>();
        LoadCirical();
    }

    private void LoadCirical()
    {
        Item cls = new Item();

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Item" });
        th.Cells.Add(new TableHeaderCell { Text = "Current" });
        th.Cells.Add(new TableHeaderCell { Text = "Critical Level" });
        tbl_critical.Rows.Add(th);

        foreach (DataRow dr in cls.GetCurrentQuantity().Rows)
        {
            decimal q = decimal.Parse(dr["Quantity"].ToString());
            decimal n = decimal.Parse(dr["Needs"].ToString());
            decimal c = decimal.Parse(dr["Critical"].ToString());

            if (q < n || q < c)
            {
                TableRow tr = new TableRow();
                tr.Cells.Add(new TableCell { Text = dr["Name"].ToString() });
                tr.Cells.Add(new TableCell { Text = (dr["Quantity"].ToString() + " " + dr["Unit_Abbr"].ToString()) });
                if (n < c)
                {
                    tr.Cells.Add(new TableCell { Text = (dr["Critical"].ToString() + " " + dr["Unit_Abbr"].ToString()) });
                }
                else
                {
                    CriticalLevel clsCL = new CriticalLevel();
                    CriticalLevelModel mdlCL = new CriticalLevelModel
                    {
                        Item_Id = int.Parse(dr["Id"].ToString()),
                        Quantity = decimal.Parse(dr["Needs"].ToString()),
                        Unit_Id = int.Parse(dr["Unit"].ToString())
                    };

                    clsCL.Delete(int.Parse(dr["Id"].ToString()));
                    clsCL.Add(mdlCL);
                    tr.Cells.Add(new TableCell { Text = (dr["Needs"].ToString() + " " + dr["Unit_Abbr"].ToString()) });
                }
                tbl_critical.Rows.Add(tr);
            }
        }
    }

    private void LoadItems()
    {
        Item clsItem = new Item();
        DataTable dt = clsItem.GetCurrentQuantity();
        foreach (DataRow dr in dt.Rows)
        {
            lst.Add(new CriticalModel
            {
                Id = int.Parse(dr["Id"].ToString()),
                Name = dr["Name"].ToString(),
                Current = decimal.Parse(dr["Quantity"].ToString()),
                Needed = decimal.Parse(dr["Needs"].ToString())
            });
        }
    }
}

public class CriticalModel
{
    public CriticalModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Current { get; set; }
    public decimal Needed { get; set; }
}