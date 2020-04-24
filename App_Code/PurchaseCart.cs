using System;
using System.Collections.Generic;
using System.Data.SqlClient;

public class PurchaseCart
{
    public PurchaseCart()
    {
    }

    public int Add()
    {
        Database db = new Database();
        return int.Parse(db.ExecuteScalar(new List<SqlParameter>(), "PurchaseCart_Add"));
    }
}

public class PurchaseCartModel
{
    public PurchaseCartModel()
    {
    }

    public int Id { get; set; }
    public int Confirmed { get; set; }
    public DateTime X_DateCreated { get; set; }
}