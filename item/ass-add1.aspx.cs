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


public partial class item_ass_add1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
   /* protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox2.Text = this.Calendar1.SelectedDate.ToShortDateString();
    }*/
     protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ItemId"] = DropDownList1.Text;
        string a = Session["ItemId"].ToString();
    }
    protected void DropDownList1_DataBinding(object sender, EventArgs e)
    {
        if (Session["ItemId"] .ToString()!="") { 
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
                Session["ItemId"]=ItemId1;
                
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
        if ((TextBox2.Text == "") || (TextBox3.Text ==""))
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
        if (DropDownList1.SelectedValue == null) {
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
            DataAccess DA = new DataAccess();
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
            string SqlStr = "INSERT INTO Assignment(Name,ResponsibleUID,Remark,BelongItem,BelongList,CreateTime,BeginTime,EndTime,IsImportant) VALUES ('";
            SqlStr = SqlStr + Name + "','" + ResponsibleUID + "','" + Remark + "','" + BelongItem + "','" + BelongList + "','" + CreateTime + "','" + BeginTime + "','" + EndTime + "','" + IsImportant + "')";
            DA.ExecuteSql(SqlStr);
            thisUn.Alert("创建任务成功", this);

            Response.Redirect("~/item/ass-add2.aspx", false);
        }

    }


}