using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using Web_Project.View.Contrl;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class Product : System.Web.UI.Page
    {
        string str = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Pager1.binddata += new Pager.ShowDelegate2(Info);
            if (!IsPostBack)
            {
                Info();
            }
        }
        protected void Info()
        {
            string sqlCount = "";//获取总条数
            string sqlInfo = "";//具体查询sql
            if (RouteData.Values["pid"] != null)
            {
                int pid = Convert.ToInt32(RouteData.Values["pid"].ToString());
                //查询当前ID对应的标题
                string sqlTit = "select * from ws_ProType where Id=" + pid + " order by AddTime desc";
                DataTable dbTit = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlTit, null);
                if (dbTit.Rows.Count > 0)
                {
                    WebInfo(dbTit.Rows[0]["Title"].ToString());
                    string pType = dbTit.Rows[0]["Type"].ToString();
                    if (pType == "0")
                    {
                        Literal1.Text = "&nbsp;&gt;&nbsp;" + dbTit.Rows[0]["Title"].ToString();
                    }
                    else
                    {
                        DB_Location dbLocation = new DB_Location();
                        string strSz = dbLocation.TeamInfo(pid);
                        string[] shuzu = strSz.TrimEnd(',').Split(',');
                        string[] test2 = new string[shuzu.Length];
                        int j = 0;
                        for (int i = shuzu.Length - 1; i >= 0; i--)
                        {
                            test2[i] = shuzu[j];
                            j++;
                        }
                        string weizhi = "";
                        for (int i = 0; i < test2.Length; i++)
                        {
                            string sql = "select Title from ws_ProType where Id=" + Convert.ToInt32(test2[i].ToString());
                            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                            if (db.Rows.Count > 0)
                            {
                                weizhi += "&nbsp;&gt;&nbsp;" + db.Rows[0][0].ToString();
                            }
                        }
                        Literal1.Text = weizhi + "&nbsp;&gt;&nbsp;" + dbTit.Rows[0]["Title"].ToString();
                    }
                }
                //绑定数据
                DataTable dt = GetClassList("").Tables[0];
                DataRow[] drs = dt.Select("Type= " + pid);
                for (int i = 0; i < drs.Length; i++)
                {
                    string blank = "";
                    int classid = Convert.ToInt32(drs[i]["Id"].ToString());
                    int sonparentid = classid;
                    //递归子分类方法
                    BindDrpNode(sonparentid, dt, blank);
                }
                //if (str != "")
                //{
                string str1 = pid + "," + str;
                sqlCount = "select count(*) from ws_ProductInfo where Type in (" + (str1.TrimEnd(',')) + ") and ShangJia='上架'";//获取总条数
                sqlInfo = "select * from ws_ProductInfo where Type in (" + (str1.TrimEnd(',')) + ") and ShangJia='上架'";
                //热卖产品
                string sqlHot = "select top 4 * from ws_ProductInfo where Type in (" + (str1.TrimEnd(',')) + ") and ReXiao='热销' and ShangJia='上架' order by Orders,Id";
                DataTable dbHot = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlHot, null);
                Repeater1.DataSource = dbHot;
                Repeater1.DataBind();
                //}
                //else
                //{
                //    sql11 = "select * from ws_ProductInfo where Type=" + pid + " order by Orders,Id";
                //}
            }
            //else if (Request["txt"] != null)
            //{
            //    string txt = Request["txt"].ToString();
            //    sql11 = "select a.* from ws_ProductInfo a left join ws_ProType b on a.Type=b.Id where a.Title like '%" + txt + "%' order by a.Orders";
            //    WebInfo("搜索结果");
            //    //Literal1.Text = "搜索结果";
            //    //Literal2.Text = "&nbsp;&gt;&gt;&nbsp;搜索结果";
            //}
            else
            {
                sqlCount = "select count(*) from ws_ProductInfo where ShangJia='上架'";//获取总条数
                sqlInfo = "select * from ws_ProductInfo where ShangJia='上架' order by Orders,Id";
                WebInfo("产品中心");
            }
            Pager1._pagesize = 25;//每页显示的条数
            Pager1._orderFid = "Orders,Id";//排序字段
            Pager1._RowCountSql = sqlCount;//获取总条数
            Pager1._InfoSql = sqlInfo;//具体查询sql
            Repeater2.DataSource = Pager1.PageInfo();
            Repeater2.DataBind();
        }
        public string ProXinPinPrice(string pid)
        {
            string str = "0.00";
            if (FrontUser.IsAuthenticated)
            {
                string uname = FrontUser.UserName.ToString();//当前登录账户的用户名
                string sql = "select Userlevel from ws_RegisterInfo where Rname='" + uname + "'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    int level = Convert.ToInt32(db.Rows[0][0].ToString());
                    string sql1 = "select Price" + level + " from ws_ProductInfo where Id=" + pid + "";
                    DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
                    if (db1.Rows.Count > 0)
                    {
                        str = db1.Rows[0][0].ToString();
                    }
                }
            }
            else
            {
                str = "登录查看";
            }
            return str;
        }
        /// <summary>
        /// 绑定子分类
        /// </summary>
        /// <param name="parentid"></param>
        /// <param name="dt"></param>
        /// <param name="blank"></param>
        private void BindDrpNode(int parentid, DataTable dt, string blank)
        {
            DataRow[] drs = dt.Select("Type= " + parentid + "");
            str += parentid.ToString() + ",";
            for (int i = 0; i < drs.Length; i++)
            {
                int classid = Convert.ToInt32(drs[i]["Id"].ToString());
                string blank2 = blank + "─";
                BindDrpNode(classid, dt, blank2);
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
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
        public string ReplaceStr(string result)
        {
            if (Request["txt"] != null)
            {
                string title = Request["txt"].ToString();
                result = result.Replace(title, "<font color='red'>" + title + "</font>");
            }
            return result;
        }

        protected string Html(string name)
        {
            return ClearHtml.clearHtml1(name);
        }
    }
}