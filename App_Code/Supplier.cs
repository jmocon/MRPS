using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class Supplier
{
    public Supplier()
    {

    }

    public DataTable GetForDropdown()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Supplier_GetForDropdown");
    }
}

public class SupplierModel
{
    public SupplierModel() { }

    public int Id { get; set; }
    public string Name { get; set; }
    public string PersonName { get; set; }
    public string Address { get; set; }
    public string MobileNumber { get; set; }
    public string Landline { get; set; }
    public string EmailAddress { get; set; }

}