using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
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
        //if (this.Page.IsPostBack == true)
        {
            if (DataList1.Items.Count == 0)
            {
                ImageButton2.Visible = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("Label1");

        Session["ItemId"] = a.Text;
        Response.Redirect("~/item/item.aspx");
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton lb = sender as ImageButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("Label1");

        Session["ItemId"] = a.Text;
        Response.Redirect("~/item/item-edit.aspx");
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label a = (Label)e.Item.FindControl("Label1");
        ImageButton ib =  (ImageButton)e.Item.FindControl("ImageButton1");
        DataAccess da = new DataAccess();
        string sqls = "select UID from Item_User where (Limit=1) and (ItemId=" + a.Text+")";
        DataSet ds = da.dataSet(sqls);
        if (Session["UID"].ToString() == ds.Tables[0].Rows[0]["UID"].ToString()) ib.Visible = true;
    }
}