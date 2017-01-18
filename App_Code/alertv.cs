using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// js方法弹出提示框
/// </summary>
public class alertv
{
    /// <summary>
    /// js方法弹出提示框
    /// </summary>
    /// <param name="msg">提示信息</param>
    /// <param name="goUrl">跳转页面</param>
    /// <returns></returns>
    public string gutAlertUrl(string msg, string goUrl)
    {
        //msg = msg.Replace("\"", "");
        string strcl = "";
        StringBuilder AlertMsg = new StringBuilder();
        AlertMsg.Append("<script language=javascript>alert('" + msg + "');");
        switch (goUrl)
        {
            case "back":
                strcl = "window.history.go(-1)";
                break;
            case "this":
                strcl = "";
                break;
            case "close":
                strcl = "window.close()";
                break;
            default:
                strcl = "window.location.href='" + goUrl + "'";
                break;
        }
        AlertMsg.Append(strcl);
        AlertMsg.Append(";</script>");
        string rev = AlertMsg.ToString();
        AlertMsg = null;
        GC.Collect();
        return rev;
    }
}