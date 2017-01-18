using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class item_file_add : System.Web.UI.Page
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
     protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["ItemId"] = DropDownList1.Text;
        string a = Session["ItemId"].ToString();
    }
     protected void DropDownList1_DataBinding(object sender, EventArgs e)
     {
         if (Session["ItemId"].ToString() != "")
         {
             DropDownList1.SelectedValue = Session["ItemId"].ToString();
         }
         else
         {
             string strCon = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
             string ItemId1 = "";
             SqlConnection conn = new SqlConnection(strCon);
             conn.Open();
             SqlCommand cmd = new SqlCommand();
             cmd.Parameters.Add(new SqlParameter("@UID", SqlDbType.NVarChar, 16));
             cmd.Parameters["@UID"].Value = Session["UID"].ToString();
             cmd.Connection = conn;
             cmd.CommandText = "SELECT   Fav_Item.ItemId1  FROM    dbo.Fav_Item  WHERE   dbo.Fav_Item.UID =@UID";
             SqlDataReader reader = cmd.ExecuteReader();
             if (reader.Read())
             {
                 ItemId1 = reader["ItemId1"].ToString();
                 Session["ItemId"] = ItemId1;

             }
             if (ItemId1 != null)
             {
                 DropDownList1.SelectedValue = ItemId1;
             }
             reader.Close();
             conn.Close();
         }
     }
     protected void Button1_Click(object sender, EventArgs e)
     {
         universal un = new universal();
         if (FileUpload1.HasFile)
         {
             string savePath = Server.MapPath("~/file/");//指定上传文件在服务器上的保存路径
             //检查服务器上是否存在这个物理路径，如果不存在则创建
             if (!System.IO.Directory.Exists(savePath))
             {
                 System.IO.Directory.CreateDirectory(savePath);
             }
             savePath = savePath + "\\" + FileUpload1.FileName;
             FileUpload1.SaveAs(savePath);
             DataAccess da = new DataAccess();
             string CreateTime = DateTime.Now.ToString();
             string BelongUID = Session["UID"].ToString()   ;
             string FileName = FileUpload1.FileName.ToString();
             string BelongItemId = Session["ItemId"].ToString();
             string sqls = "INSERT INTO File_ (CreateTime, BelongUID,FileName,BelongItemId) VALUES ('" + CreateTime + "','" + BelongUID + "','" + FileName + "','" + BelongItemId + "')";
             da.ExecuteSql(sqls);
             alertv al = new alertv();
             Response.Write(al.gutAlertUrl("上传成功", "file.aspx"));

         }
         else
         {
             un.Alert("你还没有选择上传文件!", this);
         }
     }
}