using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class MenuItem
{
    public MenuItem()
    {
    }

    public MenuItemModel Add(MenuItemModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Menu_Id",mdl.Menu_Id),
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Unit_Id",mdl.Unit_Id)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "MenuItem_Add"));

        return mdl;
    }

    public int Edit(MenuItemModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",mdl.Id),
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Unit_Id",mdl.Unit_Id)
        };

        return int.Parse(db.ExecuteScalar(lst, "MenuItem_Edit"));
    }

    public bool IsItemExist(int menu_id, int item_id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Menu_Id",menu_id),
            new SqlParameter("@Item_Id",item_id)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "MenuItem_CountByItem"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public bool IsItemExist(int id, string menu_id,string item_id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id),
            new SqlParameter("@Menu_Id",menu_id),
            new SqlParameter("@Item_Id",item_id)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "MenuItem_CountByItemNotId"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public MenuItemModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "MenuItem_GetById");
        DataRow dr = dt.Rows[0];

        MenuItemModel mdl = new MenuItemModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Menu_Id = int.Parse(dr["Menu_Id"].ToString()),
            Item_Id = int.Parse(dr["Item_Id"].ToString()),
            Quantity = decimal.Parse(dr["Quantity"].ToString()),
            Unit_Id = int.Parse(dr["Unit_Id"].ToString())
        };

        return mdl;
    }

    public DataTable GetForDatatable(int menu_id)
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Menu_Id",menu_id)
        };
        return db.ExecuteReader(lst, "MenuItem_GetForDatatable");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        return int.Parse(db.ExecuteScalar(lst, "MenuItem_Delete"));
    }
}

public class MenuItemModel
{
    public MenuItemModel()
    {
    }

    public int Id { get; set; }
    public int Menu_Id { get; set; }
    public int Item_Id { get; set; }
    public decimal Quantity { get; set; }
    public int Unit_Id { get; set; }
}

public class MenuItemViewModel
{
    public MenuItemViewModel()
    {
    }

    public int Id { get; set; }
    public string Menu { get; set; }
    public string Item { get; set; }
    public decimal Quantity { get; set; }
    public string Unit { get; set; }
}