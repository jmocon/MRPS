using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

public partial class Deliveries : System.Web.UI.Page
{
    private int purchaseId = 0;
    private List<PurchaseModel> lstPurchase;
    private List<TextBox> lsttxt = new List<TextBox>();

    protected void Page_Load(object sender, EventArgs e)
    {
        purchaseId = int.Parse(Request.QueryString["Id"].ToString());
        txt_Purchase_Id.Value = purchaseId.ToString();
        txt_DateReceived.Value = DateTime.Now.ToString("yyyy-MM-dd");
        PopulateDelivery(purchaseId);
        PopulateItems();
    }

    private void PopulateItems()
    {
        Purchase cls = new Purchase();

        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Item" });
        th.Cells.Add(new TableHeaderCell { Text = "Received" });
        tbl_Items.Rows.Add(th);

        lstPurchase = cls.GetByPurchaseCart_Id(purchaseId);
        foreach (PurchaseModel mdl in lstPurchase)
        {
            TextBox txt = new TextBox
            {
                CssClass = "form-control",
                Text = "0",
                ID = "txtItem_" + mdl.Item_Id
            };

            Item clsItem = new Item();
            ItemModel mdlItem = clsItem.GetById(mdl.Item_Id);

            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = mdlItem.Name });
            tr.Cells.Add(new TableCell { Text = "" });
            tr.Cells[1].Controls.Add(txt);
            tbl_Items.Rows.Add(tr);
            lsttxt.Add(txt);
        }
    }

    private void PopulateDelivery(int Purchase_Id)
    {
        tbl_Delivery.Rows.Clear();
        TableHeaderRow th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Code" });
        th.Cells.Add(new TableHeaderCell { Text = "Item" });
        th.Cells.Add(new TableHeaderCell { Text = "Date Received" });
        th.Cells.Add(new TableHeaderCell { Text = "Action" });
        th.TableSection = TableRowSection.TableHeader;
        tbl_Delivery.Rows.Add(th);

        Delivery cls = new Delivery();
        List<DeliveryModel> lst = cls.GetCodeByPurchaseCart_Id(purchaseId);
        string items = "";
        foreach (DeliveryModel mdl in lst)
        {
            Button btn = new Button
            {
                CssClass = "btn btn-danger",
                Text = "Delete",
                CommandName = "Code",
                CommandArgument = mdl.Code,
                ID = "btn_Delete_" + mdl.Code
            };

            btn.Click += Delete_Click;

            items = "";
            foreach (DataRow dr in cls.GetItemDetailByCode(mdl.Code).Rows)
            {
                if (items != "")
                {
                    items += "<br />";
                }
                items += dr["Name"].ToString() + ": " + dr["Quantity"].ToString() + dr["Abbr"].ToString();
            }

            TableRow tr = new TableRow();
            tr.Cells.Add(new TableCell { Text = mdl.Code });
            tr.Cells.Add(new TableCell { Text = items });
            tr.Cells.Add(new TableCell { Text = mdl.DateReceived.ToString("MMMM d, yyyy") });
            tr.Cells.Add(new TableCell { Text = "" });
            tr.Cells[3].Controls.Add(btn);
            tbl_Delivery.Rows.Add(tr);
        }

        th = new TableHeaderRow();
        th.Cells.Add(new TableHeaderCell { Text = "Code" });
        th.Cells.Add(new TableHeaderCell { Text = "Item" });
        th.Cells.Add(new TableHeaderCell { Text = "Date Received" });
        th.Cells.Add(new TableHeaderCell { Text = "Action" });
        th.TableSection = TableRowSection.TableFooter;
        tbl_Delivery.Rows.Add(th);
    }

    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        if (txt_Code.Value == "")
        {
            modalAdd_notif.InnerHtml = " <div class=\"alert alert-danger\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Please Complete all the fields</div>";
        }
        else
        {
            Item clsItem = new Item();
            Delivery clsDelivery = new Delivery();
            int itemId = 0;

            if (clsDelivery.IsCodeExist(txt_Code.Value))
            {
                modalAdd_notif.InnerHtml = " <div class=\"alert alert-danger\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Delivery Code Already Exists!</div>";

            }
            else
            {
                foreach (TextBox item in lsttxt)
                {
                    itemId = int.Parse(item.ID.Substring(8));
                    decimal quan = 0;
                    if (item.Text != "")
                    {
                        quan = decimal.Parse(item.Text);
                    }
                    DeliveryModel mdlD = new DeliveryModel
                    {
                        Code = txt_Code.Value,
                        Item_Id = itemId,
                        Quantity = quan,
                        Unit_Id = clsItem.GetUnit_IdById(itemId),
                        DateReceived = DateTime.Parse(txt_DateReceived.Value),
                        PurchaseCart_Id = int.Parse(txt_Purchase_Id.Value)
                    };
                    clsDelivery.Add(mdlD);
                }

                modalAdd_notif.InnerHtml = " <div class=\"alert alert-success\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Successfully Added New Delivery</div>";
                PopulateDelivery(purchaseId);
                txt_Code.Value = "";
                foreach (TextBox item in lsttxt)
                {
                    item.Text = "0";
                }
                UpdateQuantity();
            }
        }
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        Delivery cls = new Delivery();
        Button btn = (Button)sender;
        string code = btn.CommandArgument;
        cls.DeleteByCode(code);
        PopulateDelivery(purchaseId);
        modalAdd_notif.InnerHtml = " <div class=\"alert alert-success\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>Successfully Deleted Delivery</div>";
        UpdateQuantity();
    }

    private void UpdateQuantity()
    {
        Purchase cls = new Purchase();
        Delivery clsD = new Delivery();

        lstPurchase = cls.GetByPurchaseCart_Id(purchaseId);
        foreach (PurchaseModel mdl in lstPurchase)
        {
            clsD.ReflectQuantity(mdl.Item_Id, mdl.PurchaseCart_Id);
        }
    }
}