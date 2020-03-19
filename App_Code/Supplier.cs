using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class Supplier
{
    public Supplier()
    {
    }

    public SupplierModel Add(SupplierModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@PersonName",mdl.PersonName),
            new SqlParameter("@Address",mdl.Address),
            new SqlParameter("@MobileNumber",mdl.MobileNumber),
            new SqlParameter("@Landline",mdl.Landline),
            new SqlParameter("@EmailAddress",mdl.EmailAddress)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Supplier_Add"));

        return mdl;
    }

    public int Edit(SupplierModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",mdl.Id),
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@PersonName",mdl.PersonName),
            new SqlParameter("@Address",mdl.Address),
            new SqlParameter("@MobileNumber",mdl.MobileNumber),
            new SqlParameter("@Landline",mdl.Landline),
            new SqlParameter("@EmailAddress",mdl.EmailAddress)
        };

        return int.Parse(db.ExecuteScalar(lst, "Supplier_Edit"));
    }

    public bool IsNameExist(string value)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",value)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "Supplier_CountByName"));
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

        int count = int.Parse(db.ExecuteScalar(lst, "Supplier_CountByNameNotId"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public SupplierModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Supplier_GetById");
        DataRow dr = dt.Rows[0];

        SupplierModel mdl = new SupplierModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            PersonName = dr["PersonName"].ToString(),
            Address = dr["Address"].ToString(),
            MobileNumber = dr["MobileNumber"].ToString(),
            Landline = dr["Landline"].ToString(),
            EmailAddress = dr["EmailAddress"].ToString()
        };

        return mdl;
    }

    public DataTable GetForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Supplier_GetForDatatable");
    }

    public DataTable GetForDropdown()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Supplier_GetForDropdown");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        return int.Parse(db.ExecuteScalar(lst, "Supplier_Delete"));
    }
}

public class SupplierModel
{
    public SupplierModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public string PersonName { get; set; }
    public string Address { get; set; }
    public string MobileNumber { get; set; }
    public string Landline { get; set; }
    public string EmailAddress { get; set; }
}