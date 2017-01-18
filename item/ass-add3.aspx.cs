using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_ass_add3 : System.Web.UI.Page
{
    public string AssId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
        SqlConnection conn = new SqlConnection(strCon);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(new SqlParameter("@UID", SqlDbType.NVarChar, 16));
        cmd.Parameters["@UID"].Value = Session["UID"].ToString();
        cmd.Connection = conn;
        cmd.CommandText = " SELECT   TOP (1) AssId FROM  dbo.Assignment  WHERE   (ResponsibleUID = @UID)  ORDER BY CreateTime DESC";
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            AssId = reader["AssId"].ToString();
        }
        HiddenField1.Value = AssId;
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        string TagId = "";
        string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
        SqlConnection conn = new SqlConnection(strCon);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(new SqlParameter("@TagName", SqlDbType.NVarChar, 16));
        cmd.Parameters["@TagName"].Value = TextBox1.Text;
        cmd.Connection = conn;
        cmd.CommandText = "SELECT Tag.TagId FROM dbo.Tag WHERE Tag.TagName=@TagName";
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            TagId = reader["TagId"].ToString();
        }
        else
        {
            reader.Close();
            cmd.CommandText = "INSERT INTO Tag (TagName) VALUES (@TagName)";
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch { }

            cmd.CommandText = "SELECT Tag.TagId FROM dbo.Tag WHERE Tag.TagName=@TagName";
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                TagId = reader["TagId"].ToString();
            }
        }
        reader.Close();
        conn.Close();

        DataAccess da = new DataAccess();
        string CreateTime = DateTime.Now.ToString();
        string sqls = "INSERT INTO Ass_Tag VALUES ('" + AssId + "','" + TagId + "')";
        da.ExecuteSql(sqls);
        Response.AddHeader("Refresh", "0");
    }
}