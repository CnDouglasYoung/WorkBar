using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //PanelLY.VerticalScroll.Value = PanelLY.VerticalScroll.Maximum;
        if (Session["UID"] == null)
        {
            Response.Redirect("~/Login.aspx", false);
        }
        else if (Session["UID"].ToString() == "")
        {
            Response.Redirect("~/Login.aspx", false);
        }
        DataAccess da = new DataAccess();
        string AssId = Request.QueryString["AssId"].ToString();
        string sqls = "select IsFinish from Assignment where AssId='" + AssId + "'";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows[0]["IsFinish"].ToString() == "True")
        {
            Buttonn.Text = "已完成";
            Buttonn.BackColor = System.Drawing.Color.Gray;
            Buttonn.Enabled = false;
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        universal thisUn = new universal();
        string ThisDetail = LiuYan.Value;
        if (ThisDetail != "")
        {
            DataAccess DA = new DataAccess();
            //thisUn.Alert( DA.ConnectionTest(), this);
            string ThisAssId = Request.QueryString["AssId"];
            string ThisUID = Session["UID"].ToString();
            DateTime dt = DateTime.Now;
            //int ii = dt.GetHashCode();
            string ThisCreateTime = DateTime.Now.ToString();
            string SqlStr = "INSERT INTO Ass_Comment(AssId,CreateUID,Detail,CreatTime) VALUES ('" + ThisAssId + "','" + ThisUID + "','" + ThisDetail + "','" + ThisCreateTime + "')";
            DA.ExecuteSql(SqlStr);
            Response.Redirect(Request.Url.ToString());  
        }
        else
        {           
            thisUn.Alert("你的留言不得为空", this);
        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label IPL = (Label)e.Item.FindControl("IsImportantLabel");
        if (IPL.Text == "True")
        {
            IPL.Text = "[重要]";
            IPL.ForeColor = System.Drawing.Color.Red; 
            IPL.Visible=true;
        }
        Label ResponsibleUIDLabel = (Label)e.Item.FindControl("ResponsibleUIDLabel");
        string a = Session["UID"].ToString();
        if (ResponsibleUIDLabel.Text == Session["UID"].ToString())
        {
            ImageButton IconSet = (ImageButton)e.Item.FindControl("IconSet");
            IconSet.Visible = true;
            Buttonn.Visible = true;
        }
        Label AssIdLabel = (Label)e.Item.FindControl("AssIdLabel");
        ImageButton IconSet1 = (ImageButton)e.Item.FindControl("IconSet");
        IconSet1.PostBackUrl = "~/item/ass-edit.aspx?AssId=" + AssIdLabel.Text;
    }
    protected void DataList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Button TagButton = (Button)e.Item.FindControl("Button2");      
        TagButton.PostBackUrl = "~/item/ass-tag.aspx?TagId=" + TagButton.PostBackUrl;
    }
    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Button TagButton = (Button)e.Item.FindControl("Button4");
        TagButton.PostBackUrl = "~/item/ass-user.aspx?UID=" + TagButton.PostBackUrl;
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void IconSet_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void Buttonn_Click(object sender, EventArgs e)
    {
        string AssId = Request.QueryString["AssId"].ToString();
        DataAccess da = new DataAccess();
        string sqls = "UPDATE Assignment SET IsFinish = 1 WHERE AssId = '" + AssId + "'";
        da.ExecuteSql(sqls);
        Response.AddHeader("Refresh", "0"); 
    }
}