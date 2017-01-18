using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class dynamics_letter_send : System.Web.UI.Page
{
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
        string ToUID = Request.QueryString["UID"].ToString();
        DataAccess da = new DataAccess();
        string sqls = "select Name from User_ WHERE UID=" + ToUID;
        DataSet ds = da.dataSet(sqls);
        Label1.Text = ds.Tables[0].Rows[0]["Name"].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        universal un = new universal();
        if (TextArea1.Value != "")
        {            
            string SendUID = Session["UID"].ToString();
            string ReceiveUID= Request.QueryString["UID"].ToString();
            string Detail =TextArea1.Value;
            string SendTime=DateTime.Now.ToString();
            string sqls = "INSERT INTO Letter VALUES ('" + SendUID + "','" + ReceiveUID + "','" + Detail + "','" + SendTime + "','" + "0')";
            da.ExecuteSql(sqls);            
            un.Alert("发送成功", this);
            sqls = "select SendUID from Letter where (SendUID=" + ReceiveUID + ") and (ReceiveUID=" + SendUID + ")";
            DataSet ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count == 0)
            {
                sqls = "INSERT INTO Letter VALUES ('" + ReceiveUID + "','" + SendUID + "',' ','" + SendTime + "','" + "0')";
                da.ExecuteSql(sqls);           
            }
        }
        else
        {
            un.Alert("发送内容不得为空", this);
        }

        TextArea1.Value = "";
    }
}