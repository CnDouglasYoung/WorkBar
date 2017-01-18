using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class taolun1 : System.Web.UI.Page
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
        else
        {
            string sqls = "select HeadPhoto,Name from User_ where UID=" + Session["UID"].ToString();
            DataAccess da = new DataAccess();
            DataSet ds = da.dataSet(sqls);
            Image1.ImageUrl = ds.Tables[0].Rows[0]["HeadPhoto"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        }


    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx", false);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ItemId"] = DropDownList1.Text;
        string a = Session["ItemId"].ToString();
    }
    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_DataBinding(object sender, EventArgs e)
    {
        if(Session["ItemId"].ToString()!="")DropDownList1.SelectedValue = Session["ItemId"].ToString();
        else
        {
            if (DropDownList1.Items.Count > 0)
            {
                DropDownList1.SelectedIndex = 0;
            }
            else
            {
                DropDownList1.SelectedIndex = -1;
            }
        }
    }
    protected void DropDownList1_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        universal thisUn = new universal();
        string ThisDetail = TL.Value;
        if (ThisDetail != "")
        {
            DataAccess DA = new DataAccess();
            string ThisUID = Session["UID"].ToString();
            string ThisItemId = Session["ItemId"].ToString();
            //int ii = dt.GetHashCode();
            string ThisCreateTime = DateTime.Now.ToString();
            string SqlStr = "INSERT INTO Discuss(ItemId,UID,Detail,CreateTime) VALUES ('" + ThisItemId + "','" + ThisUID + "','" + ThisDetail + "','" + ThisCreateTime + "')";
            DA.ExecuteSql(SqlStr);
            Response.Redirect(Request.Url.ToString());
        }
        else
        {
            thisUn.Alert("你的留言不得为空", this);
        }
    }
}