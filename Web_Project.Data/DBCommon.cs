using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
    public class DBCommon
    {
        /// <summary>
        /// 传入明文，返回用MD%加密后的字符串
        /// </summary>
        /// <param name="str">要加密的字符串</param>
        /// <returns>用MD5加密后的字符串</returns>
        public static string ToMD5(string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5");
        }
        /// <summary>
        /// 获取记录数
        /// </summary>
        /// <param name="table"></param>
        /// <param name="cond">格式:Where ...</param>
        /// <returns></returns>
        public int GetRowCount1(string query)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, query, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            if (ds != null)
            {
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    return Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
                }
            }
            return 0;

        }

        /// <summary>
        /// 分页查询
        /// </summary>
        public DataSet GetinfoList1(int rowpage, int rowcount, string orderFid, string sql1)
        {
            DataSet ds = new DataSet();
            string sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY {2} ) AS RowNum, * FROM ( "
                + "{3} ) AS sp ) AS newTable Where (RowNum BETWEEN ({0}) AND ({1}))";
            sql = string.Format(sql, (rowpage - 1) * rowcount + 1, rowpage * rowcount, orderFid, sql1);

            try
            {
                ds = DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql, null);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return ds;

        }
    }
}
