using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    private SqlConnection con;
    private SqlCommand cmd;

    public Database()
    {
        string conString = ConfigurationManager.ConnectionStrings["MRPS_db"].ConnectionString;
        con = new SqlConnection(conString);
        cmd = new SqlCommand();
    }

    public string ExecuteScalar(List<SqlParameter> lst, string sp)
    {
        string output = "";
        cmd = new SqlCommand(sp, con);
        try
        {
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.AddRange(lst.ToArray());
            cmd.CommandType = CommandType.StoredProcedure;
            output = cmd.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

        return output;
    }

    public int ExecuteNonQuery(List<SqlParameter> lst, string sp)
    {
        int rowsAffected = 0;

        cmd = new SqlCommand(sp, con);
        try
        {
            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.AddRange(lst.ToArray());
            cmd.CommandType = CommandType.StoredProcedure;
            rowsAffected = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

        return rowsAffected;
    }

    public DataTable ExecuteReader(List<SqlParameter> lst, string sp)
    {
        DataTable dt = new DataTable();

        cmd = new SqlCommand(sp, con);
        try
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.AddRange(lst.ToArray());
            cmd.CommandType = CommandType.StoredProcedure;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                dt.Load(reader);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }

        return dt;
    }
}

public class ParameterModel
{
    public ParameterModel()
    {
    }

    public string Name { get; set; }
    public string Value { get; set; }
}