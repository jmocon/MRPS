using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class Menus
{
    public Menus()
    {
    }

    public MenuModel Add(MenuModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Timer",mdl.Timer),
            new SqlParameter("@Description",mdl.Description)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "Menu_Add"));

        return mdl;
    }

    public int Edit(MenuModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",mdl.Id),
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Price",mdl.Price),
            new SqlParameter("@Timer",mdl.Timer),
            new SqlParameter("@Description",mdl.Description)
        };

        return int.Parse(db.ExecuteScalar(lst, "Menu_Edit"));
    }

    public bool IsNameExist(string value)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",value)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "Menu_CountByName"));
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

        int count = int.Parse(db.ExecuteScalar(lst, "Menu_CountByNameNotId"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public MenuModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Menu_GetById");
        DataRow dr = dt.Rows[0];

        MenuModel mdl = new MenuModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            Price = decimal.Parse(dr["Price"].ToString()),
            Timer = decimal.Parse(dr["Timer"].ToString()),
            Description = dr["Description"].ToString()
        };

        return mdl;
    }

    public MenuModel GetViewById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "Menu_GetViewById");
        DataRow dr = dt.Rows[0];

        MenuModel mdl = new MenuModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            Price = decimal.Parse(dr["Price"].ToString()),
            Timer = decimal.Parse(dr["Timer"].ToString()),
            Description = dr["Description"].ToString(),
        };

        return mdl;
    }

    public DataTable GetForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Menu_GetForDatatable");
    }

    public DataTable GetForDropdown()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "Menu_GetForDropdown");
    }

    public int Delete(int id)
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };
        return int.Parse(db.ExecuteScalar(lst, "Menu_Delete"));
    }
}

public class MenuModel
{
    public MenuModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public decimal Timer { get; set; }
    public string Description { get; set; }
    public bool X_Deleted { get; set; }
}