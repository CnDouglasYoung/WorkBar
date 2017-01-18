using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;


public partial class Login : System.Web.UI.Page
{
    public int Error1=0;
    public string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null || Session["UID"].ToString() == "")
        {
            Label2.Text = "游客";
        }
        else
        {
            DataAccess da = new DataAccess();
            string sqls = "select Name from User_ where UID = " + Session["UID"].ToString();
            DataSet ds = da.dataSet(sqls);
            Label2.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            t1.Visible = false;
            Div1.Visible = true;
            Button3.Visible = true;
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }    
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "")
        {
            Label1.Text = "密码不得为空";
            Error1 = 1;
        } 
        if (TextBox1.Text == "")
        {
            Label1.Text = "用户名不得为空";
            Error1 = 1;
        }
        if (Error1 == 0)
        {
            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            conn.Open();
            cmd.Parameters.Add (new SqlParameter("@Name",SqlDbType.NChar,16));
            cmd.Parameters["@Name"].Value=TextBox1.Text;
            cmd.CommandText = "select Name,Password,UID from User_ where Name=@Name";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()) 
            { 
                string Password = reader["Password"].ToString();
                if (Password == TextBox2.Text)
                {
                    Label1.Text = "登陆成功";
                    Session.Timeout = 30;
                    Session["UID"] = reader["UID"].ToString();
                    Session["ItemId"] = "";
                    Response.Redirect("~/item/item-list.aspx", false);

                }
                else
                {
                    Label1.Text = "密码错误";
                }
            }
            else{
                Label1.Text = "用户名不存在";
            }
               


        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("sign_in.aspx", false);
    }
}