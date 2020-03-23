using System;
using System.Collections.Generic;

public partial class Forecasts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateItem();
        PopulateType();
    }

    private void PopulateItem()
    {
        Item cls = new Item();

        sel_Add_Item.DataSource = cls.GetForDropdown();
        sel_Add_Item.DataValueField = "Id";
        sel_Add_Item.DataTextField = "Name";
        sel_Add_Item.DataBind();

        sel_Edit_Item.DataSource = cls.GetForDropdown();
        sel_Edit_Item.DataValueField = "Id";
        sel_Edit_Item.DataTextField = "Name";
        sel_Edit_Item.DataBind();
    }

    private void PopulateType()
    {
        List<DropdownModel> lst = new List<DropdownModel>
        {
            new DropdownModel {Value = "0", Text = "Daily"},
            new DropdownModel {Value = "1", Text = "Weekly"},
            new DropdownModel {Value = "2", Text = "Monthly"}
        };

        sel_Add_Type.DataSource = lst;
        sel_Add_Type.DataValueField = "Value";
        sel_Add_Type.DataTextField = "Text";
        sel_Add_Type.DataBind();

        sel_Edit_Type.DataSource = lst;
        sel_Edit_Type.DataValueField = "Value";
        sel_Edit_Type.DataTextField = "Text";
        sel_Edit_Type.DataBind();
    }
}