using System;
using System.Collections.Generic;

public partial class Purchases : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateType();
        PopulateItem();
        PopulateSupplier();
        PopulateUnit();
    }

    private void PopulateType()
    {
        List<DropdownModel> lst = new List<DropdownModel>
        {
            new DropdownModel {Value = "0", Text = "Buy"},
            new DropdownModel {Value = "1", Text = "Sold"},
            new DropdownModel {Value = "2", Text = "Spoiled"},
            new DropdownModel {Value = "3", Text = "Subsidized"},
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

    private void PopulateSupplier()
    {
        Supplier cls = new Supplier();

        sel_Add_Supplier.DataSource = cls.GetForDropdown();
        sel_Add_Supplier.DataValueField = "Id";
        sel_Add_Supplier.DataTextField = "Name";
        sel_Add_Supplier.DataBind();

        sel_Edit_Supplier.DataSource = cls.GetForDropdown();
        sel_Edit_Supplier.DataValueField = "Id";
        sel_Edit_Supplier.DataTextField = "Name";
        sel_Edit_Supplier.DataBind();
    }

    private void PopulateUnit()
    {
        Unit cls = new Unit();

        sel_Add_Unit.DataSource = cls.GetForDropdown();
        sel_Add_Unit.DataValueField = "Id";
        sel_Add_Unit.DataTextField = "Name";
        sel_Add_Unit.DataBind();

        sel_Edit_Unit.DataSource = cls.GetForDropdown();
        sel_Edit_Unit.DataValueField = "Id";
        sel_Edit_Unit.DataTextField = "Name";
        sel_Edit_Unit.DataBind();

        sel_Edit_R_Unit.DataSource = cls.GetForDropdown();
        sel_Edit_R_Unit.DataValueField = "Id";
        sel_Edit_R_Unit.DataTextField = "Name";
        sel_Edit_R_Unit.DataBind();
    }
}