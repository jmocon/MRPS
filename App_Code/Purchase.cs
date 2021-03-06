﻿using System;
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
            new SqlParameter("@DatePurchased",mdl.DatePurchased),
            new SqlParameter("@Confirmed",mdl.Confirmed),
            new SqlParameter("@PurchaseCart_Id",mdl.PurchaseCart_Id),
            new SqlParameter("@R_Quantity",mdl.R_Quantity),
            new SqlParameter("@R_Unit_Id",mdl.R_Unit_Id)
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
            new SqlParameter("@DatePurchased",mdl.DatePurchased),
            new SqlParameter("@R_Quantity",mdl.R_Quantity),
            new SqlParameter("@R_Unit_Id",mdl.R_Unit_Id)
        };
        //Update Critical Level
        CriticalLevel cls = new CriticalLevel();
        cls.UpdateCritical();

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
            DatePurchased_S = Convert.ToDateTime(dr["DatePurchased"].ToString()).ToString("yyyy-MM-dd"),
            PurchaseCart_Id = int.Parse(dr["PurchaseCart_Id"].ToString()),
            R_Quantity = decimal.Parse(dr["R_Quantity"].ToString()),
            R_Unit_Id = int.Parse(dr["R_Unit_Id"].ToString())
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
        return db.ExecuteReader(new List<SqlParameter>(), "Purchase_GetForDatatable");
    }

    public DataTable GetForDatatable(int cartid)
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@PurchaseCart_Id",cartid)
        };
        return db.ExecuteReader(lst, "Purchase_GetForDatatableByCartId");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };
        //Update Critical Level
        CriticalLevel cls = new CriticalLevel();
        cls.UpdateCritical();

        return int.Parse(db.ExecuteScalar(lst, "Purchase_Delete"));
    }

    public List<PurchaseModel> GetByPurchaseCart_Id(int PurchaseCart_Id)
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@PurchaseCart_Id",PurchaseCart_Id)
        };
        DataTable dt = db.ExecuteReader(lst, "Purchase_GetByPurchase_Id");
        return ToList(dt);
    }

    public int GetBuyCount(int StartMonth, int StartYear, int EndMonth, int EndYear)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@StartMonth",StartMonth),
            new SqlParameter("@StartYear",StartYear),
            new SqlParameter("@EndMonth",EndMonth),
            new SqlParameter("@EndYear",EndYear)
        };
        return int.Parse(db.ExecuteScalar(lst, "Purchase_Buy_Count"));
    }

    public int GetSoldCount(int StartMonth, int StartYear, int EndMonth, int EndYear)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@StartMonth",StartMonth),
            new SqlParameter("@StartYear",StartYear),
            new SqlParameter("@EndMonth",EndMonth),
            new SqlParameter("@EndYear",EndYear)
        };
        return int.Parse(db.ExecuteScalar(lst, "Purchase_Sold_Count"));
    }

    public int GetSpoiledCount(int StartMonth, int StartYear, int EndMonth, int EndYear)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@StartMonth",StartMonth),
            new SqlParameter("@StartYear",StartYear),
            new SqlParameter("@EndMonth",EndMonth),
            new SqlParameter("@EndYear",EndYear)
        };
        return int.Parse(db.ExecuteScalar(lst, "Purchase_Spoiled_Count"));
    }

    public int GetSubsidizedCount(int StartMonth, int StartYear, int EndMonth, int EndYear)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@StartMonth",StartMonth),
            new SqlParameter("@StartYear",StartYear),
            new SqlParameter("@EndMonth",EndMonth),
            new SqlParameter("@EndYear",EndYear)
        };
        return int.Parse(db.ExecuteScalar(lst, "Purchase_Subsidized_Count"));
    }

    public int Finish(PurchaseModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@PurchaseCart_Id",mdl.PurchaseCart_Id),
            new SqlParameter("@Type",mdl.Type),
            new SqlParameter("@DatePurchased",mdl.DatePurchased),
            new SqlParameter("@Supplier_Id",mdl.Supplier_Id)
        };
        //Update Critical Level
        CriticalLevel cls = new CriticalLevel();
        cls.UpdateCritical();

        return int.Parse(db.ExecuteScalar(lst, "Purchase_Finish"));
    }

    public List<PurchaseModel> ToList(DataTable dt)
    {
        int s = 0;
        List<PurchaseModel> lst = new List<PurchaseModel>();
        foreach (DataRow dr in dt.Rows)
        {
            PurchaseModel mdl = new PurchaseModel
            {
                Id = int.Parse(dr["Id"].ToString()),
                Item_Id = int.Parse(dr["Item_Id"].ToString()),
                Type = int.Parse(dr["Type"].ToString()),
                Price = decimal.Parse(dr["Price"].ToString()),
                Supplier_Id = int.Parse(dr["Supplier_Id"].ToString()),
                Quantity = decimal.Parse(dr["Quantity"].ToString()),
                Unit_Id = int.Parse(dr["Unit_Id"].ToString()),
                DatePurchased = DateTime.Parse(dr["DatePurchased"].ToString()),
                X_DateCreated = DateTime.Parse(dr["X_DateCreated"].ToString()),
                X_User_Id = (dr["X_User_Id"].ToString() == "") ? 0 : int.Parse(dr["X_User_Id"].ToString()),
                X_Deleted = int.Parse(dr["X_Deleted"].ToString()),
                Confirmed = int.Parse(dr["Confirmed"].ToString()),
                PurchaseCart_Id = int.Parse(dr["PurchaseCart_Id"].ToString()),
                R_Quantity = decimal.Parse(dr["R_Quantity"].ToString()),
                R_Unit_Id = int.Parse(dr["R_Unit_Id"].ToString())
            };

            lst.Add(mdl);
        }

        return lst;
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
    public int X_Deleted { get; set; }
    public int Confirmed { get; set; }
    public int PurchaseCart_Id { get; set; }
    public decimal R_Quantity { get; set; }
    public int R_Unit_Id { get; set; }
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
    public int PurchaseCart_Id { get; set; }
    public decimal R_Quantity { get; set; }
    public string R_Unit_Id { get; set; }
}