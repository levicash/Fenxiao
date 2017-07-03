using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Website
{
    public partial class Profiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "",
                                                       "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                    Show();
                }
            }
        }
        protected void Show()
        {
            string strSql = "select count(*) from ws_WebInfo";
            int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql, null));
            if (count == 1)
            {
                string strSql1 = "select * from ws_WebInfo";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql1, null);
                txtName.Text = db.Rows[0]["webName"].ToString();
                txtKey.Text = db.Rows[0]["webKey"].ToString();
                txtDes.Text = db.Rows[0]["webDep"].ToString();
                Description.InnerText = db.Rows[0]["webFoot"].ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string key = txtKey.Text.Trim();
                string des = txtDes.Text.Trim();
                string foot = Description.InnerText.ToString().Replace("'", "''");
                string strSql2 = "select count(*) from ws_WebInfo";
                int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql2, null));
                if (count == 1)
                {
                    string sql = "update ws_WebInfo set webName='" + name + "',webKey='" + key + "',webDep='" + des + "',webFoot='" +
                                 foot + "'";
                    int iu = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                    if (iu > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改成功');window.location='Profiles.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='Profiles.aspx'</script>");
                    }
                }
                else
                {
                    string strSql =
                        string.Format(
                            "insert into ws_WebInfo(webName,webKey,webDep,webFoot) values('{0}','{1}','{2}','{3}')",
                            name, key, des, foot);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='Profiles.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='Profiles.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "",
                                                   "<script>alert('出现错误，请重试');window.location='Profiles.aspx'</script>");
            }
        }
    }
}