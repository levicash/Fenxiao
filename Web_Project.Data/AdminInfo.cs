using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace Web_Project.Data
{
    public class AdminInfo
    {
        /// <summary>
        /// 是否登陆
        /// </summary>
        public static bool IsAuthenticated
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["WEB-ADMIN"] == null || HttpContext.Current.Request.Cookies["WEB-ADMIN"].Values["userId"] == null)
                {
                    return false;
                }
                else
                {
                    string adminName = Convert.ToString(HttpContext.Current.Request.Cookies["WEB-ADMIN"].Values["userName"]);
                    if (IsLogid(adminName)>0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }

            }
        }

        /// <summary>
        /// 管理员名
        /// </summary>
        public static string UserName
        {
            get
            {
                if (IsAuthenticated)
                {
                    try
                    {
                        string adminName = Convert.ToString(HttpContext.Current.Request.Cookies["WEB-ADMIN"].Values["userName"]);
                        if (adminName == String.Empty)
                        {
                            return null;
                        }
                        else
                        {
                            return adminName;
                        }
                    }
                    catch
                    {
                        return null;
                    }
                }

                return null;
            }
        }

        /// <summary>
        /// 管理员ID
        /// </summary>
        public static string UserID
        {
            get
            {
                if (IsAuthenticated)
                {
                    try
                    {
                        string adminID = Convert.ToString(HttpContext.Current.Request.Cookies["WEB-ADMIN"].Values["userId"]);
                        if (adminID == String.Empty)
                        {
                            return null;
                        }
                        else
                        {
                            return adminID;
                        }
                    }
                    catch
                    {
                        return null;
                    }
                }

                return null;
            }
        }
        public static int IsLogid(string name)
        {
            int lid = 0;
            string sql = "select count(*) from ws_BackUserInfo where UserName='" + name + "'";
            lid = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text,  sql, null));
            return lid;
        }
        /// <summary>
        /// 退出登陆
        /// </summary>
        public static void SignOut()
        {
            //取消session
            HttpContext.Current.Session["userId"] = null;
            HttpContext.Current.Session["userName"] = null;
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();

            //取消Cookies


            HttpCookie cok = HttpContext.Current.Request.Cookies["WEB-ADMIN"];
            if (cok != null)
            {
                TimeSpan ts = new TimeSpan(-1, 0, 0, 0);
                cok.Expires = DateTime.Now.Add(ts);//删除整个Cookie，只要把过期时间设置为现在
                HttpContext.Current.Response.AppendCookie(cok);
            }
        }
    }
}
