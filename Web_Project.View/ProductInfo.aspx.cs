using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class ProductInfo : System.Web.UI.Page
    {
        public int pvid = 0;
        public int nxid = 0;
        public int prid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProMoreImgMethod();
                Info();
            }
        }

        protected void ProMoreImgMethod()
        {
            if (RouteData.Values["pid"] != null)
            {
                int pid = Convert.ToInt32(RouteData.Values["pid"].ToString());
                string sql = "select * from ws_MoreImgInfo where Type=" + pid + " order by Orders,Id";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                Repeater1.DataSource = db;
                Repeater1.DataBind();
            }
        }

        protected void Info()
        {
            string sql = "";
            int order = 0;
            int type = 0;
            if (RouteData.Values["pid"] != null)
            {
                prid = Convert.ToInt32(RouteData.Values["pid"].ToString());
                int pid = Convert.ToInt32(RouteData.Values["pid"].ToString());
                sql = "select a.*,b.Title as bname from ws_ProductInfo a left join ws_ProType b on a.Type=b.Id where a.Id=" + pid + " order by b.Orders,a.Orders";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    WebInfo(db.Rows[0]["Title"].ToString());
                    Literal1.Text = db.Rows[0]["Title"].ToString();
                    Literal2.Text = db.Rows[0]["BianHao"].ToString();
                    Literal3.Text = db.Rows[0]["GuiGe"].ToString();
                    Literal4.Text = db.Rows[0]["XPrice"].ToString();
                    Literal7.Text = db.Rows[0]["Desp"].ToString();
                    //当前位置
                    if (RouteData.Values["tid"] != null)
                    {
                        int tid = Convert.ToInt32(RouteData.Values["tid"].ToString());
                        DB_Location dbLocation = new DB_Location();
                        string strSz = tid + "," + dbLocation.TeamInfo(tid);
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
                            string sqll = "select Title from ws_ProType where Id=" +
                                          Convert.ToInt32(test2[i].ToString());
                            DataTable dbl = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqll, null);
                            if (dbl.Rows.Count > 0)
                            {
                                weizhi += "&nbsp;&gt;&nbsp;" + dbl.Rows[0][0].ToString();
                            }
                        }
                        Literal9.Text = weizhi + "&nbsp;&gt;&nbsp;" + db.Rows[0]["Title"].ToString();
                    }
                }
                //相关产品
                if (RouteData.Values["tid"] != null)
                {
                    int tid = Convert.ToInt32(RouteData.Values["tid"].ToString());
                    string sqlXg = "select top 3 * from ws_ProductInfo where Type=" + tid + " and Id<>" + pid + " order by Orders,Id";
                    DataTable dbXg = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlXg, null);
                    Repeater2.DataSource = dbXg;
                    Repeater2.DataBind();
                }
            }
        }
        public string ProXinPinPrice(string pid)
        {
            string str = "0.00";
            if (FrontUser.IsAuthenticated)
            {
                string uname = FrontUser.UserName.ToString();//当前登录账户的用户名
                //int uid = FrontUser.RegisterInfoId(uname);//当前登录账户的ID
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
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}