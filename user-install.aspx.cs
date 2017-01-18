using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

public partial class user_install : System.Web.UI.Page
{
    universal un = new universal();
    public void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.IsPostBack == false)
        {
            DataAccess da = new DataAccess();
            string sqls = "select Name,Email,Intro,HeadPhoto from User_ where UID='" + Session["UID"].ToString() + "'";
            DataSet ds = da.dataSet(sqls);
            Label2.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            TextBox1.Text = ds.Tables[0].Rows[0]["Intro"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            string H = ds.Tables[0].Rows[0]["HeadPhoto"].ToString().Substring(7, 1);
            if (H == "4") RadioButton4.Checked = true;
            else if (H == "3") RadioButton3.Checked = true;
            else if (H == "2") RadioButton2.Checked = true;
            else if (H == "1") RadioButton1.Checked = true;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        string UID = Session["UID"].ToString();
        string TagId = "";
        string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
        SqlConnection conn = new SqlConnection(strCon);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(new SqlParameter("@TagName", SqlDbType.NVarChar, 16));
        cmd.Parameters["@TagName"].Value = TextBox4.Text;
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
        string sqls = "select UID from User_Tag where UID='" + UID + "' and TagId='" + TagId + "'";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count == 0)
        {
            sqls = "INSERT INTO User_Tag VALUES ('" + UID + "','" + TagId + "')";
            da.ExecuteSql(sqls);
            DataList2.DataBind();
        }
        else
        {
            un.Alert("请不要重复输入", this);
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataAccess da = new DataAccess();
        ImageButton ImageButton1 = sender as ImageButton;
        int count = Convert.ToInt32(ImageButton1.ValidationGroup); //这个是点击的行的索引 也就是行数
        //int id = Convert.ToInt32(ImageButton1.CommandArgument); //这个是点击的行的ID
        HiddenField Id = (HiddenField)(DataList2.Items[count].FindControl("HiddenField2"));
        string sqls = " DELETE FROM User_Tag WHERE UID = " + Session["UID"].ToString() + " and  TagId=" + Id.Value;
        da.ExecuteSql(sqls);
        DataList2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        string sqls = "select Password from User_ where UID='" + Session["UID"].ToString()+"'";
        DataSet ds = da.dataSet(sqls);
        string Password = ds.Tables[0].Rows[0]["Password"].ToString()  ;
        universal un = new universal();
        if (TextBox3.Text == Password)
        {
            if (TextBox5.Text == TextBox6.Text)
            {
                sqls = "UPDATE User_ SET Password = '" + TextBox5.Text + "' WHERE UID = '" + Session["UID"].ToString() + "'";
                da.ExecuteSql(sqls);
                un.Alert("修改成功", this);
            }
            else
            {
                un.Alert("新密码确认失败，请两次输入相同的新密码", this);
            }
        }
        else un.Alert("旧密码确认失败，请确认后再次输入", this);
        TextBox3.Text = "";

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        string Intro = TextBox1.Text;
        if(TextBox1.Text=="")Intro = " ";
        string Email = TextBox2.Text;
        string sqls = "UPDATE User_ SET Intro = '" + Intro + "',Email='" + Email + "' WHERE UID = '" + Session["UID"].ToString() + "'";
        da.ExecuteSql(sqls);
        un.Alert("修改成功", this);
        Response.AddHeader("Refresh", "0"); 
    }
    protected void ButtonTX_Click(object sender, EventArgs e)
    {
        string H="";
        if (RadioButton1.Checked == true) H = "~/img/T1.png";
        else if (RadioButton2.Checked == true) H = "~/img/T2.png";
        else if (RadioButton3.Checked == true) H = "~/img/T3.png";
        else if (RadioButton4.Checked == true) H = "~/img/T4.png";
        DataAccess da = new DataAccess();
        string sqls="UPDATE User_ SET HeadPhoto = '" + H + "' WHERE UID = '" + Session["UID"].ToString() + "'";
        da.ExecuteSql(sqls);
        un.Alert("修改成功", this);
        Response.AddHeader("Refresh", "0"); 
    }
}