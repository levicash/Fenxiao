using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.StaticMethod
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 根据参数获取当前位置
        /// </summary>
        /// <param name="lid">权限ID</param>
        /// <returns></returns>
        [WebMethod]
        public static string[] GetLocation(int lid)
        {
            string[] str = new string[2];
            string sql = "select a.*,b.Title as bTitle from ws_BackUserCompetence a left join ws_BackUserCompetence b on a.Type=b.Id where a.Id=" + lid + "";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                str[0] = db.Rows[0]["bTitle"].ToString();
                str[1] = db.Rows[0]["Title"].ToString();
            }
            else
            {
                str[0] = "";
                str[1] = "";
            }
            return str;
        }
        /// <summary>
        /// 获取存入Session的当前页面链接地址
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string GetSessionPage()
        {
            string returnUrl = "Right.aspx";
            if (HttpContext.Current.Session["ManagerPageUrl"] != null)
            {
                returnUrl = HttpContext.Current.Session["ManagerPageUrl"].ToString();
                HttpContext.Current.Session.Remove("ManagerPageUrl");
            }
            return returnUrl;
        }
        /// <summary>
        /// 修改顺序
        /// </summary>
        /// <param name="quanbu"></param>
        /// <param name="biaoming"></param>
        /// <returns></returns>
        [WebMethod]
        public static int UpdateOrders(string quanbu, string biaoming)
        {
            int sid = 0;
            string[] qb = quanbu.TrimEnd('|').Split('|');
            if (qb.Length > 0)
            {
                for (int i = 0; i < qb.Length; i++)
                {
                    string sql = "update " + biaoming + " set Orders=" + qb[i].Substring(qb[i].LastIndexOf('.') + 1) + " where Id=" + qb[i].Substring(0, qb[i].LastIndexOf('.')) + "";
                    sid = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                }
            }
            return sid;
        }
        /// <summary>
        /// 删除图片
        /// </summary>
        /// <param name="biaoming"></param>
        /// <returns></returns>
        [WebMethod]
        public static string[] DeleteAboutImg(string biaoming)
        {
            string[] str = new string[1];
            string strSql = "select ImgName from [" + biaoming + "]";
            DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
            string NewName = dt.Rows[0]["ImgName"].ToString();
            if (dt.Rows[0]["ImgName"] != null && NewName != "")
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (File.Exists(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + NewName)))
                        {
                            File.Delete(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + NewName));
                        }
                    }
                }
                string sql = "update " + biaoming + " set ImgName=''";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                str[0] = "1";
            }
            else
            {
                str[0] = "2";
            }
            return str;
        }
        /// <summary>
        /// 删除图片
        /// </summary>
        /// <param name="biaoming"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [WebMethod]
        public static string[] DeleteImg(string biaoming, int id)
        {
            string[] str = new string[1];
            string strSql = "select ImgName from [" + biaoming + "] where Id=" + id + "";
            DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
            string NewName = dt.Rows[0]["ImgName"].ToString();
            if (dt.Rows[0]["ImgName"] != null && NewName != "")
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (File.Exists(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + NewName)))
                        {
                            File.Delete(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + NewName));
                        }
                    }
                }
                string sql = "update " + biaoming + " set ImgName='' where Id=" + id + "";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                str[0] = "1";
            }
            else
            {
                str[0] = "2";
            }
            return str;
        }
        /// <summary>
        /// 删除选中的数据(没有图片)
        /// </summary>
        /// <param name="hiTopId">选中的ID</param>
        /// <param name="biaoming">表名</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDeleteAll(string hiTopId, string biaoming)
        {
            string id = hiTopId.TrimEnd(',').ToString();
            int AllNum = 0;
            string sql = "";
            sql = "delete from " + biaoming + " where Id in (" + id + ")";
            AllNum = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return AllNum;
        }
        /// <summary>
        /// 删除选中的数据(有图片)
        /// </summary>
        /// <param name="hiTopId">选中的ID</param>
        /// <param name="biaoming">表名</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDeleteAllImg(string hiTopId, string biaoming)
        {
            string id = hiTopId.TrimEnd(',').ToString();
            int AllNum = 0;
            string sql = "";
            //删除图片
            string sqlPic = "select * from " + biaoming + " where Id in (" + id + ")";
            DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlPic, null);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (File.Exists(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + dt.Rows[i]["ImgName"].ToString())))
                    {
                        File.Delete(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + dt.Rows[i]["ImgName"].ToString()));
                    }
                }
            }
            //删除数据
            sql = "delete from " + biaoming + " where Id in (" + id + ")";
            AllNum = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);

            return AllNum;
        }
        /// <summary>
        /// 单一删除(没图片)
        /// </summary>
        /// <param name="id">当前数据的ID</param>
        /// /// <param name="biaoming">表名</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDiErSingleDel(int id, string biaoming)
        {
            int singleId = 0;
            string sql = "";
            sql = "delete from " + biaoming + " where Id =" + id + "";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return singleId;
        }
        /// <summary>
        /// 单一删除(有图片)
        /// </summary>
        /// <param name="id">当前数据的ID</param>
        /// /// <param name="biaoming">表名</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDiErSingleDelImg(int id, string biaoming)
        {
            int singleId = 0;
            string sql = "";
            //删除图片
            string sqlPic = "select * from " + biaoming + " where Id =" + id + "";
            DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlPic, null);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (File.Exists(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + dt.Rows[i]["ImgName"].ToString())))
                    {
                        File.Delete(System.Web.HttpContext.Current.Server.MapPath("../Images/proImg/" + dt.Rows[i]["ImgName"].ToString()));
                    }
                }
            }
            //删除数据
            sql = "delete from " + biaoming + " where Id =" + id + "";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);

            return singleId;
        }
        #region  单一删除订单
        [WebMethod]
        public static int BtnDiErSingleDelOrder(int id, string biaoming, string oid)
        {
            int singleId = 0;
            string sql = "";
            sql = "delete from " + biaoming + " where Id =" + id + "";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            if (singleId > 0)
            {
                string sql1 = "delete from ws_BuyProList where OrderId='" + oid + "'";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
            }
            return singleId;
        }
        #endregion
        /// <summary>
        /// 财务  会员审核
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int CaiWuShenHeMethod(int uid)
        {
            string sql = "";
            sql += "update ws_RegisterInfo set IsJiHuo=2";
            sql += " where Id=" + uid;
            return DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
        }
        /// <summary>
        /// 会员最终激活 审核
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int HuiYuanShenHeMethod(int uid)
        {
            string sql = "";
            sql += "update ws_RegisterInfo set IsJiHuo=3";
            sql += " where Id=" + uid;
            return DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
        }
        /// <summary>
        /// 奖金提现审核
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] IsTiXianMethod(int uid, decimal txjiner, string uname)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "select * from ws_RegisterInfo where Rname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                decimal tixianMoney = Convert.ToDecimal(db.Rows[0]["TiXianMoney"].ToString());
                if (tixianMoney >= txjiner)
                {
                    string sql1 = "update ws_TiXianInfo set ShenHe=1,ShTime='" + date + "' where Id=" + uid;
                    int count = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
                    if (count > 0)
                    {
                        string sql2 = "update ws_RegisterInfo set TiXianMoney=TiXianMoney-" + txjiner + " where Rname='" + uname + "'";
                        int c2 = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                        if (c2 > 0)
                        {
                            str[0] = "1";
                        }
                        else
                        {
                            str[0] = "2";
                        }
                    }
                    else
                    {
                        str[0] = "2";
                    }
                }
                else
                {
                    str[0] = "3";//会员的提现奖金不足
                }
            }
            else
            {
                str[0] = "4";//没有当前会员
            }
            return str;
        }
        /// <summary>
        /// 提现转账审核
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] IsZhuanZhangMethod(int uid, decimal txjiner, string uname)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "select * from ws_RegisterInfo where Rname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                decimal tixianMoney = Convert.ToDecimal(db.Rows[0]["TiXianMoney"].ToString());
                if (tixianMoney >= txjiner)
                {
                    string sql1 = "update ws_ZhuanInfo set ShenHe=1,ShTime='" + date + "' where Id=" + uid;
                    int count = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
                    if (count > 0)
                    {
                        string sql2 = "update ws_RegisterInfo set TiXianMoney=TiXianMoney-" + txjiner + ",XianJinZhangHu=XianJinZhangHu+" + txjiner + " where Rname='" + uname + "'";
                        int c2 = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                        if (c2 > 0)
                        {
                            str[0] = "1";
                        }
                        else
                        {
                            str[0] = "2";
                        }
                    }
                    else
                    {
                        str[0] = "2";
                    }
                }
                else
                {
                    str[0] = "3";//会员的提现奖金不足
                }
            }
            else
            {
                str[0] = "4";//没有当前会员
            }
            return str;
        }
        /// <summary>
        /// 会员升级审核
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] IsShengJiMethod(int uid, string uname, string otjr, string xtjr, string xleveltype, int xlevel)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "select * from ws_RegisterInfo where Rname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                string sql1 = "update ws_UpdateInfo set ShenHe=1,ShTime='" + date + "' where Id=" + uid;
                int count = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
                if (count > 0)
                {
                    string sql2 = "update ws_RegisterInfo set UserType='" + xleveltype + "',Userlevel=" + xlevel + ",OldTuiJianRen='" + otjr + "',TuiJianRen='" + xtjr + "' where Rname='" + uname + "'";
                    int shCount = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                    if (shCount > 0)
                    {
                        str[0] = "2";//审核通过
                    }
                    else
                    {
                        str[0] = "3";//审核失败
                    }
                }
                else
                {
                    str[0] = "3";//审核失败
                }
            }
            else
            {
                str[0] = "4";//没有当前会员
            }
            return str;
        }
        /// <summary>
        /// 解冻状态审核
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] IsJieDongMethod(int uid, string uname)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "select * from ws_RegisterInfo where Rname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                decimal levelmoney = Convert.ToDecimal(db.Rows[0]["Levelmoney"].ToString());//会员的报单额
                string sql1 = "update ws_DongJieInfo set ShenHe=1,ShTime='" + date + "' where Id=" + uid;
                int count = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
                if (count > 0)
                {
                    string sql2 = "update ws_RegisterInfo set IsDongJie=2 where Rname='" + uname + "'";
                    int c2 = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                    if (c2 > 0)
                    {
                        //把40%转为积分、50%转股权，10%为慈善积分
                        decimal xfjifen = levelmoney * Convert.ToDecimal(0.4);
                        decimal guquan = levelmoney * Convert.ToDecimal(0.5);
                        decimal csjifen = levelmoney * Convert.ToDecimal(0.1);
                        string sql3 = "update ws_RegisterInfo set XfJiFen=XfJiFen+" + xfjifen + ",YuanShiGu=YuanShiGu+" + Convert.ToInt32(guquan) + ",CsJiFen=CsJiFen+" + csjifen + " where Rname='" + uname + "'";
                        DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql3, null);
                        str[0] = "1";
                    }
                    else
                    {
                        str[0] = "2";
                    }
                }
                else
                {
                    str[0] = "2";
                }
            }
            else
            {
                str[0] = "4";//没有当前会员
            }
            return str;
        }
        /// <summary>
        /// 确定发货状态
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int IsFaHuoMethod(int fid, string danhao, string gongsi)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "";
            sql += "update ws_OrderList set IsFaHuo=1,KdDanhao='" + danhao + "',KdGongsi='" + gongsi + "',FaTime='" + date + "'";
            sql += " where Id=" + fid;
            return DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
        }
        #region 查询是否有未发货的订单
        [WebMethod]
        public static string[] IsYouFahuo()
        {
            string[] str = new string[1];
            int count = 0;
            string sql = "select count(*) from ws_OrderList where IsFaHuo=2";
            count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            if (count > 0)
            {
                str[0] = "1";
            }
            else
            {
                str[0] = "2";
            }
            return str;
        }
        #endregion
        #region 审核当前充值记录
        [WebMethod]
        public static string[] ChongZhiMehod(int zid, string zname, int zprice)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "update ws_ChongZhiInfo set ShenHe=2,ShTime='" + date + "' where Id=" + zid;
            int uid = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            if (uid > 0)
            {
                string sql2 = "update ws_RegisterInfo set YuErMoney=YuErMoney+" + zprice + " where Rname='" + zname + "'";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                str[0] = "1";
            }
            else
            {
                str[0] = "2";
            }
            return str;
        }
        #endregion
        #region 审核当前提现记录
        [WebMethod]
        public static string[] TiXianMehod(int zid, string zname, decimal zprice)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "update ws_TiXianInfo set ShenHe=1,ShTime='" + date + "' where Id=" + zid;
            int uid = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            if (uid > 0)
            {
                string sql2 = "update ws_RegisterInfo set Jiangjin=Jiangjin-" + zprice + " where Rname='" + zname + "'";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                str[0] = "1";
            }
            else
            {
                str[0] = "2";
            }
            return str;
        }
        #endregion

        #region 审核当前中奖记录
        [WebMethod]
        public static string[] WinningMehod(int zid)
        {
            string[] str = new string[1];
            string sql = string.Format("UPDATE ws_Winning SET IsReceive = 1, ReceiveTime = GETDATE() WHERE Id = {0}", zid);
            int uid = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            if (uid > 0)
            {
                str[0] = "1";
            }
            else
            {
                str[0] = "2";
            }
            return str;
        }
        #endregion
    }
}