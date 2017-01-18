using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
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
        if (Session["ItemId"] == null)
        {
            Response.Redirect("~/Login.aspx", false);
        }
        else if (Session["ItemId"].ToString() == "")
        {
            Response.Redirect("~/Login.aspx", false);
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ItemId"] = DropDownList1.Text;
        string a = Session["ItemId"].ToString();
    }
    protected void DropDownList1_DataBinding(object sender, EventArgs e)
    {
        if (Session["ItemId"] == null)
        {
            Response.Redirect("~/Login.aspx", false);
        }
        else if (Session["ItemId"].ToString() == "")
        {
            Response.Redirect("~/Login.aspx", false);
        }
        else
        {
            DropDownList1.SelectedValue = Session["ItemId"].ToString();
        }
    }
    protected void LinkButton18_Click(object sender, EventArgs e)
    {
            Session["Tag"] = "1";
        Response.Redirect("~/item/item.aspx");
    }
    protected void LinkButton19_Click(object sender, EventArgs e)
    {
            Session["Tag"] = "2";
        Response.Redirect("~/item/file.aspx");
    }
    protected void LinkButton21_Click(object sender, EventArgs e)
    {
            Session["Tag"] = "3";
        Response.Redirect("~/item/details.aspx");
    }
}
