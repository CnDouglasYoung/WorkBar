using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UID = Session["UID"].ToString();
        if (UID == null)
            Label1.Text = "未读取到内容";
        else
            Label1.Text = UID;
        string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
        SqlConnection conn = new SqlConnection(strCon);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(new SqlParameter("@UID", SqlDbType.NVarChar, 16));
        cmd.Parameters["@UID"].Value = Session["UID"].ToString();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT   Fav_Item.ItemId1,dbo.Item.IconCode,dbo.Item.Name  FROM   dbo.Item INNER JOIN dbo.Fav_Item ON dbo.Item.ItemId = dbo.Fav_Item.ItemId1 WHERE   dbo.Fav_Item.UID =@UID";
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read()) {
            Label2.Text = reader["IconCode"].ToString();
            Label3.Text = reader["Name"].ToString();
            HiddenField1.Value = reader["ItemId1"].ToString();
        }
        else
        {
            LinkButton1.Visible = false;
        }
        reader.Close();
        cmd.CommandText = "SELECT   Fav_Item.ItemId2,dbo.Item.IconCode,dbo.Item.Name  FROM   dbo.Item INNER JOIN dbo.Fav_Item ON dbo.Item.ItemId = dbo.Fav_Item.ItemId2 WHERE   dbo.Fav_Item.UID =@UID";
       reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            Label4.Text = reader["IconCode"].ToString();
            Label5.Text = reader["Name"].ToString();
            HiddenField2.Value = reader["ItemId2"].ToString();
        }
        else
        {
            LinkButton2.Visible = false;
        }
        reader.Close();
        conn.Close();
        DataAccess da = new DataAccess();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["ItemId"] = HiddenField1.Value;
        Response.Redirect("~/item/item.aspx", false);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["ItemId"] = HiddenField2.Value;
        Response.Redirect("~/item/item.aspx", false);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ItemId"] = "";
    }
}