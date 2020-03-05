using System;

public partial class MenuItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayMenuDetails();
        PopulateUnit();
        PopulateItem();
    }

    private void DisplayMenuDetails()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        Menus clsMenu = new Menus();
        MenuModel mdlMenu = clsMenu.GetById(id);
        Menu_Name.InnerHtml = mdlMenu.Name;
        Menu_Price.InnerHtml = "Php " + mdlMenu.Price.ToString("0.##");
        Menu_Description.InnerHtml = mdlMenu.Description;
    }

    private void PopulateUnit()
    {
        Unit cls = new Unit();

        sel_Add_Unit.DataSource = cls.Get();
        sel_Add_Unit.DataValueField = "Id";
        sel_Add_Unit.DataTextField = "Name";
        sel_Add_Unit.DataBind();

        sel_Edit_Unit.DataSource = cls.Get();
        sel_Edit_Unit.DataValueField = "Id";
        sel_Edit_Unit.DataTextField = "Name";
        sel_Edit_Unit.DataBind();
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
}