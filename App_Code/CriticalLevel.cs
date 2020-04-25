using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class CriticalLevel
{
    public CriticalLevel()
    {
    }

    public CriticalLevelModel Add(CriticalLevelModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Unit_Id",mdl.Unit_Id)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "CriticalLevel_Add"));

        return mdl;
    }

    public CriticalLevelModel GetByItem_Id(int Item_Id)
    {
        Database db = new Database();
        CriticalLevelModel mdl = new CriticalLevelModel();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Item_Id",Item_Id)
        };

        DataTable dt = db.ExecuteReader(lst, "CriticalLevel_GetByItem_Id");
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];

            mdl = new CriticalLevelModel
            {
                Id = int.Parse(dr["Id"].ToString()),
                Item_Id = int.Parse(dr["Item_Id"].ToString()),
                Quantity = decimal.Parse(dr["Quantity"].ToString()),
                Unit_Id = int.Parse(dr["Unit_Id"].ToString())
            };
        }

        return mdl;
    }

    public int Delete(int Item_Id)
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Item_Id",Item_Id)
        };
        return int.Parse(db.ExecuteScalar(lst, "CriticalLevel_Delete"));
    }

    public void UpdateCritical()
    {
        Item cls = new Item();

        foreach (DataRow dr in cls.GetCurrentQuantity().Rows)
        {
            decimal r = decimal.Parse(dr["R_Quantity"].ToString());
            decimal q = decimal.Parse(dr["Quantity"].ToString());
            decimal n = decimal.Parse(dr["Needs"].ToString());
            decimal c = decimal.Parse(dr["Critical"].ToString());
            decimal buy = (n<c)?c:n;

            if (r < n || r < c)
            {
                Supplier clsS = new Supplier();
                DataTable dtS = clsS.GetForDropdown();
                ItemModel mdlI = cls.GetById(int.Parse(dr["Id"].ToString()));
                Purchase clsP = new Purchase();
                PurchaseCart clsPC = new PurchaseCart();
                PurchaseModel mdlP = new PurchaseModel
                {
                    Item_Id = int.Parse(dr["Id"].ToString()),
                    Type = 0,
                    Price = mdlI.Price,
                    Supplier_Id = int.Parse(dtS.Rows[0]["Id"].ToString()),
                    Quantity = 0,
                    Unit_Id = int.Parse(dr["Unit"].ToString()),
                    DatePurchased = DateTime.Now,
                    Confirmed = 1,
                    PurchaseCart_Id = clsPC.Add(),
                    R_Quantity = buy + (buy / 4),
                    R_Unit_Id = int.Parse(dr["Unit"].ToString())
                };
                clsP.Add(mdlP);
            }
            if (q < n || q < c)
            {
                if (n > c)
                {
                    CriticalLevel clsCL = new CriticalLevel();
                    CriticalLevelModel mdlCL = new CriticalLevelModel
                    {
                        Item_Id = int.Parse(dr["Id"].ToString()),
                        Quantity = decimal.Parse(dr["Needs"].ToString()),
                        Unit_Id = int.Parse(dr["Unit"].ToString())
                    };

                    clsCL.Delete(int.Parse(dr["Id"].ToString()));
                    clsCL.Add(mdlCL);
                }
            }
        }
    }
}

public class CriticalLevelModel
{
    public CriticalLevelModel()
    {
    }

    public int Id { get; set; }
    public int Item_Id { get; set; }
    public decimal Quantity { get; set; }
    public int Unit_Id { get; set; }
}