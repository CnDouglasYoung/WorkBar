using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mine_sch_add : System.Web.UI.Page
{
    public string BeginTime;
    public string EndTime;
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
        if (this.Page.IsPostBack == false)
        {
            DataAccess da = new DataAccess();
            string sqls = "select Name,Remark,BeginTime,EndTime,Priority,AssId,CreateTime from Schedule where ScheduleId=" + Request.QueryString["SchId"].ToString() + " and UID=" + Session["UID"].ToString();
            DataSet ds = da.dataSet(sqls);
            rcm.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            xq.Text = ds.Tables[0].Rows[0]["Remark"].ToString();
            if (ds.Tables[0].Rows[0]["Priority"].ToString() == "1")
            {
                RadioButton2.Checked = true;
            }
            else if (ds.Tables[0].Rows[0]["Priority"].ToString() == "2")
            {
                RadioButton3.Checked = true;
            }
            st.Text = ds.Tables[0].Rows[0]["BeginTime"].ToString();
            et.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
            if (ds.Tables[0].Rows[0]["AssId"] != null)
            {
                CheckBox1.Checked = true;
                RadioButtonList1.Visible = true;
                RadioButtonList1.SelectedValue = ds.Tables[0].Rows[0]["AssId"].ToString();
            }
        }
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            RadioButtonList1.Visible = true;
        }
        else
        {
            RadioButtonList1.Visible = false;
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        et.CssClass = "Linked";
        st.CssClass = "Linked";
        string AssId = RadioButtonList1.SelectedValue;
        string sqls = "SELECT BeginTime,EndTime FROM Assignment WHERE AssId=" + AssId;
        DataAccess da = new DataAccess();
        DataSet ds = da.dataSet(sqls);
        BeginTime= ds.Tables[0].Rows[0]["BeginTime"].ToString();
        EndTime = ds.Tables[0].Rows[0]["EndTime"].ToString();
        
        DateTime sT = DateTime.Parse(ds.Tables[0].Rows[0]["BeginTime"].ToString());
        DateTime eT = DateTime.Parse(ds.Tables[0].Rows[0]["EndTime"].ToString());
        TimeSpan tssT = sT.Subtract(DateTime.Today);
        TimeSpan tseT = eT.Subtract(DateTime.Today);
        Hidden1.Value = tssT.ToString();
        Hidden2.Value = tseT.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        universal un=new universal ();
        bool Err = true ;
        if (rcm.Text == "")
        {
            Err = false;
            un.Alert("日程名不得为空",this );
        }
        if (st.Text  =="" )
        {
            Err = false;
            un.Alert("开始时间不得为空", this);
        }
        if (et.Text == "")
        {
            Err = false;
            un.Alert("结束时间不得为空", this);
        }
        DateTime sT = DateTime.Parse(st.Text);
        DateTime eT = DateTime.Parse(et.Text);
        TimeSpan ts = sT.Subtract(eT);
        
        if (ts.Days > 0)
        {
            Err = false;
            un.Alert("错误：结束时间早于开始时间", this);
        }
        if (Err)
        {
            DataAccess da = new DataAccess();
            string Name = rcm.Text;
            string Remark = xq.Text;
            string BeginTime = st.Text;
            string EndTime = et.Text;
            string Priority = "";
            if (RadioButton1.Checked == true) Priority = "0";
            else if (RadioButton2.Checked == true) Priority = "1";
            else if (RadioButton3.Checked == true) Priority = "2";
            string AssId="";            
            string UID = Session["UID"].ToString();
            string CreateTime = DateTime.Now.ToString();
            string sqls="";
            if (RadioButtonList1.SelectedValue != null)
            {
                AssId = RadioButtonList1.SelectedValue;
                sqls = "INSERT INTO Schedule (Name,Remark,BeginTime,EndTime,Priority,AssId,UID,CreateTime) VALUES ('" + Name + "','" + Remark + "','" + BeginTime + "','" + EndTime + "','" + Priority + "','" + AssId + "','" + UID + "','" + CreateTime + "')";
            }
            if (xq.Text == "")
            {
                sqls = "INSERT INTO Schedule (Name,BeginTime,EndTime,Priority,AssId,UID,CreateTime) VALUES  ('"+Name+"','"+BeginTime+"','"+EndTime+"','"+Priority+"','"+AssId+"','"+UID+"','"+CreateTime+"')";
                if (RadioButtonList1.SelectedValue == null) sqls = "INSERT INTO Schedule (Name,BeginTime,EndTime,Priority,UID,CreateTime) VALUES ('" + Name + "','" + BeginTime + "','" + EndTime + "','" + Priority + "','" + UID + "','" + CreateTime + "')";
            }
            else
            {
                if (RadioButtonList1.SelectedValue == null) sqls = "INSERT INTO Schedule (Name,Remark,BeginTime,EndTime,Priority,UID,CreateTime) VALUES  ('"+Name+"','"+Remark+"','"+BeginTime+"','"+EndTime+"','"+Priority+"','"+UID+"','"+CreateTime+"')";
            }
            da.ExecuteSql(sqls);
            alertv al = new alertv();
            Response.Write(al.gutAlertUrl("创建成功", "../item/item-list.aspx"));

        }
    }
}