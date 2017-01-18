using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_item_add : System.Web.UI.Page
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        universal un = new universal();
        bool Err =true;
        if (TextBox1.Text == "")
        {
            Err = false;
            un.Alert("项目名不得为空",this);
        }
        if (TextBox3.Text == "")
        {
            Err = false;
            un.Alert("项目简介不得为空", this);
        }
        if (Err)
        {
            string Name = TextBox1.Text;
            string Intro = TextBox3.Text;
            string IsPublic = "1";
            if (CheckBox2.Checked == true)
            {
                IsPublic = "0";
            }
            string Detail = textarea1.Value;
            string UserNumber = "";
            if (TextBox2.Text != "") UserNumber = TextBox2.Text;
            string IconCode = "&#xe685";
            string CreateTime = DateTime.Now.ToString();
            foreach (DataListItem item in this.DataList1.Items)
            {
                RadioButton RB = (RadioButton)item.FindControl("RB");
                Label LB = (Label)item.FindControl("LB");
                if (RB.Checked == true) IconCode = LB.Text;
            }
            string sqls = "INSERT INTO Item (Name, Intro,IsPublic,Detail,UserNumber,IconCode,CreateTime) VALUES ('" + Name + "','" + Intro + "','" + IsPublic + "','" + Detail + "','" + UserNumber + "','" + IconCode +  "','" + CreateTime +"')";
            DataAccess da = new DataAccess();
            da.ExecuteSql(sqls);
            sqls = "SELECT ItemId FROM Item WHERE Name='" + Name + "' ORDER BY ItemId";
            DataSet ds = da.dataSet(sqls);
            string UID = Session["UID"].ToString();
            string ItemId = ds.Tables[0].Rows[0]["ItemId"].ToString();
            sqls = "INSERT INTO Item_User VALUES('" + UID + "','" + ItemId + "','1','','1')";
            da.ExecuteSql(sqls);
            sqls = "INSERT INTO List(Name,Array,BelongItem) VALUES('默认列表','1','" + ItemId + "')";
            da.ExecuteSql(sqls);

            alertv al = new alertv();
            Response.Write(al.gutAlertUrl("创建成功", "../item/item-list.aspx"));
        }
        
       

    }

}