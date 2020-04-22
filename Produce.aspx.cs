using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Produces : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateMenu();
        PopulateStatus();
    }

    private void PopulateMenu()
    {
        Menus cls = new Menus();

        sel_Add_Menu.DataSource = cls.GetForDropdown();
        sel_Add_Menu.DataValueField = "Id";
        sel_Add_Menu.DataTextField = "Name";
        sel_Add_Menu.DataBind();

        sel_Edit_Menu.DataSource = cls.GetForDropdown();
        sel_Edit_Menu.DataValueField = "Id";
        sel_Edit_Menu.DataTextField = "Name";
        sel_Edit_Menu.DataBind();
    }

    private void PopulateStatus()
    {
        List<DropdownModel> lst = new List<DropdownModel>
        {
            new DropdownModel {Value = "0", Text = "Pending"},
            new DropdownModel {Value = "1", Text = "Started"},
            new DropdownModel {Value = "2", Text = "Near Completion"},
            new DropdownModel {Value = "3", Text = "Overdue"},
            new DropdownModel {Value = "4", Text = "Done"}
        };
        
        sel_Edit_Status.DataSource = lst;
        sel_Edit_Status.DataValueField = "Value";
        sel_Edit_Status.DataTextField = "Text";
        sel_Edit_Status.DataBind();
    }

}