using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Web_Project.Data
{
    public class GetUid
    {
        public static int GetUIdMethod(string uname)
        {
            int uid = 0;
            string sql = "select Id from RegisterInfo where Rname='"+uname+"'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if(db.Rows.Count>0)
            {
                uid = Convert.ToInt32(db.Rows[0]["Id"].ToString());
            }
            return uid;
        }
        /// <summary>
        /// 获取当前登录的用户信息
        /// </summary>
        /// <param name="pid"></param>
        /// <returns></returns>
        public static DataTable GetUIdInfo(int pid)
        {
            string sql = "select * from RegisterInfo where Id=" + pid + "";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
    }
}
