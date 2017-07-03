using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.FrontUser
{
    public partial class AddUserList : System.Web.UI.Page
    {
        int page = 0;
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
                    ShowInfo();
                }
            }
        }
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                string sql = "select * from ws_RegisterInfo where Id=" + id + " order by AddTime desc";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal1.Text = db.Rows[0]["Rname"].ToString();
                    TextBox2.Text = db.Rows[0]["Uname"].ToString();
                    TextBox3.Text = db.Rows[0]["IdCard"].ToString();
                    //TextBox9.Text = db.Rows[0]["JieDianiRen"].ToString();
                    //TextBox4.Text = db.Rows[0]["Uname"].ToString();
                    //TextBox5.Text = db.Rows[0]["UserLevel"].ToString();
                    //TextBox6.Text = db.Rows[0]["Rphone"].ToString();
                    //TextBox7.Text = db.Rows[0]["Rweixin"].ToString();
                    //TextBox2.Text = db.Rows[0]["Rqq"].ToString();
                    //TextBox8.Text = db.Rows[0]["Rdiqu"].ToString();
                    //Label10.Text = db.Rows[0]["AddTime"].ToString();
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string pwd = txtPassWord.Text.Trim().Replace("'", "''");
                string pwd1 = TextBox1.Text.Trim().Replace("'", "''");
                string uname = TextBox2.Text.Trim().Replace("'", "''");
                string idcard = TextBox3.Text.Trim().Replace("'", "''");
                //string jiedianren = TextBox9.Text.Trim().Replace("'", "''");
                //string name = TextBox4.Text.Trim().Replace("'", "''");
                //string level = TextBox5.Text.Trim().Replace("'", "''");
                //string phone = TextBox6.Text.Trim().Replace("'", "''");
                //string weixin = TextBox7.Text.Trim().Replace("'", "''");
                //string qq = TextBox2.Text.Trim().Replace("'", "''");
                //string dizhi = TextBox8.Text.Trim().Replace("'", "''");
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                if (Request["id"] != null)
                {
                    int pid = Convert.ToInt32(Request["id"].ToString());
                    string strSql = "update ws_RegisterInfo set Uname='" + uname + "',IdCard='" + idcard + "'";
                    if (pwd != "")
                    {
                        strSql += ",Rpass='" + ToMD5(pwd) + "'";
                    }
                    if (pwd1 != "")
                    {
                        strSql += ",ErJiPass='" + ToMD5(pwd1) + "'";
                    }
                    strSql += " where Id=" + pid;
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        if (Request["page"] != null)
                        {
                            page = Convert.ToInt32(Request["page"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='UserList.aspx?page=" + page + "'</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddUserList.aspx?id=" +
                                                           pid + "'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='UserList.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request["page"] != null)
            {
                page = Convert.ToInt32(Request["page"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='UserList.aspx?page=" + page + "'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='UserList.aspx'</script>");
            }
        }
        #region 密码加密
        /// <summary>
        /// 传入明文，返回用MD5加密后的字符串
        /// </summary>
        /// <param name="str">要加密的字符串</param>
        /// <returns>用MD5加密后的字符串</returns>
        public static string ToMD5(string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5");
        }
        #endregion
    }
}