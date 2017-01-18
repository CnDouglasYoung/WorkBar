using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// UsersDA 的摘要说明
/// </summary>
public class UsersDA
{
    System.Data.SqlClient.SqlConnection conn = null;
    System.Data.SqlClient.SqlCommand cmd = null;
    public UsersDA()
    {
        conn = new System.Data.SqlClient.SqlConnection("Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123");
        cmd = conn.CreateCommand();
    }
    /// <summary>
    /// 用户验证
    /// </summary>
    /// <param name="Uname">验证的用户名</param>
    /// <param name="Pwd">验证的密码</param>
    /// <returns></returns>
    public bool Select(string Uname, string Pwd)
    {
        bool has = false;
        cmd.CommandText = "select * from Users where UserName=@username and PassWord=@password";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@username", Uname);
        cmd.Parameters.AddWithValue("@password", Pwd);
        conn.Open();
        System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            has = true;
        }

        conn.Close();
        return has;
    }
}