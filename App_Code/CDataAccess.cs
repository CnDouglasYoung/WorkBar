using System;
using System.Data;
using System.Data.OleDb;
using System.Data.Sql;
//using System.Data.OracleClient;
using System.Web;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// CDataAccess 的摘要说明
/// </summary>

public class DataAccess
{
    /*
      <configuration>
	<appSettings>
		<add key="DbHelperProvider" value="System.Data.SqlClient"/>
		<!--<add key="DbHelperConnectionString" value="Data Source=vm1.suda.edu.cn;Initial Catalog=worldSchool;Persist Security Info=True;User ID=shxy;Password=OgVm7EN2" />
		-->
		<add key="dbConnString" value="Data Source=blue;user id=test;password=;Initial Catalog=myweb;Integrated Security=True"/>
	</appSettings>
    */
    //protected static string connString = System.Configuration.ConfigurationManager.AppSettings["dbConnString"];
    //protected static string connString = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
    protected static string connString = "Data Source=LENOVO-PC;Initial Catalog=Database;User ID=workbar;Password=123123123";
    //protected static OleDbConnection dbConn = new OleDbConnection();
    protected static SqlConnection dbConn = new SqlConnection();

    //protected static OleDbCommand dbComm = new OleDbCommand();
    protected static SqlCommand dbComm = new SqlCommand();
    public string UserID = null;
    public string UserName = null;
    public string Identify = null;
    public string ManageFunc = null;
    public string RoleFun = null;

    public DataAccess()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    // 打开数据库连接 
    private static void openConnection()
    {
        if (dbConn.State == ConnectionState.Closed)
        {
            dbConn.ConnectionString = connString;
            dbComm.Connection = dbConn;
            try
            {
                dbConn.Open();
            }
            catch(Exception ex)
            {
                //throw new Exception(e.Message); 
            }
        }
    }


    
    // 关闭当前数据库连接 
    private static void closeConnection()
    {
        if (dbConn.State == ConnectionState.Open)
            dbConn.Close();
        dbConn.Dispose();
        dbComm.Dispose();
    }
    public string ConnectionTest()
    {
        string a="";
        try
        {
            openConnection();
            a = "true";
        }
        catch
        {
            a = "fales";            
        }
        finally
        {
            closeConnection();
        }
        return a;
    }
    // 执行Sql语句 
    public void ExecuteSql(string sqlstr)
    {
        try
        {
            openConnection();
            dbComm.CommandType = CommandType.Text;
            dbComm.CommandText = sqlstr;
            dbComm.ExecuteNonQuery();
            
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
        }
        finally
        {
            closeConnection();
        }
    }


    // 返回指定Sql语句的SqlDataReader，请注意，在使用后请关闭本对象，同时将自动调用closeConnection()来关闭数据库连接 
    // sqlstr:传入的Sql语句; OleDbDataReader:OleDbDataReader对象
    public SqlDataReader dataReader(string sqlstr)
    {
     
        SqlDataReader dr = null;
        try
        {
            openConnection();
            dbComm.CommandText = sqlstr;
            dbComm.CommandType = CommandType.Text;
            dr = dbComm.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch
        {
            try
            {
                dr.Close();
                closeConnection();
            }
            catch
            {
                return null;
            }
        }
        return dr;
    }

    // 返回指定Sql语句的OleDbDataReader，请注意，在使用后请关闭本对象，同时将自动调用closeConnection()来关闭数据库连接 
    // sqlstr:传入的Sql语句; dr:传入的ref DataReader 对象
    public void dataReader(string sqlstr, ref SqlDataReader dr)
    {
        try
        {
            openConnection();
            dbComm.CommandText = sqlstr;
            dbComm.CommandType = CommandType.Text;
            dr = dbComm.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch
        {
            try
            {
                if (dr != null && !dr.IsClosed)
                    dr.Close();
            }
            catch
            {
            }
            finally
            {
                closeConnection();
            }
        }
    }


    // 返回指定Sql语句的DataSet 
    //sqlstr:传入的Sql语句
    public DataSet dataSet(string sqlstr)
    {
        DataSet ds = new DataSet();
    //    OleDbDataAdapter da = new OleDbDataAdapter();
        SqlDataAdapter da = new SqlDataAdapter();
        try
        {
            openConnection();
            dbComm.CommandType = CommandType.Text;
            dbComm.CommandText = sqlstr;
            da.SelectCommand = dbComm;
            da.Fill(ds);
        }
        catch(Exception ex)
        {
            return null;
        }
        finally
        {
            closeConnection();
        }
        return ds;

    }

    // 返回指定Sql语句的DataTable 
    // sqlstr:传入的Sql语句; 
    public DataTable dataTable(string sqlstr)
    {
        //OleDbDataAdapter da = new OleDbDataAdapter();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable datatable = new DataTable();
        try
        {
            openConnection();
            dbComm.CommandType = CommandType.Text;
            dbComm.CommandText = sqlstr;
            da.SelectCommand = dbComm;
            da.Fill(datatable);
        }
        catch
        {
            return null;
        }
        finally
        {
            closeConnection();
        }
        return datatable;
    }

    // 返回指定Sql语句的DataView
    // sqlstr:传入的Sql语句; 
    public DataView dataView(string sqlstr)
    {
      //  OleDbDataAdapter da = new OleDbDataAdapter();
        SqlDataAdapter da = new SqlDataAdapter();
        DataView dv = new DataView();
        DataSet ds = new DataSet();
        try
        {
            openConnection();
            dbComm.CommandType = CommandType.Text;
            dbComm.CommandText = sqlstr;
            da.SelectCommand = dbComm;
            da.Fill(ds);
            dv = ds.Tables[0].DefaultView;
        }
        catch
        {
            return null;
        }
        finally
        {
            closeConnection();
        }
        return dv;
    }

    //打开一个OracleClient类型的数据库连接，返回一个OracleCommand，用于执行对CLOB的特殊处理
  /*  public OracleCommand OpenOracleCommand()
    {
        //建立Oracle类型的数据库连接
        string connStr = System.Configuration.ConfigurationSettings.AppSettings["OraCLientConnStr"];
        OracleConnection connOraClient = new OracleConnection(connStr);

        //建立OracleCommand，并设置其相关属性
        OracleCommand dbCmd = new OracleCommand();
        dbCmd.Connection = connOraClient;
        dbCmd.CommandType = CommandType.Text;
        try
        {
            connOraClient.Open();
        }
        catch
        {
            return null;
        }
        finally
        {
            //connOraClient.Close();
        }
        return dbCmd;
    }

*/
    //根据SQL语句建立OracleDataReader，以完成对LOB的读取
 /*   public OracleDataReader OraDataReader(string sql)
    {
        OracleDataReader Odr = null;
        try
        {
            OracleCommand dbCmd = OpenOracleCommand();
            dbCmd.CommandText = sql;
            Odr = dbCmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        catch
        {
            try
            {
                if (Odr != null && !Odr.IsClosed)
                    Odr.Close();
            }
            catch
            {
                return null;
            }
            finally
            {
                closeConnection();
            }
        }
        return Odr;
    }
*/

    //把一个下拉列表框绑定到数据库中的一个表
    public void BindWebListCtrl(System.Web.UI.WebControls.ListControl webCtrl, string table)
    {
        string sql = "select id,name from " + table + " order by id";
        DataTable dt = new DataTable();
        dt = dataTable(sql);
        webCtrl.DataSource = dt;
        webCtrl.DataValueField = dt.Columns[0].ToString();
        webCtrl.DataTextField = dt.Columns[1].ToString();
        webCtrl.DataBind();
    }

    //格式化文本的显示，显示段落，首行空两字
    public string FormatString(string content)
    {
        string[] arrStr = content.Split('\n');
        string sResult = "";
        for (int i = 0; i < arrStr.Length; i++)
            sResult += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + arrStr[i] + "<br>";
        return sResult;
    }

    //向DataGrid的“删除”一列中加入确认删除对话框
    //dg:目标DataGrid，index:“删除”所在的列，从0开始，包括不可见列
    public void AddConfirm(DataGrid dg, int index)
    {
        foreach (DataGridItem item in dg.Items)	//加入删除提示框
        {
            LinkButton lbtn = (LinkButton)item.Cells[index].Controls[0];
            lbtn.Attributes.Add("onClick", "return confirm('您确定删除该记录？');");
            //点击“确定”后会产生DeleteCommand事件，点击“取消”没有事件产生
        }
    }

    //给LinkButton增加删除确认
    public void AddConfirm(LinkButton lbtn)
    {
        lbtn.Attributes.Add("onClick", "return confirm('您确定删除该记录？');");
    }

    //处理EWebEditorNet提交的内容（HTML形式）中的图片链接，以实现缩略图并重定向
    //Content：要处理的HTML形式的内容
    public string FormatContent(string Content)
    {
        int ThumbNailWidth = Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["ThumbNailWidth"]);
        int CurPos = 0;	//<IMG的位置
        int EndPos = 0;	//与<IMG匹配的“>”的位置，在CurPos与EndPos之间的部分构成一个图片的URL
        int sFilename = 0;	//图片文件名的起始位置
        int eFilename = 0;	//图片文件名的结束位置
        int width = 0;		//取得图片的指定宽度

        string ImgURL = "";	//从内容中抽取到的图片的链接
        string Filename = "";	//图片的文件名

        if (Content == null)
            return null;

        while (true)
        {
            CurPos = Content.IndexOf("<IMG", CurPos);
            if (CurPos == -1)	//已经没有图片了，结束循环
                break;
            EndPos = Content.IndexOf(">", CurPos);
            ImgURL = Content.Substring(CurPos, EndPos - CurPos + 1);	//取得一个完整的图片的URL

            sFilename = ImgURL.LastIndexOf("/") + 1;
            eFilename = ImgURL.LastIndexOf('"') - 1;
            Filename = ImgURL.Substring(sFilename, eFilename - sFilename + 1);		//取得图片文件名

            //把原有的到一个图片的链接，重定向到自定义的ShowPic.aspx文件，在其中实现图片的显示，以方便自己控制图片
            ImgURL = ImgURL.Replace("UploadFile/" + Filename, "ShowPic.aspx?filename=" + Filename + "&style=0");

            //查看指定的图片显示宽度，如果过宽，则替换掉，以免影响版面
            int sWidth = ImgURL.IndexOf("width=");
            if (sWidth != -1)
            {
                int eWidth = ImgURL.IndexOf(" ", sWidth);
                width = Convert.ToInt32(ImgURL.Substring(sWidth + 6, eWidth - sWidth - 6 + 1));

                if (width > ThumbNailWidth)
                    ImgURL = ImgURL.Replace("width=" + width.ToString(), "width=" + ThumbNailWidth + "");

            }

            //把实现图片处理的Javascript代码添加到ImgURL中，
            string Target = "../eWebEditorNet/ShowPic.aspx?filename=" + Filename + "&style=1";

            string OpenWindow = "window.open('" + Target + "','_blank')";
            string PicStyle = "  onclick=" + OpenWindow + "" + " style='CURSOR: hand'";
            ImgURL = ImgURL.Insert(ImgURL.Length - 1, PicStyle);
            //此时的ImgURL中已经被改，重定向、格式、点击处理等

            //把原有的HTML中对图片的处理替换成我们修改之后的ImgURL
            Content = Content.Remove(CurPos, EndPos - CurPos + 1);
            Content = Content.Insert(CurPos, ImgURL);

            //处理完了一个图片的URL修改，为下一个图片的处理做好准备
            EndPos = Content.IndexOf(">", CurPos);	//上述的修改操作使此图片的URL结束位置发生变化，因此要重新定位其结束位置
            CurPos = EndPos;
        }

        //下列代码使图片强制居中显示
        //			CurPos=0;
        //			EndPos=0;
        //			while(true)
        //			{
        //				CurPos=Content.IndexOf("<IMG",CurPos);
        //				
        //				if (CurPos==-1) break;
        //
        //				Content=Content.Insert(CurPos,"<P align='center'>");
        //				CurPos=Content.IndexOf("<IMG",CurPos);
        //				EndPos=Content.IndexOf(">",CurPos);
        //				Content=Content.Insert(EndPos+1,"</P>");
        //				CurPos=EndPos;
        //			}

        return Content;

    }

    public void DeleteFiles(string Content, string path)
    {
        string Target = "/eWebEditorNet";	//附件出现的位置
        string Filename = "";
        int BeginPos = 0;
        int EndPos = 0;
        try
        {
            while (true)
            {
                BeginPos = Content.IndexOf(Target, BeginPos);
                if (BeginPos == -1)	//已没有与其相关的上传文件
                    break;
                EndPos = Content.IndexOf(">", BeginPos);

                //上传的文件可能是图片或者附件，处理方式不同
                int bPicFilename = Content.IndexOf("filename=", BeginPos);	//图片，为了显示的需要，已在Display()函数中对图片的URL作了处理
                int bAttachedFilename = 0;	//其它文件
                int EndFilename = 0;

                if (bPicFilename > EndPos || bPicFilename == -1)	//不是图片，是其它文件
                {
                    bAttachedFilename = Content.IndexOf("UploadFile", BeginPos) + 11;
                    EndFilename = Content.IndexOf(" ", bAttachedFilename);
                    Filename = Content.Substring(bAttachedFilename, EndFilename - bAttachedFilename);
                    if (Filename.IndexOf('"') != -1)
                        Filename = Filename.Remove(Filename.Length - 1, 1);
                }
                else	//是图片文件，已特殊处理过
                {
                    EndFilename = Content.IndexOf("&", bPicFilename);
                    Filename = Content.Substring(bPicFilename + 9, EndFilename - bPicFilename - 9);
                }

                //构成文件的完整路径，删除文件
                Filename = path + "/UploadFile/" + Filename;
                Filename = Filename.Replace("/", "\\");
                File.Delete(Filename);	//找不到文件时不会产生异常

                //为查找下一个文件作准备
                BeginPos = EndPos;

            }
            return;
        }
        catch
        {
            return;
        }
    }


    //login登录是所用
    public int login_check(string ID, string PassWord)
    {
        if (ID.IndexOf("'") != -1 || ID.IndexOf("$") != -1 || ID.IndexOf("@") != -1)
            return 0;
        string strComm;
        strComm = "select a.*,u.*,r.* from zhhzweb.account a, zhhzweb.userlist u,zhhzweb.roles r where a.id='" + ID + "' and a.id=u.id and a.enabled<>'0'and a.type_id=r.role_id";

        DataTable RepTable = dataTable(strComm);
        if (RepTable == null) return 3;//数据库错误
        if (RepTable.Rows.Count == 0) return 0;//用户或密码错误
        if (RepTable.Rows[0]["password"] != null && Convert.ToString(RepTable.Rows[0]["password"]) == PassWord)
        {
            if (Convert.ToInt16(RepTable.Rows[0]["enabled"]) != 0)
            {
                UserID = Convert.ToString(RepTable.Rows[0]["id"]);
                UserName = Convert.ToString(RepTable.Rows[0]["name"]);
                Identify = Convert.ToString(RepTable.Rows[0]["type_id"]);
                ManageFunc = Convert.ToString(RepTable.Rows[0]["manage_func"]);
                RoleFun = Convert.ToString(RepTable.Rows[0]["role_function"]);
                return 1;//用户密码正确
            }
            else
                return 2;//身份不可用
        }
        else
            return 0;//密码错误
    }

}