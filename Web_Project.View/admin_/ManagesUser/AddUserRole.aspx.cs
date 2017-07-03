using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.ManagesUser
{
    public partial class AddUserRole : System.Web.UI.Page
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
                    if (Request["pid"] != null)
                    {
                        ProShow();
                    }
                }
            }
        }
        protected void ProShow()
        {
            if (Request["pid"] != null)
            {
                int pid = Convert.ToInt32(Request["pid"].ToString());
                string strSql = "select *  from ws_BackUserRole  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    txtDes.Text = db.Rows[0]["Remarks"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string title = txtTitle.Text.Trim();
                string txtdes = txtDes.Text.Trim();
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"); ;
                if (Request["pid"] != null)
                {
                    int pid = Convert.ToInt32(Request["pid"].ToString());
                    string strSql = "update ws_BackUserRole set Title='" + title + "',Remarks='" + txtdes + "',AddTime='" + date + "',Orders=" + order + "";
                    strSql += " where Id=" + pid;
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                               "<script>alert('修改成功');window.location='UserRole.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddUserRole.aspx?pid=" + pid + "'</script>");
                    }
                }
                else
                {
                    string strSql = "";
                    strSql = "insert into ws_BackUserRole";
                    strSql += "(Title,Remarks,AddTime,Orders) values ";
                    strSql += "('" + title + "','" + txtdes + "','" + date + "'," + order + ")";
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddUserRole.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddUserRole.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='UserRole.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='UserRole.aspx'</script>");
        }
    }
}