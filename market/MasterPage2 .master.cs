using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class market_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UID"] == null || Session["UID"].ToString() == "")
        {
            Label1.Text = "游客";
            HyperLink5.Visible = false;
        }
        else
        {
            DataAccess da = new DataAccess();
            string sqls = "select Name from User_ where UID = " + Session["UID"].ToString();
            DataSet ds = da.dataSet(sqls);
            Label1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            LinkButton1.Visible = false;
            HyperLink5.NavigateUrl = "~/item/item-list.aspx";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DataList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string a = "user-search.aspx?Text=" + TextBox1.Text;
        Response.Redirect(a, false);
    }
}