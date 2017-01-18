using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label3.Text = (string)DataList1.FindControl("Lable1");
       // Label3.Text = Session["ItemId"].ToString();
        if (Session["UID"] == null)
        {
            Response.Redirect("~/Login.aspx", false);
        }
        else if (Session["UID"].ToString() == "")
        {
            Response.Redirect("~/Login.aspx", false);
        }
        
      
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
       // this.MultiView1.ActiveViewIndex = 0;
       //Panle1.visible = true;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
       // this.MultiView1.ActiveViewIndex = 1;
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        //this.MultiView1.ActiveViewIndex = 2;
    }

    protected void DataList3_DataBinding(object sender, EventArgs e)
    {
        
       /* Label t1 = (Label)DataList1.Items[0].FindControl("IsImportantLabel");
        if (t1.Text == "ture")
        {
            DataList3.Items[0].IsImportantLabel.text = "重要";
        }
        TableCell td=(TableCell)DataList3.Items[0].FindControl("isimportent");*/
      


     
    }

    protected void DataList3_Load(object sender, EventArgs e)
    {

    }
    protected void DataList2_DataBinding(object sender, EventArgs e)
    {
       
    }
    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //一传二
        HyperLink hy = (HyperLink)e.Item.FindControl("HyperLink1");
        Label AssId=(Label )e.Item.FindControl("AssIdLabel");
        Label ItemId =(Label)DataListKey.Items[0].FindControl("Label2");
        if (hy != null) hy.NavigateUrl = "./ass-content.aspx?AssId="+AssId.Text+"&ItemId="+ItemId.Text;
        //重要标红
        Label IPL = (Label)e.Item.FindControl("IsImportantLabel");
        System.Web.UI.HtmlControls.HtmlTableCell IPT = (System.Web.UI.HtmlControls.HtmlTableCell)e.Item.FindControl("isimportent");
        if (IPL.Text == "True")
        {
            IPL.Text = "重要";
            IPT.BgColor = "red";
        }
        else
        {
            IPL.Visible = false;
        }
        DataAccess da = new DataAccess();
        string sqls = "select IsFinish from Assignment where AssId='" + AssId.Text + "'";
        DataSet ds = da.dataSet(sqls);
        if (ds.Tables[0].Rows[0]["IsFinish"].ToString() == "True")
        {
            IPT.BgColor = "gray";
        }

    /*    if (DataList2.Items.Count > 0)
        {
            if (DataList2.Items[0].FindControl("DataList3") != null)
            {
                DataList dl3 = (DataList)DataList2.Items[0].FindControl("DataList3");
                if (dl3.Items.Count > 0)
                {
                    HyperLink hy = (HyperLink)dl3.Items[0].FindControl("HyperLink1");
                    hy.NavigateUrl = "./ass-content.aspx?ItemId&ccc";
                }
            }
        }
     * */

    }
    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
       // DataList dl3 = (DataList)DataList2.Items[0].FindControl("DataList3");


    }
    protected void DataListKey_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DataListKey_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        LinkButton ib = (LinkButton)e.Item.FindControl("LinkButton1");
        DataAccess da = new DataAccess();
        string sqls = "select UID from Item_User where (Limit=1) and (ItemId='" + Session["ItemId"].ToString() + "')";
        DataSet ds = da.dataSet(sqls);
        if (Session["UID"].ToString() == ds.Tables[0].Rows[0]["UID"].ToString()) ib.Visible = true;
    }
}