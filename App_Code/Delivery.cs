using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class Delivery
{
    public Delivery()
    {
    }

    public DeliveryModel Add(DeliveryModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Code",mdl.Code),
            new SqlParameter("@Item_Id",mdl.Item_Id),
            new SqlParameter("@Quantity",mdl.Quantity),
            new SqlParameter("@Unit_Id",mdl.Unit_Id),
            new SqlParameter("@DateReceived",mdl.DateReceived),
            new SqlParameter("@PurchaseCart_Id",mdl.PurchaseCart_Id)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Delivery_Add"));

        return mdl;
    }

    public List<DeliveryModel> GetCodeByPurchaseCart_Id(int PurchaseCart_Id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@PurchaseCart_Id",PurchaseCart_Id)
        };

        return ToList(db.ExecuteReader(lst, "Delivery_GetCodeByPurchaseCart_Id"));
    }

    public DataTable GetItemDetailByCode(string Code)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Code",Code)
        };

        return db.ExecuteReader(lst, "Delivery_GetItemDetailByCode");
    }

    public int DeleteByCode(string Code)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Code",Code)
        };

        return db.ExecuteNonQuery(lst, "Devlivery_DeleteByCode");
    }

    public int ReflectQuantity(int Item_Id, int PurchaseCart_Id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Item_Id",Item_Id),
            new SqlParameter("@PurchaseCart_Id",PurchaseCart_Id)
        };

        return db.ExecuteNonQuery(lst, "Delivery_ReflectQuantity");
    }

    private List<DeliveryModel> ToList(DataTable dt)
    {
        List<DeliveryModel> lst = new List<DeliveryModel>();
        foreach (DataRow dr in dt.Rows)
        {
            DeliveryModel mdl = new DeliveryModel
            {
                Id = (dt.Columns.Contains("Id")) ? int.Parse(dr["Id"].ToString()) : 0,
                Code = (dt.Columns.Contains("Code")) ? dr["Code"].ToString() : "",
                Item_Id = (dt.Columns.Contains("Item_Id")) ? int.Parse(dr["Item_Id"].ToString()) : 0,
                Quantity = (dt.Columns.Contains("Quantity")) ? decimal.Parse(dr["Quantity"].ToString()) : 0,
                Unit_Id = (dt.Columns.Contains("Unit_Id")) ? int.Parse(dr["Unit_Id"].ToString()) : 0,
                DateReceived = (dt.Columns.Contains("DateReceived")) ? DateTime.Parse(dr["DateReceived"].ToString()) : DateTime.Now,
                PurchaseCart_Id = (dt.Columns.Contains("PurchaseCart_Id")) ? int.Parse(dr["PurchaseCart_Id"].ToString()) : 0
            };
            lst.Add(mdl);
        }
        return lst;
    }
}

public class DeliveryModel
{
    public DeliveryModel()
    {
    }

    public int Id { get; set; }
    public string Code { get; set; }
    public int Item_Id { get; set; }
    public decimal Quantity { get; set; }
    public int Unit_Id { get; set; }
    public DateTime DateReceived { get; set; }
    public int PurchaseCart_Id { get; set; }
}