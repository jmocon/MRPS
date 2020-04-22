using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

public class User
{
    public User()
    {
    }

    public UserModel Add(UserModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Username",mdl.Username),
            new SqlParameter("@Password",mdl.Password)
        };

        mdl.Id = int.Parse(db.ExecuteScalar(lst, "User_Add"));

        return mdl;
    }

    public int Edit(UserModel mdl)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",mdl.Id),
            new SqlParameter("@Name",mdl.Name),
            new SqlParameter("@Username",mdl.Username),
            new SqlParameter("@Password",mdl.Password)
        };

        return int.Parse(db.ExecuteScalar(lst, "User_Edit"));
    }

    public bool IsUsernameExist(string value)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Username",value)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "User_CountByName"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public bool IsUsernameExist(int id, string name)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id),
            new SqlParameter("@Username",name)
        };

        int count = int.Parse(db.ExecuteScalar(lst, "User_CountByNameNotId"));
        if (count > 0)
        {
            return true;
        }
        return false;
    }

    public UserModel GetById(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        DataTable dt = db.ExecuteReader(lst, "User_GetById");
        DataRow dr = dt.Rows[0];

        UserModel mdl = new UserModel
        {
            Id = int.Parse(dr["Id"].ToString()),
            Name = dr["Name"].ToString(),
            Username = dr["Username"].ToString(),
            Password = dr["Password"].ToString()
        };

        return mdl;
    }

    public bool Login(string uname, string pword)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Username",uname),
            new SqlParameter("@Password",pword)
        };

        DataTable dt = db.ExecuteReader(lst, "User_Login");
        if (dt.Rows.Count > 0)
        {
            return true;
        }

        return false;
    }

    public DataTable GetForDatatable()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "User_GetForDatatable");
    }

    public DataTable GetForDropdown()
    {
        Database db = new Database();
        List<SqlParameter> lst = new List<SqlParameter>();
        return db.ExecuteReader(lst, "User_GetForDropdown");
    }

    public int Delete(int id)
    {
        Database db = new Database();

        List<SqlParameter> lst = new List<SqlParameter>
        {
            new SqlParameter("@Id",id)
        };

        return int.Parse(db.ExecuteScalar(lst, "User_Delete"));
    }
}

public class UserModel
{
    public UserModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
}