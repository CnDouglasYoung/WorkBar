using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class sign_in : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int Error_=0;
        int NameLength=User_Name.Text.Length;
        int GenderBit=0;
        Regex r = new Regex("^\\s*([A-Za-z0-9_-]+(\\.\\w+)*@(\\w+\\.)+\\w{2,5})\\s*$");
        if(User_Name.Text==""){
            NameY.ForeColor = System.Drawing.Color.Red;
            NameY.Text="用户名不得为空";
            Error_=1;
        }
        if(NameLength > 16){
            NameY.ForeColor = System.Drawing.Color.Red;
            NameY.Text = "用户名过长";
            Error_ = 1;
        }
        if(User_Password.Text==""){
            PasswordY1.ForeColor =System.Drawing.Color.Red;
            PasswordY1.Text = "密码不得为空";
            Error_=1;
        }
        if(User_Password.Text != User_Password2.Text){
            PasswordY2.ForeColor = System.Drawing.Color.Red;
            PasswordY2.Text="两次密码输入不一致";
            Error_=1;
        }
        if (r.IsMatch(User_Email.Text))
        {
            EmailY.Text = "邮箱格式正确";
        }
        else
        {
            EmailY.ForeColor = System.Drawing.Color.Red;
            EmailY.Text = "邮箱格式错误";
            Error_ = 1;
        }
        if(Gender1.Checked==Gender2.Checked )
        {
            Error_ = 1;
        }
        else
        {
            if (Gender1.Checked == true) GenderBit = 1;
        }
        DataAccess da = new DataAccess();
        string sqls = "SELECT Name FROM dbo.User_  WHERE Name='" + User_Name.Text+"'";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count!=0 )
        {
            if (User_Name.Text == ds.Tables [0].Rows [0]["Name"].ToString())
            {
                Error_ = 1;
                NameY.ForeColor = System.Drawing.Color.Red;
                NameY.Text = "用户名重复";
            }
        }
        if (Error_==0)
        {
            string Name=User_Name.Text;
            string Password=User_Password.Text;
            string Gender = GenderBit.ToString();
            string Email=User_Email.Text; 
            sqls = "insert into User_ (Name,Password,Gender,Email) VALUES ('"+Name+"','"+Password+"','"+Gender+"','"+Email+"')";
            da.ExecuteSql(sqls);
            alertv al = new alertv();
            Response.Write(al.gutAlertUrl("注册成功", "Login.aspx"));
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx", false);
    }
}
