using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _item_tag : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccess da = new DataAccess();
        string TagId = Request.QueryString["TagId"].ToString();
        string sqls = "select TagName from Tag where TagId='" + TagId + "'";
        DataSet ds = da.dataSet(sqls);
        Label1.Text = ds.Tables[0].Rows[0]["TagName"].ToString();
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}