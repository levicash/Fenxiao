using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
    public class GetDaiLiCount
    {
        DataTable table = new DataTable();
        private int num = 0;
        public string TeamInfo(string uname)
        {
            DataTable dt = GetClassList("").Tables[0];
            table = dt.Clone();//复制表的结构;Clone()是复制表的结构;Copy()是复制表的值和一些约束等；

            DataRow[] drs = dt.Select("TuiJianRen= '" + uname + "'");
            for (int i = 0; i < drs.Length; i++)
            {
                string classid = drs[i]["Rname"].ToString();
                num ++;
                //递归子分类方法
                BindDrpNode4(classid, dt);
            }
            return num.ToString();
        }
        /// <summary>
        /// 绑定子分类
        /// </summary>
        /// <param name="parentid"></param>
        /// <param name="dt"></param>
        private void BindDrpNode4(string parentid, DataTable dt)
        {
            int level = 0;
            DataRow[] drs = dt.Select("TuiJianRen= '" + parentid + "'");
            for (int i = 0; i < drs.Length; i++)
            {
                string classid = drs[i]["Rname"].ToString();
                num++;
                BindDrpNode4(classid, dt);
            }
        }
        /// <summary>
        /// 数据访问
        /// </summary>
        /// <param name="strWhere">SQL条件</param>
        /// <returns></returns>
        public DataSet GetClassList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from ws_RegisterInfo ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, strSql.ToString(), null);
        }
    }
}
