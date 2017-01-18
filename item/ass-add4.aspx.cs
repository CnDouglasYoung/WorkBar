using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_ass_add : System.Web.UI.Page
{
    public string AssId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        string sqls=" SELECT   TOP (1) AssId FROM  dbo.Assignment  WHERE   (ResponsibleUID = "+Session["UID"].ToString ()+")  ORDER BY CreateTime DESC";
        DataSet ds = da.dataSet(sqls);
        AssId=ds.Tables[0].Rows[0]["AssId"].ToString();
        HiddenField1.Value = AssId;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked.ToString() == "True")
        {
            RadioButtonList1.Visible = true;
        }
        else
        {
            RadioButtonList1.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked.ToString() == "True")
        {
            DataAccess da = new DataAccess();
            string RUID = RadioButtonList1.SelectedValue.ToString();
            string sqls = "select UID from Ass_User where UID="+RUID+"  And AssId="+AssId;
            DataSet ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count>0)
            {
                Label2.Text = "有效";
                sqls = "DELETE FROM Ass_User WHERE UID = " + RUID;
                da.ExecuteSql(sqls);
                sqls = "UPDATE Assignment SET ResponsibleUID = " + RUID + " WHERE ResponsibleUID = " + Session["UID"].ToString();
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
        }
        
        Response.Redirect("~/item/item-list.aspx", false);

    }
}