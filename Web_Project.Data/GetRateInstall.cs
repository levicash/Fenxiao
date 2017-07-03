using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
    public class GetRateInstall
    {
        /// <summary>
        /// 获取利率
        /// </summary>
        /// <param name="ziduan">数据库字段名</param>
        /// <returns></returns>
        public static float GetRateMethod(string ziduan)
        {
            float rate = 0;
            string sql = "select top 1 '" + ziduan + "' from ws_RateInstall";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                rate = float.Parse(db.Rows[0][0].ToString());
            }
            return rate;
        }

    }
}
