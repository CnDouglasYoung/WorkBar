using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_ass_edit : System.Web.UI.Page
{
    public string AssId = "";
    universal un = new universal();
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
        MultiView1.SetActiveView(View1);
        AssId = Request.QueryString["AssId"];
        
        string sqls="select Name,Remark,BeginTime,EndTime,ResponsibleUID,IsImportant from Assignment where AssId="+AssId;
        DataSet ds = da.dataSet(sqls);
        string UID = ds.Tables[0].Rows[0]["ResponsibleUID"].ToString();
        if (UID != Session["UID"].ToString())
        {
            Response.Redirect("~/Login.aspx");
        }
        if (this.Page.IsPostBack == false)
        {
            TextBox1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            TextBox2.Text = ds.Tables[0].Rows[0]["BeginTime"].ToString();
            TextBox3.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
            TextArea1.Value = ds.Tables[0].Rows[0]["Remark"].ToString();
            if (ds.Tables[0].Rows[0]["IsImportant"].ToString() == "True") CheckBox1.Checked = true;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        MultiView1.SetActiveView(View1);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View3);
    }


    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        CheckBox CB = (CheckBox)e.Item.FindControl("CheckBox1");
        HiddenField UID = (HiddenField)e.Item.FindControl("HiddenField1");
        string sqls = "select AssId from Ass_User where (AssId="+AssId+") and (UID= "+ UID.Value+")";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count !=0) CB.Checked = true ;
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
        string sqls = " DELETE FROM Ass_Tag WHERE AssId = "+AssId + " and  TagId="+Id.Value;
        da.ExecuteSql(sqls);
        Response.AddHeader("Refresh", "0");
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        
            DataAccess da = new DataAccess();
            string RUID = RadioButtonList1.SelectedValue.ToString();
            string sqls = "select UID from Ass_User where UID="+RUID+"  And AssId="+AssId;
            DataSet ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count>0)
            {
                sqls = "DELETE FROM Ass_User WHERE UID = " + RUID;
                da.ExecuteSql(sqls);
                sqls = "UPDATE Assignment SET ResponsibleUID = " + RUID + " WHERE ResponsibleUID = " + Session["UID"].ToString()+"and AssId="+AssId;
                da.ExecuteSql(sqls);
            }
            else
            {
                sqls = "UPDATE Assignment SET ResponsibleUID = " + RUID + "  WHERE ResponsibleUID = " + Session["UID"].ToString() + "AND AssId=" + AssId;
                da.ExecuteSql(sqls);
            }
            string CreateTime = DateTime.Now.ToString();
            sqls = "INSERT INTO Ass_User(AssId,UID,CreateTime) VALUES ('" + AssId + "','" + Session["UID"] + "','" + CreateTime+ "')";
            da.ExecuteSql(sqls);
            alertv al = new alertv();
            Response.Write(al.gutAlertUrl("权限移交成功", "item.aspx"));
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View4);
        Button7.Attributes.Add("onclick", "return confirm('确定要移交权限吗');");
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
        universal un = new universal();
        un.Alert("修改成功", this);
        DataList1.DataBind();
        
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
        alertv al = new alertv();
        Response.Write(al.gutAlertUrl("修改成功", "ass-edit.aspx?AssId="+Request .QueryString["AssId"].ToString()));
    }
}