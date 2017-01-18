using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 母版页_MasterPage5 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton16.PostBackUrl = "~/item/item.aspx?ItemId=" ;
        LinkButton17.PostBackUrl = "~/item/file.aspx?ItemId=" ;
        LinkButton18.PostBackUrl = "~/item/file.aspx?ItemId=" ;
        LinkButton19.PostBackUrl = "~/item/file.aspx?ItemId=" ;
    }
}
