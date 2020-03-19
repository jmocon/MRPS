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
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Type",mdl.Type),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Supplier_Id",mdl.Supplier_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Unit_Id",mdl.Unit_Id),
            new SqlParameter("@DatePurchased",mdl.DatePurchased)
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
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Type",mdl.Type),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Supplier_Id",mdl.Supplier_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Unit_Id",mdl.Unit_Id),
            new SqlParameter("@DatePurchased",mdl.DatePurchased)
        };

        return int.Parse(db.ExecuteScalar(lst, "Purchase_Edit"));
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
            Item_Id = int.Parse(dr["Item_Id"].ToString()),
            Type = int.Parse(dr["Type"].ToString()),
            Price = decimal.Parse(dr["Price"].ToString()),
            Supplier_Id = int.Parse(dr["Supplier_Id"].ToString()),
            Quantity = decimal.Parse(dr["Quantity"].ToString()),
            Unit_Id = int.Parse(dr["Unit_Id"].ToString()),
            DatePurchased_S = Convert.ToDateTime(dr["DatePurchased"].ToString()).ToString("yyyy-MM-dd")
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
            Item = dr["Item"].ToString(),
            Type = dr["Type"].ToString(),
            Price = decimal.Parse(dr["Price"].ToString()),
            Supplier = dr["Supplier"].ToString(),
            Quantity = decimal.Parse(dr["Quantity"].ToString()),
            Unit = dr["Unit"].ToString(),
            DatePurchased = Convert.ToDateTime(dr["DatePurchased"].ToString()).ToString("MMMM d, yyyy hh:mm tt")
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

    public int GetBuyCount()
    {
        Database db = new Database();
        return int.Parse(db.ExecuteScalar(new List<SqlParameter>(), "Purchase_Buy_Count"));
    }

    public int GetSoldCount()
    {
        Database db = new Database();
        return int.Parse(db.ExecuteScalar(new List<SqlParameter>(), "Purchase_Sold_Count"));
    }

    public int GetSpoiledCount()
    {
        Database db = new Database();
        return int.Parse(db.ExecuteScalar(new List<SqlParameter>(), "Purchase_Spoiled_Count"));
    }

    public int GetSubsidizedCount()
    {
        Database db = new Database();
        return int.Parse(db.ExecuteScalar(new List<SqlParameter>(), "Purchase_Subsidized_Count"));
    }
}

public class PurchaseModel
{
    public PurchaseModel()
    {
    }

    public int Id { get; set; }
    public int Item_Id { get; set; }
    public int Type { get; set; }
    public decimal Price { get; set; }
    public int Supplier_Id { get; set; }
    public decimal Quantity { get; set; }
    public int Unit_Id { get; set; }
    public DateTime DatePurchased { get; set; }
    public string DatePurchased_S { get; set; }
    public DateTime X_DateCreated { get; set; }
    public int X_User_Id { get; set; }
}

public class PurchaseViewModel
{
    public PurchaseViewModel()
    {
    }

    public int Id { get; set; }
    public string Item { get; set; }
    public string Type { get; set; }
    public decimal Price { get; set; }
    public string Supplier { get; set; }
    public decimal Quantity { get; set; }
    public string Unit { get; set; }
    public string DatePurchased { get; set; }
    public string DateCreated { get; set; }
}