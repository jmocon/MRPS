using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Purchase
/// </summary>
public class Purchase
{
    public Purchase()
    {
    }

    public PurchaseModel Add(PurchaseModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Category_Id",mdl.Category_Id),
            new SqlParameter("@Unit_Id",mdl.Unit_Id)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Purchase_Add"));

        return mdl;
    }

    public int Edit(PurchaseModel mdl)
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

        return int.Parse(db.ExecuteScalar(lst, "Purchase_Edit"));
    }

    public bool IsNameExist(string value)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",value)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "Purchase_CountByName"));
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

        int count = int.Parse(db.ExecuteScalar(lst, "Purchase_CountByNameNotId"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public PurchaseModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Purchase_GetById");
        DataRow dr = dt.Rows[0];

        PurchaseModel mdl = new PurchaseModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            Price = decimal.Parse(dr["Price"].ToString()),
            Category_Id = int.Parse(dr["Category_Id"].ToString()),
            Unit_Id = int.Parse(dr["Unit_Id"].ToString())
        };

        return mdl;
    }

    public PurchaseViewModel GetViewById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Purchase_GetViewById");
        DataRow dr = dt.Rows[0];

        PurchaseViewModel mdl = new PurchaseViewModel
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
        return db.ExecuteReader(lst, "Purchase_GetForDatatable");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        return int.Parse(db.ExecuteScalar(lst, "Purchase_Delete"));
    }
}

public class PurchaseModel
{
    public PurchaseModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int Category_Id { get; set; }
    public int Unit_Id { get; set; }
    public DateTime X_DateCreated { get; set; }
    public bool X_Archived { get; set; }
    public bool X_Deleted { get; set; }
}

public class PurchaseViewModel
{
    public PurchaseViewModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public string Category { get; set; }
    public decimal Quantity { get; set; }
    public string Unit { get; set; }
    public string DateCreated { get; set; }
}