using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.IsPostBack == false)
        {
            this.HiddenField1.Value = DateTime.Today.ToString();
            DataAccess da = new DataAccess();
            string sqls = "select DISTINCT Assignment.AssId from Assignment INNER JOIN Ass_User ON Assignment.AssId = Ass_User.AssId where Assignment.EndTime='" + HiddenField1.Value + "' and (Assignment.ResponsibleUID=" + Session["UID"].ToString() + "or Ass_User.UID=" + Session["UID"].ToString() + ")";
            DataSet ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count == null || ds.Tables[0].Rows.Count == 0) Label1.Visible = true;
            sqls = "select CreateTime from Schedule where Convert(varchar(10),Schedule.EndTime,111)='" + HiddenField1.Value + "'";
            ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count == null || ds.Tables[0].Rows.Count == 0) Label4.Visible = true;
        }
        
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        string beginDay = this.C1.SelectedDate.ToShortDateString();
        this.HiddenField1.Value = beginDay;
        DataAccess da = new DataAccess();
        string sqls = "select DISTINCT Assignment.AssId from Assignment INNER JOIN Ass_User ON Assignment.AssId = Ass_User.AssId where Assignment.EndTime='" + HiddenField1.Value + "' and (Assignment.ResponsibleUID=" + Session["UID"].ToString() + "or Ass_User.UID=" + Session["UID"].ToString() + ")";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count == null || ds.Tables[0].Rows.Count == 0) Label1.Visible = true;
        else Label1.Visible = false;
        sqls = "select CreateTime from Schedule where Convert(varchar(10),Schedule.EndTime,111)='" + HiddenField1.Value + "' and UID=" + Session["UID"].ToString();
        ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows.Count == null || ds.Tables[0].Rows.Count == 0) Label4.Visible = true;
        else Label4.Visible = false;
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

    protected void ItemName_Click(object sender, EventArgs e)
    {
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
    protected void C1_DataBinding(object sender, EventArgs e)
    {

    }
    protected void Ass_Name_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("BelongItemLabel");
        Label b = (Label)DataList1.Items[count].FindControl("AssIdLabel");
        Session["ItemId"] = a.Text;
        string url = "~/item/ass-content.aspx?AssId=" + b.Text;
        Response.Redirect(url, false);
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label Id = (Label)e.Item.FindControl("ScheduleIdLabel");
        Label Id2 = (Label)e.Item.FindControl("AssIdLabel");
        ImageButton ib = (ImageButton)e.Item.FindControl("ImageButton1");
        ib.PostBackUrl = "~/mine/Sch-edit.aspx?SchId=" + Id.Text + "&AssId=" + Id2.Text;
    }
    protected void DataList3_Load(object sender, EventArgs e)
    {

    }
}