using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dynamics_Default : System.Web.UI.Page
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
    }
    protected void NameLinkButton_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("SendUIDLabel");
        SendUID.Text = a.Text;
    }
    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label IPL = (Label)e.Item.FindControl("SendUIDLabel");
       Table Tablex  = (Table)e.Item.FindControl("LetterTable");
        if (IPL.Text ==Session["UID"].ToString() )
        {
            Tablex.CssClass = "MyLetter";
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextArea1.Value != "")
        {
            DataAccess da = new DataAccess();
            string SendUIDs = Session["UID"].ToString();
            string ReceiveUID = SendUID.Text;
            string Detail = TextArea1.Value;
            string SendTime = DateTime.Now.ToString();
            string sqls = "INSERT INTO Letter VALUES ('" + SendUIDs+ "','" + ReceiveUID + "','" + Detail + "','" + SendTime + "','" + "0')";
            da.ExecuteSql(sqls);
            TextArea1.Value = "";
            DataList3.DataBind();
        }
    }
}