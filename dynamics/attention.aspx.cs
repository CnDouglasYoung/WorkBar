using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dynamics_attention : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label Operate = (Label)e.Item.FindControl("OperateLabel");
        if (Operate.Text == "申请加入项目")
        {
            Label ToId = (Label)e.Item.FindControl("ToIdLabel");
            string sqls = "select Name from Item where ItemId=" + ToId.Text;
            DataAccess da = new DataAccess();
            DataSet ds = da.dataSet(sqls);
            string ItemName = ds.Tables[0].Rows[0]["Name"].ToString();
            Label UID = (Label)e.Item.FindControl("UIDLabel");
            sqls = "select Name from User_ where UID=" + UID.Text;
            ds = da.dataSet(sqls);
            string UserName = ds.Tables[0].Rows[0]["Name"].ToString();
            Label zy = (Label)e.Item.FindControl("Label2");
            zy.Text = "用户“"+UserName +"”申请加入您的项目“"+ItemName +"”";
            Label xq = (Label)e.Item.FindControl("Label3");
            Label DetailLabel = (Label)e.Item.FindControl("DetailLabel");
            xq.Text = "申请详情：" + DetailLabel.Text;
            Label FeedbackLabel = (Label)e.Item.FindControl("FeedbackLabel");
            if (FeedbackLabel.Text != "")
            {
                Panel p1 = (Panel)e.Item.FindControl("Panel1");
                Panel p2 = (Panel)e.Item.FindControl("Panel2");
                p1.Visible = false;
                p2.Visible = true;
                Label Label4 = (Label)e.Item.FindControl("Label4");
                if (FeedbackLabel.Text == "True") Label4.Text = "您已同意了该用户的申请";
                else Label4.Text = "您已拒绝了该用户的申请";
            }
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("UIDLabel");
        Label b = (Label)DataList1.Items[count].FindControl("OperateLabel");
        Label c = (Label)DataList1.Items[count].FindControl("ToIdLabel");
        DataAccess da = new DataAccess();
        string sqls = "UPDATE Attention SET Feedback = '1'  WHERE UID = '" + a.Text + "' and Operate='" + b.Text + "' and ToId=" + c.Text; 
        da.ExecuteSql(sqls);
        if (b.Text == "申请加入项目")
        {
            Label UID = (Label)DataList1.Items[count].FindControl("UIDLabel");
            Label ItemId = (Label)DataList1.Items[count].FindControl("ToIdLabel");
            sqls = "INSERT INTO Item_User (UID, ItemId,IsAccept) VALUES ('" + UID.Text + "','" + ItemId.Text + "','1')";
            da.ExecuteSql(sqls);

            sqls = "select Name from Item where ItemId=" + c.Text;
            DataSet ds = da.dataSet(sqls);
            string ItemName = ds.Tables[0].Rows[0]["Name"].ToString();
            string SendUID = Session["UID"].ToString();
            string ReceiveUID = a.Text;
            string Detail = "欢迎您加入我们的项目“" + ItemName + "”,希望我们能在今后的一段日子里合作愉快！";
            string SendTime = DateTime.Now.ToString();
            sqls = "INSERT INTO Letter VALUES ('" + SendUID + "','" + ReceiveUID + "','" + Detail + "','" + SendTime + "','" + "0')";
            da.ExecuteSql(sqls);
            sqls = "select SendUID from Letter where (SendUID=" + ReceiveUID + ") and (ReceiveUID=" + SendUID + ")";
            ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count == 0)
            {
                sqls = "INSERT INTO Letter VALUES ('" + ReceiveUID + "','" + SendUID + "',' ','" + SendTime + "','" + "0')";
                da.ExecuteSql(sqls);
            }
            alertv un = new alertv();
            Response.Write(un.gutAlertUrl("您已成功接受该用户的申请", "./attention.aspx"));
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lb = sender as LinkButton;
        int count = Convert.ToInt32(lb.ValidationGroup); //这个是点击的行的索引 也就是行数
        Label a = (Label)DataList1.Items[count].FindControl("UIDLabel");
        Label b = (Label)DataList1.Items[count].FindControl("OperateLabel");
        Label c = (Label)DataList1.Items[count].FindControl("ToIdLabel");
        DataAccess da = new DataAccess();
        string sqls = "UPDATE Attention SET Feedback = '0'  WHERE UID = '" + a.Text + "' and Operate='" + b.Text + "' and ToId=" + c.Text; 
        da.ExecuteSql(sqls);

        if (b.Text == "申请加入项目")
        {
            sqls = "select Name from Item where ItemId=" + c.Text;
            DataSet ds = da.dataSet(sqls);
            string ItemName = ds.Tables[0].Rows[0]["Name"].ToString();
            string SendUID = Session["UID"].ToString();
            string ReceiveUID = a.Text;
            string Detail = "很遗憾，您未加入我们的项目“" + ItemName + "”,希望您能在这里找到更适合您的项目！";
            string SendTime = DateTime.Now.ToString();
            sqls = "INSERT INTO Letter VALUES ('" + SendUID + "','" + ReceiveUID + "','" + Detail + "','" + SendTime + "','" + "0')";
            da.ExecuteSql(sqls);
            sqls = "select SendUID from Letter where (SendUID=" + ReceiveUID + ") and (ReceiveUID=" + SendUID + ")";
            ds = da.dataSet(sqls);
            if (ds.Tables[0].Rows.Count == 0)
            {
                sqls = "INSERT INTO Letter VALUES ('" + ReceiveUID + "','" + SendUID + "',' ','" + SendTime + "','" + "0')";
                da.ExecuteSql(sqls);
            }
            alertv un = new alertv();
            Response.Write(un.gutAlertUrl("您已拒绝了该用户的申请", "./attention.aspx"));
        }
    }
}