﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class Produce
{
    public Produce()
    {
    }

    public ProduceModel Add(ProduceModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
            {
                new SqlParameter("@Menu_Id",mdl.Menu_Id),
                new SqlParameter("@Quantity",mdl.Quantity),
                new SqlParameter("@ProductionCart_Id",mdl.ProductionCart_Id)
            };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Production_Add"));

        return mdl;
    }

    public int Edit(ProduceModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",mdl.Id),
            new SqlParameter("@Menu_Id",mdl.Menu_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Status",mdl.Status)
        };
        //Update Critical Level
        CriticalLevel cls = new CriticalLevel();
        cls.UpdateCritical();

        return int.Parse(db.ExecuteScalar(lst, "Production_Edit"));
    }

    public ProduceModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Production_GetById");
        DataRow dr = dt.Rows[0];

        ProduceModel mdl = new ProduceModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Menu_Id = int.Parse(dr["Menu_Id"].ToString()),
            Quantity = int.Parse(dr["Quantity"].ToString()),
            Status = int.Parse(dr["Status"].ToString())
        };

        return mdl;
    }

    public ProduceViewModel GetViewById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Production_GetViewById");
        DataRow dr = dt.Rows[0];

        ProduceViewModel mdl = new ProduceViewModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Menu = dr["Menu"].ToString(),
            Quantity = int.Parse(dr["Quantity"].ToString()),
            Status = dr["Status"].ToString()
        };

        return mdl;
    }

    public DataTable GetForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Production_GetForDatatable");
    }

    public DataTable GetForDatatable(int cartid)
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@ProductionCart_Id",cartid)
        };
        return db.ExecuteReader(lst, "Production_GetForDatatableByCartId");
    }

    public DataTable GetForDropdown()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Production_GetForDropdown");
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

        return int.Parse(db.ExecuteScalar(lst, "Production_Delete"));
    }

    public bool IsPossible(int menu_id, int quantity)
    {
        Database db = new Database();
        bool result = true;

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Menu_Id",menu_id),
            new SqlParameter("@Quantity",quantity)
        };
        DataTable dt = db.ExecuteReader(lst, "Production_IsPossible");
        foreach (DataRow dr in dt.Rows)
        {
            if (decimal.Parse(dr["Quantity"].ToString()) < 0)
            {
                result = false;
            }
        }
        return result;
    }

    public string CheckCritical(int menu_id, int quantity)
    {
        Database db = new Database();
        string result = "";

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Menu_Id",menu_id),
            new SqlParameter("@Quantity",quantity)
        };
        DataTable dt = db.ExecuteReader(lst, "Production_NotifForCritical");
        foreach (DataRow dr in dt.Rows)
        {
            if (decimal.Parse(dr["Quantity"].ToString()) <= decimal.Parse(dr["Critical"].ToString()))
            {
                if (result != "")
                {
                    result += ", ";
                }
                result += dr["Item"].ToString();
            }
        }
        return result;
    }

    public DataTable GetBestSeller(int StartMonth, int StartYear, int EndMonth, int EndYear)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@StartMonth",StartMonth),
            new SqlParameter("@StartYear",StartYear),
            new SqlParameter("@EndMonth",EndMonth),
            new SqlParameter("@EndYear",EndYear)
        };
        return db.ExecuteReader(lst, "Produce_BestSeller");
    }

    public int GetLate(int month, int year)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Month",month),
            new SqlParameter("@Year",year)
        };
        DataTable dt = db.ExecuteReader(lst, "Production_GetLate");
        foreach (DataRow dr in dt.Rows)
        {
            return int.Parse(dr["Count"].ToString());
        }
        return 0;
    }

    public DataTable GetOverallStats()
    {
        Database db = new Database();
        return db.ExecuteReader(new List<SqlParameter>(), "Production_GetOverallStats");
    }

    public DataTable LastMonthStats()
    {
        Database db = new Database();
        return db.ExecuteReader(new List<SqlParameter>(), "Production_LastMonthStats");
    }

    public int Finish(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@ProductionCart_Id",id)
        };
        //Update Critical Level
        CriticalLevel cls = new CriticalLevel();
        cls.UpdateCritical();

        return int.Parse(db.ExecuteScalar(lst, "Production_Finish"));
    }
}

public class ProduceModel
{
    public ProduceModel()
    {
    }

    public int Id { get; set; }
    public int Menu_Id { get; set; }
    public int Quantity { get; set; }
    public int Status { get; set; }
    public int ProductionCart_Id { get; set; }
    public int Confirmed { get; set; }
    public DateTime X_DateCreated { get; set; }
    public DateTime X_Done { get; set; }
}

public class ProduceViewModel
{
    public ProduceViewModel()
    {
    }

    public int Id { get; set; }
    public int ProductionCart_Id { get; set; }
    public string Menu { get; set; }
    public int Quantity { get; set; }
    public string Status { get; set; }
}