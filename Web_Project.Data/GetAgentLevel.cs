using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Web_Project.Data;

namespace Web_Project.Data
{

    public class GetAgentLevel
    {
        //查询最高代理级别
        public static string GetMaxAgentLevel()
        {
            string maxlevel = "";
            string sql = "select top 1 * from ws_AgentLevel order by [Level]";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                maxlevel = db.Rows[0]["Title"].ToString() + "," + db.Rows[0]["Level"].ToString();
            }
            return maxlevel;
        }
        //查询当前会员的代理级别
        public static string GetUnameAgentLevel(string uname)
        {
            string level = "";
            string sql = "select top 1 * from ws_RegisterInfo where Rname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                level = db.Rows[0]["UserType"].ToString() + "," + db.Rows[0]["Userlevel"].ToString();
            }
            return level;
        }
        //根据等级查询当前等级对应的金额
        public static decimal GetAgentLevelMoney(int level)
        {
            decimal money = 0;
            string sql = "select top 1 * from ws_AgentLevel where [Level]=" + level + "";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                money = Convert.ToDecimal(db.Rows[0]["Money"].ToString());
            }
            return money;
        }
        //根据等级查询当前等级对应的等级标题
        public static string GetAgentLevelTitle(int level)
        {
            string title = "";
            string sql = "select top 1 * from ws_AgentLevel where [Level]=" + level + "";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                title = db.Rows[0]["Title"].ToString();
            }
            return title;
        }
    }
}
