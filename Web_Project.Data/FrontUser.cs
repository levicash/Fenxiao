using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace Web_Project.Data
{
    public class FrontUser
    {
        /// <summary>
        /// 是否登陆
        /// </summary>
        public static bool IsAuthenticated
        {
            get
            {
                if (HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"] == null || HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"].Value == null)
                {
                    return false;
                }
                else
                {
                    string adminName = Convert.ToString(HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"].Value);
                    if (IsLogid(adminName) > 0)
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
                        string adminName = Convert.ToString(HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"].Value);
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
        public static int IsLogid(string name)
        {
            int lid = 0;
            string sql = "select count(*) from ws_RegisterInfo where Rname='" + name + "'";
            lid = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            return lid;
        }
        /// <summary>
        /// 根据用户名获取ID
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static int RegisterInfoId(string name)
        {
            int lid = 0;
            string sql = "select Id from ws_RegisterInfo where Rname='" + name + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                lid = Convert.ToInt32(db.Rows[0][0].ToString());
            }
            return lid;
        }
    }
}
