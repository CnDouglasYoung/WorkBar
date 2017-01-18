using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class market_item_content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (Session["UID"] != null && Session["UID"].ToString() != "")
        {
            Button B = (Button)e.Item.FindControl("shenqing");
            string ItemId = Request.QueryString["ItemId"].ToString();
            DataAccess da = new DataAccess();
            string sqls = "select UID from Item_User where UID=" + Session["UID"] + " and ItemId=" + ItemId;
            DataSet ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count == 0) B.Visible = true;
        }
        Label UserNumberLabel = (Label)e.Item.FindControl("UserNumberLabel");
        if (UserNumberLabel.Text == "0") UserNumberLabel.Text = "未设定";
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void shenqing_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        string ItemId = Request.QueryString["ItemId"].ToString();
        string sqls = "select UID from Item_User where Limit=1 and ItemId=" + ItemId;
        DataSet ds = da.dataSet(sqls);
        string ToUID = ds.Tables[0].Rows[0]["UID"].ToString();
        string Detail=textarea1.Value;
        string CreateTime=DateTime.Now.ToString();
        sqls = "INSERT INTO Attention(UID,ToUID,Operate,Detail,ToId,CreateTime) VALUES ('" + Session["UID"].ToString() + "','" + ToUID + "','申请加入项目','" + Detail + "','" + ItemId + "','" + CreateTime + "')";
        da.ExecuteSql(sqls);
        /*universal un = new universal();
        un.Alert("已提交申请，请耐心等候项目负责人的回复", this);
        Response.RedirectPermanent("~/market/Default.aspx");*/
        alertv al = new alertv();
        Response.Write(al.gutAlertUrl("已提交申请，请耐心等候项目负责人的回复", "Default.aspx"));
    }
}