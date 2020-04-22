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