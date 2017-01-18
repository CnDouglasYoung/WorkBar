using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;

public partial class item_ass_add : System.Web.UI.Page
{

    public string AssId ;
    DataAccess da = new DataAccess();

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
            AssId = "0";
            HiddenField1.Value = "0";
        }
        else {
            AssId = HiddenField1.Value;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ItemId"] = DropDownList1.Text;
        string a = Session["ItemId"].ToString();
    }
    protected void DropDownList1_DataBinding(object sender, EventArgs e)
    {
        if (Session["ItemId"]!=null&&Session["ItemId"].ToString() != "")
        {
            DropDownList1.SelectedValue = Session["ItemId"].ToString();
        }
        else
        {
            string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
            string ItemId1 = "";
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@UID", SqlDbType.NVarChar, 16));
            cmd.Parameters["@UID"].Value = Session["UID"].ToString();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT   Fav_Item.ItemId1  FROM    dbo.Fav_Item  WHERE   dbo.Fav_Item.UID =@UID";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                ItemId1 = reader["ItemId1"].ToString();
                Session["ItemId"] = ItemId1;

            }
            if (ItemId1 != null)
            {
                DropDownList1.SelectedValue = ItemId1;
            }
            reader.Close();
            conn.Close();
        }
        /*
        if (Session["ItemId"] == null) { DropDownList1.SelectedValue = Session["ItemId"].ToString(); }
        else
        {
            if (DropDownList1.Items.Count > 0)
            {
                DropDownList1.SelectedIndex = 0;
            }
            else
            {
                DropDownList1.SelectedIndex = -1;
            }
        }
         */
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        universal thisUn = new universal();
        string Err = "0";
        //正则表达式
        if ((TextBox2.Text == "") || (TextBox3.Text == ""))
        {
            Err = "5";
            thisUn.Alert("错误：未输入开始时间或结束时间", this);
        }
        else
        {
            DateTime st = DateTime.Parse(TextBox2.Text);
            DateTime et = DateTime.Parse(TextBox3.Text);
            TimeSpan ts = st.Subtract(et);

            if (ts.Days > 0)
            {
                Err = "1";
                thisUn.Alert("错误：结束时间早于开始时间", this);
            }
        }
        if (DropDownList1.SelectedValue == null)
        {
            Err = "2";
            thisUn.Alert("错误：未选择所属项目", this);
        }
        if (DropDownList2.SelectedValue == null)
        {
            Err = "3";
            thisUn.Alert("错误：未选择所属列表", this);
        }
        if (TextBox1.Text == "")
        {
            Err = "4";
            thisUn.Alert("错误：未输入任务名", this);
        }
        if (Err == "0")
        {
            
            string Name = TextBox1.Text;
            string ResponsibleUID = Session["UID"].ToString();
            string Remark = TextArea1.Value;
            string BelongItem = DropDownList1.SelectedValue;
            string BelongList = DropDownList2.SelectedValue;
            string CreateTime = DateTime.Now.ToString();
            string BeginTime = TextBox2.Text;
            string EndTime = TextBox3.Text;
            string IsImportant = "0";
            if (CheckBox1.Checked.ToString() == "True") IsImportant = "1";
            string sqls = "INSERT INTO Assignment(Name,ResponsibleUID,Remark,BelongItem,BelongList,CreateTime,BeginTime,EndTime,IsImportant) VALUES ('";
            sqls = sqls + Name + "','" + ResponsibleUID + "','" + Remark + "','" + BelongItem + "','" + BelongList + "','" + CreateTime + "','" + BeginTime + "','" + EndTime + "','" + IsImportant + "')";
            da.ExecuteSql(sqls);
            sqls = "SELECT   TOP (1) AssId FROM  dbo.Assignment  WHERE   (ResponsibleUID = '" + Session["UID"].ToString() + "')  ORDER BY CreateTime DESC";
            DataSet ds=da.dataSet(sqls);
            AssId = ds.Tables[0].Rows[0]["AssId"].ToString();
            HiddenField1.Value = AssId;
            Panel1.Enabled = false;
            Panel2.Visible = true;
            thisUn.Alert("创建任务成功", this);
            
        }
    }





    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {        
        CheckBox CB = (CheckBox)e.Item.FindControl("CheckBox1");
        HiddenField UID = (HiddenField)e.Item.FindControl("HiddenField1");
        if (UID != null)
        {
            string sqls = "select AssId from Ass_User where (AssId=" + AssId + ") and (UID= " + UID.Value + ")";
            DataSet ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count != 0) CB.Checked = true;
        }
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
        string sqls = "select AssId from Ass_Tag where AssId='" + AssId + "' and TagId='" + TagId + "'";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count == 0)
        {
            sqls = "INSERT INTO Ass_Tag VALUES ('" + AssId + "','" + TagId + "')";
            da.ExecuteSql(sqls);
            DataList2.DataBind();
        }
        else
        {
            universal un = new universal();
            un.Alert("请不要重复输入", this);
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = sender as ImageButton;
        int count = Convert.ToInt32(ImageButton1.ValidationGroup); //这个是点击的行的索引 也就是行数
        //int id = Convert.ToInt32(ImageButton1.CommandArgument); //这个是点击的行的ID
        HiddenField Id = (HiddenField)(DataList2.Items[count].FindControl("HiddenField2"));
        string sqls = " DELETE FROM Ass_Tag WHERE AssId = " + AssId + " and  TagId=" + Id.Value;
        da.ExecuteSql(sqls);
        DataList2.DataBind();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {

        DataAccess da = new DataAccess();
        if (RadioButtonList1.SelectedValue != null)
        {
            string RUID = RadioButtonList1.SelectedValue.ToString();
            string sqls = "select UID from Ass_User where UID=" + RUID + "  And AssId=" + AssId;
            DataSet ds = da.dataSet(sqls);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    sqls = "DELETE FROM Ass_User WHERE UID = " + RUID;
                    da.ExecuteSql(sqls);
                    sqls = "UPDATE Assignment SET ResponsibleUID = " + RUID + " WHERE ResponsibleUID = " + Session["UID"].ToString() + "and AssId=" + AssId;
                    da.ExecuteSql(sqls);
                }
                else
                {
                    sqls = "UPDATE Assignment SET ResponsibleUID = '" + RUID + "'  WHERE ResponsibleUID = " + Session["UID"].ToString() + "AND AssId=" + AssId;
                    da.ExecuteSql(sqls);
                }
                string CreateTime = DateTime.Now.ToString();
                sqls = "INSERT INTO Ass_User(AssId,UID,CreateTime) VALUES ('" + AssId + "','" + Session["UID"] + "','" + CreateTime + "')";
                da.ExecuteSql(sqls);
                alertv al = new alertv();
                Response.Write(al.gutAlertUrl("权限移交成功", "item.aspx"));
            }
            else
            {
                alertv al = new alertv();
                Response.Write(al.gutAlertUrl("权限未移交", "item.aspx"));
            }
        }
        
    }


    protected void Button8_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in this.DataList1.Items)
        {
            CheckBox CB = (CheckBox)item.FindControl("CheckBox1");
            HiddenField HF = (HiddenField)item.FindControl("HiddenField1");
            string UID = HF.Value.ToString();
            string CreateTime = DateTime.Now.ToString();
            string sqls = "select UID from Ass_User where AssId=" + AssId + "and  UID=" + UID;
            if (CB.Checked == true)
            {
                DataAccess da = new DataAccess();
                DataSet ds = da.dataSet(sqls);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    sqls = "INSERT INTO Ass_User VALUES ('" + AssId + "','" + UID + "','" + CreateTime + "')";
                    da.ExecuteSql(sqls);
                }
            }
            else
            {
                DataAccess da = new DataAccess();
                DataSet ds = da.dataSet(sqls);
                if (ds == null || ds.Tables[0].Rows.Count != 0)
                {
                    sqls = "delete from Ass_User where AssId=" + AssId + "and  UID=" + UID;
                    da.ExecuteSql(sqls);
                }
            }
        }
        Panel2.Enabled = false;
        Panel3.Visible = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string Name = TextBox1.Text;
        string Remark = TextArea1.Value;
        string BeginTime = TextBox2.Text;
        string EndTime = TextBox3.Text;
        string IsImportant = CheckBox1.Checked.ToString();
        string sqls = "UPDATE Assignment SET Name = '" + Name + "', Remark = '" + Remark + "', BeginTime = '" + BeginTime + "', EndTime = '" + EndTime + "', IsImportant = '" + IsImportant + "' WHERE AssId = '" + AssId + "'";
        da.ExecuteSql(sqls);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel3.Enabled = false;
        Panel4.Visible = true;
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox2.Checked == true)
        {
            Button7.Attributes.Add("onclick", "return confirm('确定要移交权限吗');");
            RadioButtonList1.Visible = true;
        }
        else
        {
            Button7.Attributes.Remove("onclick");
            RadioButtonList1.Visible = false;
        }
    }
}