using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Web_Project.Data
{
    public class GetTuiJianRen
    {
        /// <summary>
        /// 获取推荐人
        /// </summary>
        /// <param name="uname"></param>
        /// <returns></returns>
        public static string GetTuiJianRenMethod(string uname)
        {
            string tuijianren = "";
            string sql = "select TuiJianRen from ws_RegisterInfo where Rname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count>0)
            {
                tuijianren = db.Rows[0][0].ToString();
            }
            return tuijianren;
        }

    }
}
