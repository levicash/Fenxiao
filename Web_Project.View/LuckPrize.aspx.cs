using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using Web_Project.Data;


namespace Web_Project.View
{
    public partial class LuckPrize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 查询奖品
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string GetPrizeInfo()
        {
            string str = string.Empty;
            string sql = "";
            sql = "SELECT PName,PGrade,PComment FROM dbo.ws_Prize Where IsShow = 0 ORDER BY PGrade";
            DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            str = JsonHandleHelper.DataTableToJSON(dt);
            return str;
        }

        /// <summary>
        /// 根据会员查找剩余抽奖次数
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string GetPCountByUser(string userName)
        {
            string str = string.Empty;
            string sql = "";
            sql = string.Format("SELECT Top 1 PrizeCount FROM ws_RegisterInfo WHERE Rname='{0}'", userName);
            object ob = DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null);
            if (ob != null)
            {
                return ob.ToString();
            }
            return string.Empty;
        }

        /// <summary>
        /// 插入中奖表
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int insertWinning(string userName, int PGrade)
        {
            string sql = string.Empty;
            string sqlinsert = string.Empty;
            int RId = FrontUser.RegisterInfoId(userName);
            int instno = 0, updateno = 0;
            if (RId > 0)
            {
                sql = string.Format("INSERT INTO ws_Winning (CreateTime,RId,PId,IsReceive,ReceiveTime,WMessage) VALUES (GETDATE(),{0},{1},NULL,NULL,NULL)", RId, PGrade);
                instno = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                if (instno > 0)
                {
                    sqlinsert = string.Format("UPDATE ws_RegisterInfo SET PrizeCount=PrizeCount-1 WHERE Id = {0}", RId);
                    updateno = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sqlinsert, null);
                }
            }

            return instno;
        }
    }
}