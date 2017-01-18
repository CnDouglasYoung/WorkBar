using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_item_edit : System.Web.UI.Page
{
    string Icon = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null)
        {
            Response.Redirect("~/Login.aspx", false);
        }
        else if (Session["UID"].ToString() == "")
        {
            Response.Redirect("~/Login.aspx", false);
        }
        if (this.Page.IsPostBack == false)
        {
            DataAccess da = new DataAccess();
            string sqls = "select Name, Intro,IsPublic,Detail,UserNumber,IconCode from Item where ItemId=" + Session["ItemId"].ToString();
            DataSet ds = da.dataSet(sqls);
            TextBox1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            TextBox3.Text = ds.Tables[0].Rows[0]["Intro"].ToString();
            if (ds.Tables[0].Rows[0]["IsPublic"].ToString() == "False")
            {
                CheckBox1.Checked = false;
                CheckBox2.Checked = true;
            }
            TextBox2.Text = ds.Tables[0].Rows[0]["UserNumber"].ToString();
            textarea1.Value = ds.Tables[0].Rows[0]["Detail"].ToString();
            Icon = ds.Tables[0].Rows[0]["IconCode"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        universal un = new universal();
        bool Err = true;
        if (TextBox1.Text == "")
        {
            Err = false;
            un.Alert("项目名不得为空", this);
        }
        if (TextBox3.Text == "")
        {
            Err = false;
            un.Alert("项目简介不得为空", this);
        }
        if (Err)
        {
            string Name = TextBox1.Text;
            string Intro = TextBox3.Text;
            string IsPublic = "1";
            if (CheckBox2.Checked == true)
            {
                IsPublic = "0";
            }
            string Detail = textarea1.Value;
            string UserNumber = "";
            if (TextBox2.Text != "") UserNumber = TextBox2.Text;
            string IconCode = "&#xe685";
            string CreateTime = DateTime.Now.ToString();
            foreach (DataListItem item in this.DataList1.Items)
            {
                RadioButton RB = (RadioButton)item.FindControl("RB");
                Label LB = (Label)item.FindControl("LB");
                if (RB.Checked == true) IconCode = LB.Text;
            }
            string sqls = "Update Item  SET Name='" + Name + "', Intro='" + Intro + "',IsPublic='" + IsPublic + "',Detail='" + Detail + "',UserNumber='" + UserNumber + "',IconCode='" + IconCode + "',CreateTime='" + CreateTime + "'  where ItemId=" + Session["ItemId"].ToString();
            DataAccess da = new DataAccess();
            da.ExecuteSql(sqls);


            alertv al = new alertv();
            Response.Write(al.gutAlertUrl("修改成功", "../item/item-list.aspx"));
        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label LB = (Label)e.Item.FindControl("LB");
        RadioButton RB = (RadioButton)e.Item.FindControl("RB");
        if (LB.Text == Icon)
        {
            RB.Checked = true;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataAccess da = new DataAccess();
        string ItemId = Session["ItemId"].ToString();
        ImageButton ImageButton1 = sender as ImageButton;
        int count = Convert.ToInt32(ImageButton1.ValidationGroup); //这个是点击的行的索引 也就是行数
        //int id = Convert.ToInt32(ImageButton1.CommandArgument); //这个是点击的行的ID
        HiddenField Id = (HiddenField)(DataList2.Items[count].FindControl("HiddenField2"));
        string sqls = " DELETE FROM Item_Tag WHERE ItemId = " + ItemId + " and  TagId=" + Id.Value;
        da.ExecuteSql(sqls);
        Response.AddHeader("Refresh", "0");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
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
        string sqls = "select ItemId from Item_Tag where ItemId='" + Session["ItemId"].ToString()+ "' and TagId='" + TagId + "'";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count == 0)
        {
            sqls = "INSERT INTO Item_Tag VALUES ('" + Session["ItemId"].ToString() + "','" + TagId + "')";
            da.ExecuteSql(sqls);
            DataList2.DataBind();
        }
        else
        {
            universal un = new universal();
            un.Alert("请不要重复输入", this);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        string sqls = "select UID from Item_User where ItemId='" + Session["ItmeId"].ToString() + "' and IsAccept=1";
        DataSet ds = da.dataSet(sqls);

    }
}