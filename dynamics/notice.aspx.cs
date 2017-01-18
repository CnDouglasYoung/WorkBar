using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dynamics_notice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label ReadedLabel = (Label)e.Item.FindControl("ReadedLabel");
        if (ReadedLabel != null && ReadedLabel.Text == "False")
        {
            ReadedLabel.Text = "未读";
            Label NoticeIdLabel = (Label)e.Item.FindControl("NoticeIdLabel");
            DataAccess da = new DataAccess();
            string sqls = "Update  Notice_User set Readed=1 where UID='" + Session["UID"].ToString() + "' and NoticeId='" + NoticeIdLabel.Text + "'";
            da.ExecuteSql(sqls);
        }
        else if (ReadedLabel != null)
        {
            ReadedLabel.Text = "已读"; 
            ReadedLabel.ForeColor = System.Drawing.Color.Gray;
        } 
    }
}