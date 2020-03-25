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

    public ForecastModel Add(ForecastItemModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@StartDate",mdl.StartDate),
            new SqlParameter("@EndDate",mdl.EndDate),
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Type",mdl.Type),
            new SqlParameter("@Day",mdl.Day),
            
            new SqlParameter("@P_Price",mdl.Price),
            new SqlParameter("@P_Supplier_Id",mdl.Supplier_Id),
            new SqlParameter("@P_Quantity",mdl.Quantity),
            new SqlParameter("@P_Unit_Id",mdl.Unit_Id)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Forecast_Add"));
        ForecastModel mdlF = new ForecastModel
        {
            StartDate = mdl.StartDate,
            EndDate = mdl.EndDate,
            Item_Id = mdl.Item_Id,
            Type = mdl.Type,
            Day = mdl.Day
        };
        return mdlF;
    }

    public ForecastModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Forecast_GetById");
        DataRow dr = dt.Rows[0];

        ForecastModel mdl = new ForecastModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            StartDate = DateTime.Parse(dr["StartDate"].ToString()),
            EndDate = DateTime.Parse(dr["EndDate"].ToString()),
            Item_Id = int.Parse(dr["Item_Id"].ToString()),
            Type = int.Parse(dr["Type"].ToString()),
            Day = int.Parse(dr["Day"].ToString())
        };

        return mdl;
    }

    public ForecastViewModel GetViewById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Forecast_GetViewById");
        DataRow dr = dt.Rows[0];

        ForecastViewModel mdl = new ForecastViewModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            StartDate = dr["StartDate"].ToString(),
            EndDate = dr["EndDate"].ToString(),
            Item_Id = dr["Item_Id"].ToString(),
            Type = dr["Type"].ToString(),
            Day = dr["Day"].ToString()
        };

        return mdl;
    }

    public DataTable GetForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Forecast_GetForDatatable");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        return int.Parse(db.ExecuteScalar(lst, "Forecast_Delete"));
    }
}

public class ForecastModel
{
    public ForecastModel()
    {
    }

    public int Id { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public int Item_Id { get; set; }
    public int Type { get; set; }
    public int Day { get; set; }
}

public class ForecastItemModel
{
    public ForecastItemModel()
    {
    }

    public int Id { get; set; }
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public int Item_Id { get; set; }
    public int Type { get; set; }
    public int Day { get; set; }
    public decimal Price { get; set; }
    public int Supplier_Id { get; set; }
    public decimal Quantity { get; set; }
    public int Unit_Id { get; set; }
}

public class ForecastViewModel
{
    public ForecastViewModel()
    {
    }

    public int Id { get; set; }
    public string StartDate { get; set; }
    public string EndDate { get; set; }
    public string Item_Id { get; set; }
    public string Type { get; set; }
    public string Day { get; set; }
}