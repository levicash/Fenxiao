using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Web_Project.Data
{
    /// <summary>
    /// 跨级升级
    /// </summary>
    public class GetKuaJiTjr
    {
        DataTable table = new DataTable();
        private string str4 = "";
        private int userlevel = 0;
        public string TeamInfo(string uname, int level)
        {
            userlevel = level;
            str4 = "";
            DataTable dt = GetClassList("").Tables[0];
            table = dt.Clone();//复制表的结构;Clone()是复制表的结构;Copy()是复制表的值和一些约束等；

            DataRow[] drs = dt.Select("Rname= '" + uname + "'");
            for (int i = 0; i < drs.Length; i++)
            {
                string classid = drs[i]["TuiJianRen"].ToString();

                //递归子分类方法
                BindDrpNode4(classid, dt);
            }
            return str4;
        }
        /// <summary>
        /// 绑定子分类
        /// </summary>
        /// <param name="parentid"></param>
        /// <param name="dt"></param>
        private void BindDrpNode4(string parentid, DataTable dt)
        {
            int level = 0;
            DataRow[] drs = dt.Select("Rname= '" + parentid + "'");
            for (int i = 0; i < drs.Length; i++)
            {
                string classid = drs[i]["TuiJianRen"].ToString();
                string sql = "select Userlevel from ws_RegisterInfo where Rname='" + classid + "'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    level = Convert.ToInt32(db.Rows[0][0].ToString());
                }
                if (userlevel > level)
                {
                    str4 = classid;
                    break;
                }
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
