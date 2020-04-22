using System;
using System.Collections.Generic;
using System.Data.SqlClient;

public class ProductionCart
{
    public ProductionCart()
    {
    }

    public int Add()
    {
        Database db = new Database();
        return int.Parse(db.ExecuteScalar(new List<SqlParameter>(), "ProductionCart_Add"));
    }
}

public class ProductionCartModel
{
    public ProductionCartModel()
    {
    }

    public int Id { get; set; }
    public DateTime X_DateCreated { get; set; }
    public int Confirmed { get; set; }
}