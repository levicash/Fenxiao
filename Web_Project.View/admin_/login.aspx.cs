using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string[] AdminUserLogin(string userName, string userPwd)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "select count(*) from ws_BackUserInfo where UserName='" + userName + "'";
            int logcount = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            if (logcount > 0)
            {
                string sql1 = "select * from ws_BackUserInfo where UserName='" + userName + "' and Pwd='" + userPwd + "'";
                DataTable dbLog = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
                if (dbLog.Rows.Count > 0)
                {
                    HttpCookie USERNAME;
                    if (HttpContext.Current.Request.Cookies["WEB-ADMIN"] == null)
                    {
                        USERNAME = new HttpCookie("WEB-ADMIN");
                    }
                    else
                    {
                        USERNAME = HttpContext.Current.Request.Cookies["WEB-ADMIN"];
                    }
                    USERNAME.Values["userName"] = userName;
                    USERNAME.Values["userId"] = dbLog.Rows[0]["Id"].ToString();
                    USERNAME.Expires = DateTime.Now.AddDays(1);
                    HttpContext.Current.Response.Cookies.Add(USERNAME);
                    string sqlTime = "update ws_BackUserInfo set LastTime=NowTime,NowTime='" + date + "' where UserName='" + userName + "'";
                    DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sqlTime, null);
                    str[0] = "1";
                }
                else
                {
                    str[0] = "2";
                }
            }
            else
            {
                str[0] = "3";
            }
            return str;
        }
        /// <summary>
        /// 退出
        /// </summary>
        [WebMethod]
        public static void Aquit()
        {
            if (HttpContext.Current.Request.Cookies["WEB-ADMIN"] != null)
            {
                HttpContext.Current.Response.Cookies.Remove("WEB-ADMIN");
                HttpContext.Current.Response.Cookies.Add(new HttpCookie("WEB-ADMIN", "000000"));
            }
        }
    }
}