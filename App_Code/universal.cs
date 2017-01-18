using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// universal 的摘要说明
/// </summary>
public class universal
{
	public universal()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    //弹出信息，信息内容为info
    public void Alert(string info, Page p)
    {
        string script = "<script>alert('" + info + "')</script>";
        p.ClientScript.RegisterStartupScript(p.GetType(), "", script);
    }
}