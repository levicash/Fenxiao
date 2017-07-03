using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class StaticMethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region 检验是否存在此用户名
        [WebMethod]
        public static string[] isExist(string LoginName)
        {
            string[] str = new string[1];
            string sql = "select count(*) from ws_RegisterInfo where Rname='" + LoginName + "'";
            int logcount = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            if (logcount > 0)
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
        #region 登录验证
        /// <summary>
        /// 登录验证
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] isLogin(string lname, string lpwd)
        {
            string[] str = new string[2];
            string sql = "select count(*) from ws_RegisterInfo where Rname='" + lname + "'";
            int logcount = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            if (logcount > 0)
            {
                string sql1 = "select count(*) from ws_RegisterInfo where Rname='" + lname + "' and Rpass='" + ToMD5(lpwd) + "'";
                int islog = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql1, null));
                if (islog > 0)
                {
                    //查询当前会员是否激活
                    string sqlJihuo = "select IsJiHuo from ws_RegisterInfo where Rname='" + lname + "'";
                    DataTable dbJihuo = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlJihuo, null);
                    string jihuo = dbJihuo.Rows[0]["IsJiHuo"].ToString();
                    if (jihuo == "2")
                    {
                        HttpCookie USERNAME;
                        if (HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"] == null)
                        {
                            USERNAME = new HttpCookie("WEB-SANJIFENXIAO");
                        }
                        else
                        {
                            USERNAME = HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"];
                        }
                        USERNAME.Value = lname;
                        USERNAME.Expires = DateTime.Now.AddDays(1);
                        HttpContext.Current.Response.Cookies.Add(USERNAME);
                        str[0] = "1";
                        //记录当前页面
                        string returnUrl = "Index.aspx";
                        if (HttpContext.Current.Session["UrlStr"] != null)
                        {
                            returnUrl = HttpContext.Current.Session["UrlStr"].ToString();
                            HttpContext.Current.Session.Remove("UrlStr");
                        }
                        str[1] = returnUrl;
                    }
                    else
                    {
                        str[0] = "4";//没激活，不让登录
                    }
                }
                else
                {
                    str[0] = "2";
                }
            }
            else
            {
                str[0] = "3";
            }
            return str;
        }
        #endregion
        #region 退出
        /// <summary>
        /// 退出
        /// </summary>
        [WebMethod]
        public static void Aquit()
        {
            if (HttpContext.Current.Request.Cookies["WEB-SANJIFENXIAO"] != null)
            {
                HttpContext.Current.Response.Cookies.Remove("WEB-SANJIFENXIAO");
                HttpContext.Current.Response.Cookies.Add(new HttpCookie("WEB-SANJIFENXIAO", "000000"));
            }
        }
        #endregion
        /// <summary>
        /// 把当前页面加入Session
        /// </summary>
        [WebMethod]
        public static void LoginClick(string url)
        {
            HttpContext.Current.Session.Add("UrlStr", url);
        }
        /// <summary>
        /// 注册方法
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] RegisterMethod(string rname, string rpass, string tuijianren, string uname, string card, string province, string city, string county, string address, string kahao, string kaihuhang, string kaihuren)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string username = FrontUser.UserName.ToString();//当前注册人
            //查询当前推荐人是否存在
            string sqlTuijian = "select count(*) from ws_RegisterInfo where Rname='" + tuijianren + "'";
            int tjCount = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlTuijian, null));
            if (tjCount > 0)
            {
                //查询当前注册帐号是否存在
                string sqlname = "select count(*) from ws_RegisterInfo where Rname='" + rname + "'";
                int naCount = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlname, null));
                if (naCount > 0)
                {
                    str[0] = "5";//注册帐号已被注册
                }
                else
                {
                    //查询最低的代理级别（新会员是最低级的代理）
                    //string JbName = "";
                    //int level = 0;
                    //string sqlJi = "select top 1 * from ws_AgentLevel order by [Level] desc";
                    //DataTable dbJi = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlJi, null);
                    //if (dbJi.Rows.Count > 0)
                    //{
                    //    JbName = dbJi.Rows[0]["Title"].ToString();
                    //    level = Convert.ToInt32(dbJi.Rows[0]["Level"].ToString());
                    //}
                    //添加
                    string sql =
                            string.Format(
                                "insert into ws_RegisterInfo(Rname,Rpass,ZhuCeRen,TuiJianRen,Uname,IdCard,Province,City,County,Address,KaHao,KaiHuHang,KaiHuRen,AddTime) values('{0}','{1}','{2}','{3}',{4},'{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}')",
                                rname, ToMD5(rpass), username, tuijianren, uname, card, province, city, county, address, kahao, kaihuhang, kaihuren, date);
                    int reg = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                    if (reg > 0)
                    {
                        str[0] = "2";//注册成功
                    }
                    else
                    {
                        str[0] = "3";
                    }
                }
            }
            else
            {
                str[0] = "7";//推荐人不存在
            }
            return str;
        }
        #region 获取当前登录人的会员等级、所属区域
        /// <summary>
        /// 获取当前登录人的会员等级、所属区域
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] LUserInfoMethod()
        {
            string[] str = new string[4];
            string userName = FrontUser.UserName.ToString();
            string sql = "select * from ws_RegisterInfo where Rname='" + userName + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                str[1] = db.Rows[0]["Province"].ToString();
                str[2] = db.Rows[0]["City"].ToString();
                str[3] = db.Rows[0]["County"].ToString();
            }
            return str;
        }
        #endregion
        /// <summary>
        /// 修改会员信息
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int UpdateUserMethod(string rpass, string uname, string province, string city, string county, string address, string kahao, string kaihuhang, string kaihuren)
        {
            string userName = FrontUser.UserName.ToString();
            string sql = "";
            sql += "update ws_RegisterInfo set Uname='" + uname + "',Province='" + province + "',City='" + city + "',County='" + county + "',Address='" + address + "',KaHao='" + kahao + "',KaiHuHang='" + kaihuhang + "',KaiHuRen='" + kaihuren + "'";
            if (rpass != "")
            {
                sql += ",Rpass='" + rpass + "'";
            }
            sql += " where Rname='" + userName + "'";
            return DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
        }
        #region 奖金提现
        /// <summary>
        /// 奖金提现
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] TiXianMethod(decimal zzbi, float bili, decimal money)
        {
            string[] str = new string[1];
            decimal tixianMoney = 0;
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            try
            {
                string uname = FrontUser.UserName.ToString();
                string sql = "select Jiangjin from ws_RegisterInfo where Rname='" + uname + "'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    tixianMoney = Convert.ToDecimal(db.Rows[0][0].ToString());
                    if (tixianMoney <= 0)
                    {
                        str[0] = "1";
                    }
                    else
                    {
                        if (tixianMoney >= zzbi)
                        {
                            string sql2 = "insert into ws_TiXianInfo(Uname,JinEr,LiLv,HouMoney,ShenHe,AddTime) values('" + uname + "'," + zzbi + "," + bili + "," + money + ",2,'" + date + "')";
                            int c2 = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql2, null);
                            if (c2 > 0)
                            {
                                str[0] = "5";
                            }
                            else
                            {
                                str[0] = "6";
                            }
                        }
                        else
                        {
                            str[0] = "2";//会员的奖金币不足
                        }
                    }
                }
                else
                {
                    str[0] = "4";
                }
            }
            catch (Exception)
            {
                str[0] = "10";
            }
            return str;
        }
        #endregion
        /// <summary>
        /// 会员中心里的列表删除
        /// </summary>
        /// <param name="id">当前数据的ID</param>
        /// <param name="biaoming">表名</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnSingleDel(int id, string biaoming)
        {
            int singleId = 0;
            string sql = "";
            sql = "delete from " + biaoming + " where Id =" + id + "";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return singleId;
        }
        /// <summary>
        /// 加入购物车
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string[] JoinGwcMethod(int pid, int num, decimal price)
        {
            string[] str = new string[1];
            string uname = FrontUser.UserName.ToString();
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            decimal zprice = 0;//总价

            string sql = "select * from ws_ProductInfo where Id=" + pid;
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                zprice = price * num;//总价
                //查询当前登录会员的现金账户
                string sqlXianjin = "select YuErMoney from ws_RegisterInfo where Rname='" + uname + "'";
                DataTable dbXianjin = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlXianjin, null);
                if (dbXianjin.Rows.Count > 0)
                {
                    decimal yuErMoney = Convert.ToDecimal(dbXianjin.Rows[0][0].ToString());
                    if (zprice <= yuErMoney)
                    {
                        string sql1 = "";
                        //先判断购物车是否已经有当前产品
                        string sqlCount = "select count(*) from ws_BuyProList where Rname='" + uname + "' and Pid=" + pid + " and IsOrder=2";
                        int count =
                            Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount, null));
                        if (count > 0)
                        {
                            sql1 = "update ws_BuyProList set Num=Num+" + num + ",AddTime='" + date + "' where Rname='" + uname + "' and Pid=" + pid + " and IsOrder=2";
                        }
                        else
                        {
                            sql1 = "insert into ws_BuyProList(Rname,Pid,Num,IsOrder,AddTime) values('" + uname + "'," + pid + "," + num + ",2,'" + date + "')";
                        }
                        int isCg = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
                        if (isCg > 0)
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
                        str[0] = "5";//账户余额不足
                    }
                }
                else
                {
                    str[0] = "4";//没有当前会员
                }
            }
            else
            {
                str[0] = "3";//没有当前产品
            }
            return str;
        }
        /// <summary>
        /// 购物车  修改数量
        /// </summary>
        /// <param name="bid"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        [WebMethod]
        public static int UpdateBuyListMethod(int bid, int num)
        {
            string sql = "update ws_BuyProList set Num=" + num + " where Id=" + bid + " and IsOrder=2";
            return DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
        }
        /// <summary>
        /// 购物车  删除选中的数据
        /// </summary>
        /// <param name="hiTopId">选中的ID</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDeleteAll(string hiTopId)
        {
            string id = hiTopId.TrimEnd(',').ToString();
            int AllNum = 0;
            string sql = "";
            sql = "delete from ws_BuyProList where Id in (" + id + ") and IsOrder=2";
            AllNum = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return AllNum;
        }
        /// <summary>
        /// 购物车  单一删除
        /// </summary>
        /// <param name="id">当前数据的ID</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDiErSingleDel(int id)
        {
            int singleId = 0;
            string sql = "";
            sql = "delete from ws_BuyProList where Id =" + id + " and IsOrder=2";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return singleId;
        }
        /// <summary>
        /// 购物车  清空购物车
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDeleteQingKong()
        {
            string uname = FrontUser.UserName.ToString();
            string sql = "";
            sql = "delete from ws_BuyProList where Rname='" + uname + "' and IsOrder=2";
            return DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
        }
        /// <summary>
        /// 提交订单
        /// </summary>
        /// <param name="zprice"></param>
        /// <returns></returns>
        [WebMethod]
        public static string[] TrueJieSuanMethod(decimal zprice, int znum, string pid, string price)
        {
            Hashtable hashtable = new Hashtable();
            string[] str = new string[2];
            decimal jiangjin = 0;
            try
            {
                string uname = FrontUser.UserName.ToString();
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                //查询当前会员的现金账户
                string sqlshb = "select YuErMoney from ws_RegisterInfo where Rname='" + uname + "'";
                DataTable dbshb = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlshb, null);
                if (dbshb.Rows.Count > 0)
                {
                    jiangjin = Convert.ToDecimal(dbshb.Rows[0][0].ToString()); //当前会员的现金账户
                    if (jiangjin >= zprice)
                    {
                        //修改现金账户
                        string sqlbi1 = "update ws_RegisterInfo set YuErMoney=YuErMoney-" + zprice + " where Rname='" + uname + "'";
                        hashtable.Add(sqlbi1, "");
                        //修改购物车的单价字段
                        string[] nPid = pid.TrimEnd(',').Split(',');
                        string[] nPrice = price.TrimEnd(',').Split(',');
                        string orderid = "ZX" + GenerateOid.GetGenerateOid();//订单号
                        for (int i = 0; i < nPid.Length; i++)
                        {
                            string sqlUpBuy = "update ws_BuyProList set OrderId='" + orderid + "',DanJia=" + nPrice[i] + ",IsOrder=1 where Rname='" + uname + "' and Pid=" + nPid[i] + " and IsOrder=2";
                            hashtable.Add(sqlUpBuy, "");
                        }
                        //添加购买记录
                        string sqlOrder = "insert into ws_OrderList(Rname,OrderId,Znum,Zjiage,AddTime) values('" + uname + "','" + orderid + "'," + znum + "," + zprice + ",'" + date + "')";
                        hashtable.Add(sqlOrder, "");

                        //事务处理
                        int up = DBHelpers.ExecuteSqlTran(DBHelpers.conn, CommandType.Text, hashtable);
                        if (up > 0)
                        {
                            str[0] = "1";
                            str[1] = orderid;
                        }
                        else
                        {
                            str[0] = "2";//提交失败
                        }
                    }
                    else
                    {
                        str[0] = "3";//现金账户余额不足
                    }
                }
                else
                {
                    str[0] = "4";//没有当前会员
                }
            }
            catch (Exception)
            {
                str[0] = "10";//出现错误
            }
            return str;
        }
        /// <summary>
        /// 会员中心  我的订单  删除功能
        /// </summary>
        /// <param name="jhid"></param>
        /// <returns></returns>
        [WebMethod]
        public static int DeleteMyOrderMethod(int jhid, string orderId)
        {
            string sql = "delete from ws_OrderList where Id=" + jhid;
            int count = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            if (count > 0)
            {
                string sql1 = "delete from ws_BuyProList where OrderId='" + orderId + "'";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql1, null);
            }
            return count;
        }
        #region 确认订单发货
        [WebMethod]
        public static string[] IsFaHuoMethod(int jhid, string uname, decimal zprice, string danhao, string gongsi)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            Hashtable hashtable = new Hashtable();
            string[] str = new string[1];
            try
            {
                //判断是否可以升级
                string levelArr = GetAgentLevel.GetUnameAgentLevel(uname);//当前购买会员的代理信息
                string levelType = levelArr.Substring(0, levelArr.LastIndexOf(","));//当前购买会员的代理级别  名字
                int userlevel = Convert.ToInt32(levelArr.Substring(levelArr.LastIndexOf(",") + 1));//当前购买会员的代理级别  等级
                //decimal usermoney = GetAgentLevel.GetAgentLevelMoney(userlevel);//当前购买会员的等级所对应的价格

                string tjrName = GetTuiJianRen.GetTuiJianRenMethod(uname);//当前购买会员的推荐人
                //string tjrLevelArr = GetAgentLevel.GetUnameAgentLevel(tjrName);//当前购买会员的推荐人的代理信息
                //string tjrLevelType = tjrLevelArr.Substring(0, tjrLevelArr.LastIndexOf(","));//当前购买会员的推荐人的代理级别  名字
                //int tjruserlevel = Convert.ToInt32(tjrLevelArr.Substring(tjrLevelArr.LastIndexOf(",") + 1));//当前购买会员的推荐人的代理级别  等级

                string maxlevel = GetAgentLevel.GetMaxAgentLevel();//最高代理级别
                string maxleveltit = maxlevel.Substring(0, maxlevel.LastIndexOf(","));//最高代理级别  名字
                //int maxleveldj = Convert.ToInt32(maxlevel.Substring(maxlevel.LastIndexOf(",") + 1));//最高代理级别  等级

                if (levelType == maxleveltit)
                {
                    string erjiName = "";
                    string sanjiName = "";
                    //如果当前会员的代理级别最大了，不升级，开始拿分销差价
                    float diyi = GetRateInstall.GetRateMethod("YiJiBili");//第一级分销比例
                    float dier = GetRateInstall.GetRateMethod("ErJiBili");//第二级分销比例
                    float disan = GetRateInstall.GetRateMethod("SanJiBili");//第三级分销比例
                    erjiName = GetTuiJianRen.GetTuiJianRenMethod(tjrName);//第二级分销会员名
                    sanjiName = GetTuiJianRen.GetTuiJianRenMethod(erjiName);//第三级分销会员名
                    if (tjrName != "")
                    {
                        decimal diyid = zprice * Convert.ToDecimal(diyi);
                        string sqlYi = "update ws_RegisterInfo set TiXianMoney=TiXianMoney+" + diyid + " where Rname='" + tjrName + "'";
                        hashtable.Add(sqlYi, "");
                        string sqlInsert = "insert into ws_FenXiaoList(Uname,HjName,LiLv,Money,AddTime) values('" + uname + "','" + tjrName + "'," + diyi + "," + diyid + ",'" + date + "')";
                        hashtable.Add(sqlInsert, "");
                    }
                    if (erjiName != "")
                    {
                        decimal dierd = zprice * Convert.ToDecimal(dier);
                        string sqlYi = "update ws_RegisterInfo set TiXianMoney=TiXianMoney+" + dierd + " where Rname='" + erjiName + "'";
                        hashtable.Add(sqlYi, "");
                        string sqlInsert = "insert into ws_FenXiaoList(Uname,HjName,LiLv,Money,AddTime) values('" + uname + "','" + erjiName + "'," + dier + "," + dierd + ",'" + date + "')";
                        hashtable.Add(sqlInsert, "");
                    }
                    if (sanjiName != "")
                    {
                        decimal disand = zprice * Convert.ToDecimal(disan);
                        string sqlYi = "update ws_RegisterInfo set TiXianMoney=TiXianMoney+" + disand + " where Rname='" + sanjiName + "'";
                        hashtable.Add(sqlYi, "");
                        string sqlInsert = "insert into ws_FenXiaoList(Uname,HjName,LiLv,Money,AddTime) values('" + uname + "','" + sanjiName + "'," + disan + "," + disand + ",'" + date + "')";
                        hashtable.Add(sqlInsert, "");
                    }
                }
                else
                {
                    //根据拿货总价查询比当前等级高的级别
                    //string levelTit = "";
                    //decimal levelMoney = 0;
                    int levelNum = 0;
                    string sqlLevel =
                        "select top 1 * from ws_AgentLevel where [Money]<" + zprice +
                        " order by [Money] desc";
                    DataTable dbLevel = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text,
                        sqlLevel,
                        null);
                    if (dbLevel.Rows.Count > 0)
                    {
                        //levelTit = dbLevel.Rows[0]["Title"].ToString();
                        //levelMoney = Convert.ToDecimal(dbLevel.Rows[0]["Money"].ToString());
                        levelNum = Convert.ToInt32(dbLevel.Rows[0]["Level"].ToString());
                    }
                    //等级相等，不升级
                    if (userlevel <= levelNum)
                    {
                        string sqlUpOrder = "update ws_OrderList set IsFaHuo=1,KdDanhao='" + danhao + "',KdGongsi='" + gongsi + "',FaTime='" + date + "' where Id=" + jhid + "";
                        hashtable.Add(sqlUpOrder, "");
                    }
                    //同级升级
                    if (userlevel == levelNum + 1)
                    {
                        //修改购买会员的代理等级信息
                        string tuijianren2 = GetTuiJianRen.GetTuiJianRenMethod(tjrName);
                        //string sqlUptj = "update ws_RegisterInfo set UserType='" + levelTit + "',Userlevel=" + levelNum + ",OldTuiJianRen=TuiJianRen,TuiJianRen='" + tuijianren2 + "' where Rname='" + uname + "'";
                        //hashtable.Add(sqlUptj, "");
                        string sqlUpOrder = "update ws_OrderList set IsFaHuo=1,KdDanhao='" + danhao + "',KdGongsi='" + gongsi + "',FaTime='" + date + "' where Id=" + jhid + "";
                        hashtable.Add(sqlUpOrder, "");
                        //查询是否已经存在还没审核的同级升级记录
                        string sqlCount = "select count(*) from ws_UpdateInfo where Uname='" + uname + "' and Type=1 and ShenHe=2";
                        int count =
                            Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount, null));
                        if (count <= 0)
                        {
                            //添加升级记录
                            string sqlJilu =
                                "insert into ws_UpdateInfo(Uname,OldTuiJianRen,TuiJianRen,OldLevel,XianLevel,LevelMoney,Type,ShenHe,AddTime) values('" +
                                uname + "','" + tjrName + "','" + tuijianren2 + "'," + userlevel + "," + levelNum + ",5,1,2,'" + date + "')";
                            hashtable.Add(sqlJilu, "");
                            //string sqlMoney = "update ws_RegisterInfo set TiXianMoney=TiXianMoney+5 where Rname='" + tuijianren2 + "'";
                            //hashtable.Add(sqlMoney, "");
                        }
                    }
                    //跨级升级
                    if (userlevel > levelNum + 1)
                    {
                        GetKuaJiTjr getKuaJiTjr = new GetKuaJiTjr();
                        string tuijianren3 = getKuaJiTjr.TeamInfo(uname, levelNum);
                        //修改购买会员的代理等级信息
                        //string sqlUptj = "update ws_RegisterInfo set UserType='" + levelTit + "',Userlevel=" + levelNum + ",OldTuiJianRen=TuiJianRen,TuiJianRen='" + tuijianren3 + "' where Rname='" + uname + "'";
                        //hashtable.Add(sqlUptj, "");
                        string sqlUpOrder = "update ws_OrderList set IsFaHuo=1,KdDanhao='" + danhao + "',KdGongsi='" + gongsi + "',FaTime='" + date + "' where Id=" + jhid + "";
                        hashtable.Add(sqlUpOrder, "");
                        //查询是否已经存在跨级升级记录
                        string sqlCount = "select count(*) from ws_UpdateInfo where Uname='" + uname + "' and Type=2";
                        int count =
                            Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount, null));
                        if (count <= 0)
                        {
                            //添加升级记录
                            string sqlJilu = "insert into ws_UpdateInfo(Uname,OldTuiJianRen,TuiJianRen,OldLevel,XianLevel,LevelMoney,Type,ShenHe,AddTime) values('" + uname + "','" + tjrName + "','" + tuijianren3 + "'," + userlevel + "," + levelNum + ",5,2,2,'" + date + "')";
                            hashtable.Add(sqlJilu, "");
                            //string sqlMoney = "update ws_RegisterInfo set TiXianMoney=TiXianMoney+5 where Rname='" + tuijianren3 + "'";
                            //hashtable.Add(sqlMoney, "");
                        }
                    }
                }
                //事务处理
                int up = DBHelpers.ExecuteSqlTran(DBHelpers.conn, CommandType.Text, hashtable);
                if (up > 0)
                {
                    str[0] = "1";
                }
                else
                {
                    str[0] = "2";//提交失败
                }
            }
            catch (Exception)
            {
                str[0] = "3";//提交失败
            }
            return str;
        }
        #endregion

        #region 提交充值记录
        [WebMethod]
        public static string[] AddChongZhiMehod(int money)
        {
            string[] str = new string[1];
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sname = FrontUser.UserName.ToString();
            string sql = "insert into ws_ChongZhiInfo(Rname,Money,ShenHe,AddTime) values('" + sname + "'," + money + ",1,'" + date + "')";
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
        #region 密码加密
        /// <summary>
        /// 传入明文，返回用MD5加密后的字符串
        /// </summary>
        /// <param name="str">要加密的字符串</param>
        /// <returns>用MD5加密后的字符串</returns>
        public static string ToMD5(string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5");
        }
        #endregion
    }
}