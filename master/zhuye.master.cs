using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UID"]==null)
        {
            Response.Redirect("~/Login.aspx", false);}
        else if (Session["UID"].ToString() == "")
         {
            Response.Redirect("~/Login.aspx",false);
        }
        else
        {
            string sqls = "select HeadPhoto,Name from User_ where UID=" + Session["UID"].ToString();
            DataAccess da = new DataAccess();
            DataSet ds = da.dataSet(sqls);
            Image1.ImageUrl = ds.Tables[0].Rows[0]["HeadPhoto"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        }
        Session["Tag"] = "1";
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx", false);
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Session["Tag"] = "2";
        Response.Redirect("~/dynamics/letter.aspx");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Session["Tag"] = "2";
        Response.Redirect("~/dynamics/attention.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Session["Tag"] = "3";
        Response.Redirect("~/dynamics/notice.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Session["Tag"] = "1";
        Response.Redirect("~/mine/guanzhu.aspx");
    }
    protected void LinkButton13_Click(object sender, EventArgs e)
    {
            Session["Tag"] = "2";
        Response.Redirect("~/mine/schedule.aspx");
    }
    protected void LinkButton14_Click(object sender, EventArgs e)
    {
             Session["Tag"] = "3";
        Response.Redirect("~/mine/calendars.aspx");
    }
    protected void LinkButton6_Click1(object sender, EventArgs e)
    {
             Session["Tag"] = "1";
        Response.Redirect("~/item/item-list.aspx");
    }
}
