using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_ass_add2 : System.Web.UI.Page
{
    public string AssId= "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
        SqlConnection conn = new SqlConnection(strCon);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(new SqlParameter("@UID", SqlDbType.NVarChar, 16));
        cmd.Parameters["@UID"].Value = Session["UID"].ToString();
        cmd.Connection = conn;
        cmd.CommandText =" SELECT   TOP (1) AssId FROM  dbo.Assignment  WHERE   (ResponsibleUID = @UID)  ORDER BY CreateTime DESC";
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            AssId = reader["AssId"].ToString();
        }
        reader.Close();
        conn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string a = "添加的参与人有：";
        foreach (DataListItem item in this.DataList1.Items)
        {
            CheckBox CB = (CheckBox)item.FindControl("CheckBox1");
            HiddenField HF =(HiddenField)item.FindControl("HiddenField1");
            if (CB.Checked == true)
            {
                a = a + "  "+HF.Value.ToString();
                DataAccess da = new DataAccess();
                string UID = HF.Value.ToString();
                string CreateTime = DateTime.Now.ToString();
                string sqls = "INSERT INTO Ass_User VALUES ('" + AssId + "','" + UID + "','" + CreateTime + "')";
                da.ExecuteSql(sqls);
            }
        }  
        /*for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            string Checked = ((CheckBox)GridView1.Rows[i].FindControl("cbxId")).Checked.ToString();
            if (Checked=="True")
            {
                DataAccess da = new DataAccess();
                string UID = ((HiddenField)GridView1.Rows[i].FindControl("HiddenField1")).Value.ToString();
                string CreateTime = DateTime.Now.ToString();
                string sqls = "INSERT INTO Ass_User VALUES ('" + AssId + "','" + UID + "','" + CreateTime + "')";
                da.ExecuteSql(sqls);
                a = a + GridView1.Rows[i].Cells[0].Text.Trim()+"  ";ghjjjtgfyytr4
            }
        }*/
        if (a != "添加的参与人有：") 
        { 
            universal thisUn = new universal();
            thisUn.Alert(a, this);
        }
        Response.Redirect("~/item/ass-add3.aspx", false);
    }
}