using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Ass_Name_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("BelongItemLabel");
        Label b = (Label)DataList1.Items[count].FindControl("AssIdLabel");
        Session["ItemId"] = a.Text;
        string url = "~/item/ass-content.aspx?AssId="+b.Text;
        Response.Redirect(url, false);
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label Id = (Label)e.Item.FindControl("ScheduleIdLabel");
        Label Id2 = (Label)e.Item.FindControl("AssIdLabel");
        ImageButton ib = (ImageButton)e.Item.FindControl("ImageButton1");
        ib.PostBackUrl = "~/mine/Sch-edit.aspx?SchId=" + Id.Text+"&AssId="+Id2.Text;
    }
}