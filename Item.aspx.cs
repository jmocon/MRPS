using System;

public partial class ItemList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateCategory();
        PopulateUnit();
    }

    private void PopulateCategory()
    {
        Category cls = new Category();

        sel_Add_Category.DataSource = cls.Get();
        sel_Add_Category.DataValueField = "Id";
        sel_Add_Category.DataTextField = "Name";
        sel_Add_Category.DataBind();

        sel_Edit_Category.DataSource = cls.Get();
        sel_Edit_Category.DataValueField = "Id";
        sel_Edit_Category.DataTextField = "Name";
        sel_Edit_Category.DataBind();
    }

    private void PopulateUnit()
    {
        Unit cls = new Unit();

        sel_Add_Unit.DataSource = cls.Get();
        sel_Add_Unit.DataValueField = "Id";
        sel_Add_Unit.DataTextField = "Name";
        sel_Add_Unit.DataBind();

        sel_Add_C_Unit.DataSource = cls.Get();
        sel_Add_C_Unit.DataValueField = "Id";
        sel_Add_C_Unit.DataTextField = "Name";
        sel_Add_C_Unit.DataBind();

        sel_Edit_Unit.DataSource = cls.Get();
        sel_Edit_Unit.DataValueField = "Id";
        sel_Edit_Unit.DataTextField = "Name";
        sel_Edit_Unit.DataBind();

        sel_Edit_C_Unit.DataSource = cls.Get();
        sel_Edit_C_Unit.DataValueField = "Id";
        sel_Edit_C_Unit.DataTextField = "Name";
        sel_Edit_C_Unit.DataBind();
    }
}