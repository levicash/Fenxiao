using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Web_Project.Data
{
    public class DB_Location
    {
        DataTable table = new DataTable();
        private string str4 = "";
        public string TeamInfo(int uid)
        {
            str4 = "";
            DataTable dt = GetClassList("").Tables[0];
            table = dt.Clone();//复制表的结构;Clone()是复制表的结构;Copy()是复制表的值和一些约束等；

            DataRow[] drs = dt.Select("Id= " + uid + "");
            for (int i = 0; i < drs.Length; i++)
            {
                string classid = drs[i]["Type"].ToString();
                int sonparentid = int.Parse(classid);

                //递归子分类方法
                BindDrpNode4(sonparentid, dt);
            }
            return str4;
        }
        /// <summary>
        /// 绑定子分类
        /// </summary>
        /// <param name="parentid"></param>
        /// <param name="dt"></param>
        private void BindDrpNode4(int parentid, DataTable dt)
        {
            DataRow[] drs = dt.Select("Id= " + parentid + "");
            if (parentid == 0)
            {
                return;
            }
            str4 += parentid + ",";
            for (int i = 0; i < drs.Length; i++)
            {
                string classid = drs[i]["Type"].ToString();
                int sonparentid = int.Parse(classid);
                BindDrpNode4(sonparentid, dt);
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
            strSql.Append("select * from ws_ProType ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, strSql.ToString(), null);
        }
    }
}
