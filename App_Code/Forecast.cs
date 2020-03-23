using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Forecast
/// Type
///     0 - Daily
///     1 - Weekly
///     2 - Monthly
/// Day
///     Day - 0
///     Weekly - 1-7 = Sunday to Saturday
///     Monthly - 1-30
/// </summary>
public class Forecast
{
    public Forecast()
    {
    }

    public ItemModel Add(ItemModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Category_Id",mdl.Category_Id),
            new SqlParameter("@Unit_Id",mdl.Unit_Id)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Item_Add"));

        return mdl;
    }

    public int Edit(ItemModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",mdl.Id),
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Category_Id",mdl.Category_Id),
            new SqlParameter("@Unit_Id",mdl.Unit_Id)
        };

        return int.Parse(db.ExecuteScalar(lst, "Item_Edit"));
    }

    public bool IsNameExist(string value)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",value)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "Item_CountByName"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public bool IsNameExist(int id, string name)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id),
            new SqlParameter("@Name",name)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "Item_CountByNameNotId"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public ItemModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Item_GetById");
        DataRow dr = dt.Rows[0];

        ItemModel mdl = new ItemModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            Price = decimal.Parse(dr["Price"].ToString()),
            Category_Id = int.Parse(dr["Category_Id"].ToString()),
            Unit_Id = int.Parse(dr["Unit_Id"].ToString())
        };

        return mdl;
    }

    public ItemViewModel GetViewById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Item_GetViewById");
        DataRow dr = dt.Rows[0];

        ItemViewModel mdl = new ItemViewModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            Price = decimal.Parse(dr["Price"].ToString()),
            Category = dr["Category"].ToString(),
            Quantity = decimal.Parse(dr["Quantity"].ToString()),
            Unit = dr["Unit"].ToString(),
            DateCreated = Convert.ToDateTime(dr["DateCreated"].ToString()).ToString("MMMM d, yyyy hh:mm tt")
        };

        return mdl;
    }

    public DataTable GetForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Item_GetForDatatable");
    }

    public DataTable GetUsageForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Item_GetUsageForDatatable");
    }

    public DataTable GetForDropdown()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Item_GetForDropdown");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        return int.Parse(db.ExecuteScalar(lst, "Item_Delete"));
    }
}