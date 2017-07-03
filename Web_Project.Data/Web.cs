using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
    public class Web
    {
        /// <summary>
        /// 页面的标题
        /// </summary>
        /// <returns></returns>
        public static string webInfo()
        {
            string title = "";
            string sql = "select * from ws_WebInfo";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                title = db.Rows[0]["webName"].ToString();
            }
            return title;
        }
    }
}
