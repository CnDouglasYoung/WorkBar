using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 母版页_Default : System.Web.UI.Page
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
    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //一传二
        HyperLink hy = (HyperLink)e.Item.FindControl("HyperLink1");
        Label AssId = (Label)e.Item.FindControl("AssIdLabel");
        Label BelongItem = (Label)e.Item.FindControl("BelongItemLabel");
        if (hy != null) hy.NavigateUrl = "~/item/ass-content.aspx?AssId=" + AssId.Text + "&ItemId=" + BelongItem.Text;
        //项目链接
        //HyperLink IL = (HyperLink)e.Item.FindControl("ItemName");
        //IL.NavigateUrl = "~/item/item.aspx?ItemId=" + BelongItem.Text;
        //重要标红
        Label IPL = (Label)e.Item.FindControl("IsImportantLabel");
        System.Web.UI.HtmlControls.HtmlTableCell IPT = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("isimportent");
        if (IPL.Text == "True")
        {
            IPL.Text = "重要";
            IPT.BgColor = "red";
        }
        else
            IPL.Visible = false;
    }
    protected void DataList3_ItemCommand(Object sender, DataListCommandEventArgs e)
    {
        /*
                switch (e.CommandName)
                {
                    case ("ItemId"):
                        {
                            int _rowIndex = int.Parse(e.CommandArgument.ToString());
                            string txt = ((Label)DataList3.Items[_rowIndex].FindControl("BelongItem")).Text;
                        }
                    //获得了text的值。
                }*/


    }
    protected void ItemName_Click(object sender, EventArgs e)
    {
        /*for (int i = 0; i < DataList3.Items.Count; i++)
        {
            Session["ItemId"] = DataList3.DataKeys[i].ToString();
            string a = Session["ItemId"].ToString();
        }*/
        /*LinkButton ItemName = sender as LinkButton;
        Label ItemId = (Label)this.DataList3.FindControl("BelongItem");
        Session["ItemId"] = ItemId.Text;
        Response.Redirect("~/item/item.aspx", false);*/
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList3.Items[count].FindControl("BelongItemLabel");
        Session["ItemId"] = a.Text;
        Response.Redirect("~/item/item.aspx", false);
    }
    protected void LinkButton19_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList3.Items[count].FindControl("BelongItemLabel");
        Session["ItemId"] = a.Text;
        Label AssId = (Label)DataList3.Items[count].FindControl("AssIdLabel");
        string theA = "~/item/ass-content.aspx?AssId=" + AssId.Text;
        Response.Redirect(theA, false);
    }
}
