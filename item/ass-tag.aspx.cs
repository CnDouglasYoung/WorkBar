using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_ass_tag : System.Web.UI.Page
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
    protected void DataList3_DataBinding(object sender, EventArgs e)
    {

    }
    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        
        //一传二
        HyperLink hy = (HyperLink)e.Item.FindControl("HyperLink1");
        Label AssId = (Label)e.Item.FindControl("AssIdLabel");
        if (hy != null) hy.NavigateUrl = "~/item/ass-content.aspx?AssId=" + AssId.Text ;
        //重要标红
        Label IPL = (Label)e.Item.FindControl("IsImportantLabel");
        System.Web.UI.HtmlControls.HtmlTableCell IPT = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("isimportent");
        if (IPL.Text == "True")
        {
            IPL.Text = "重要";
            IPT.BgColor = "red";
        }
    }
    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Button TagButton = (Button)e.Item.FindControl("Button2");
        TagButton.PostBackUrl = "~/item/ass-tag.aspx?TagId=" + TagButton.PostBackUrl;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}