using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.SinglePage
{
    public partial class AddInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "",
                                                       "<script language=javascript>top.location='../login.aspx'</script>");
                }
                else
                {
                    DDLShow();
                    ProShow();
                }
            }
        }
        /// <summary>
        /// 类型绑定
        /// </summary>
        protected void DDLShow()
        {
            ddlType.Items.Clear();
            string strSql = "select * from ws_SingleType order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
            if (db.Rows.Count > 0)
            {
                ddlType.DataSource = db;
                ddlType.DataTextField = "Title";
                ddlType.DataValueField = "Id";
                ddlType.DataBind();
            }
            ListItem li = new ListItem("--分类--", "-1");
            ddlType.Items.Insert(0, li);
        }
        protected void ProShow()
        {
            if (Request["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select *  from ws_SingleInfo  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    Textarea1.InnerText = db.Rows[0]["Desp"].ToString();
                    ddlType.SelectedValue = db.Rows[0]["Type"].ToString();
                    RadioButtonList1.SelectedValue = db.Rows[0]["IsXianShi"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                }
            }
            if (Request["type"] != null)
            {
                ddlType.SelectedValue = Request["type"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int page = 0;
                string title = txtTitle.Text.Trim().Replace("'", "''");
                int type = Convert.ToInt32(ddlType.SelectedValue.ToString());
                int isXianShi = Convert.ToInt32(RadioButtonList1.SelectedValue.ToString());
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                string desp = Textarea1.InnerText.ToString().Replace("'", "''");
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                if (Request["id"] != null)
                {
                    int pid = Convert.ToInt32(Request["id"].ToString());
                    string strSql = "update ws_SingleInfo set Title='" + title + "',Desp='" + desp + "',Type=" + type + ",IsXianShi=" + isXianShi + ",Orders=" + order + "";
                    strSql += " where Id=" + pid;
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        if (Request["page"] != null)
                        {
                            page = Convert.ToInt32(Request["page"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='Info.aspx?page=" + page + "'</script>");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='Info.aspx'</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddInfo.aspx?pid=" + pid + "'</script>");
                    }
                }
                else
                {
                    string strSql = "";
                    strSql = "insert into ws_SingleInfo";
                    strSql += "(Title,Desp,Type,IsXianShi,Orders,AddTime) values ";
                    strSql += "('" + title + "','" + desp + "'," + type + "," + isXianShi + "," + order + ",'" + date + "')";
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddInfo.aspx?type=" + type + "'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddInfo.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='Info.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int page = 0;
            if (Request["page"] != null)
            {
                page = Convert.ToInt32(Request["page"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='Info.aspx?page=" + page + "'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='Info.aspx'</script>");
            }
        }
    }
}