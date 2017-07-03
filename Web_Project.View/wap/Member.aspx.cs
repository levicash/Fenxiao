using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.wap
{
    public partial class Member : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                string strSql = "select * from ws_WebInfo";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    webKey = db.Rows[0]["webKey"].ToString() == "" ? "" : db.Rows[0]["webKey"].ToString();
                    webDes = db.Rows[0]["webDep"].ToString() == "" ? "" : db.Rows[0]["webDep"].ToString();
                }
                HtmlMeta metaKeyWords = new HtmlMeta();
                HtmlMeta metaDescription = new HtmlMeta();
                metaKeyWords.Name = "Keywords";
                metaKeyWords.Content = webKey;
                metaDescription.Name = "description";
                metaDescription.Content = webDes;
                Header.Controls.Add(metaKeyWords);
                Header.Controls.Add(metaDescription);//Header1是head的id
                WebInfo("用户中心");
                string userName = FrontUser.UserName.ToString();
                UserInfoMethod(userName);
            }
        }
        /// <summary>
        /// 获取当前登录人的等级信息
        /// </summary>
        protected void UserInfoMethod(string userName)
        {
            string sql = "select * from ws_RegisterInfo where Rname='" + userName + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal1.Text = userName;
                Literal2.Text = db.Rows[0]["UserType"].ToString();
                Literal3.Text = db.Rows[0]["TiXianMoney"].ToString();
            }
            //获取代理数量
            GetDaiLiCount getDaiLiCount = new GetDaiLiCount();
            Literal4.Text = getDaiLiCount.TeamInfo(userName);
            string sqlbili = "select top 1 * from ws_RateInstall order by Id";
            DataTable dbbili = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlbili, null);
            if (dbbili.Rows.Count > 0)
            {
                Literal5.Text = (float.Parse(dbbili.Rows[0]["TxBili"].ToString()) * 100).ToString();
            }
        }
        ///// <summary>
        ///// 当前会员的订单数量
        ///// </summary>
        //protected void OrderListCount(string uname)
        //{
        //    string sqlCount = "select count(*) from ws_OrderList where Rname='" + uname + "'";//获取总条数
        //    int count1 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount, null));
        //    Literal6.Text = count1.ToString();
        //    string sqlCount2 = "select count(*) from ws_OrderList where Rname='" + uname + "' and IsFaHuo=2";//获取总条数
        //    int count2 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount2, null));
        //    Literal7.Text = count2.ToString();
        //    string sqlCount3 = "select count(*) from ws_OrderList where Rname='" + uname + "' and IsFaHuo=1";//获取总条数
        //    int count3 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount3, null));
        //    Literal8.Text = count3.ToString();
        //}
        ///// <summary>
        ///// 订单数量
        ///// </summary>
        //protected void FaHuoOrderCount(string uname)
        //{
        //    string sqlCount = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "'";//获取总条数
        //    int count1 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount, null));
        //    Literal9.Text = count1.ToString();
        //    string sqlCount2 = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "' and IsFaHuo=2";//获取总条数
        //    int count2 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount2, null));
        //    Literal10.Text = count2.ToString();
        //    string sqlCount3 = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "' and IsFaHuo=1";//获取总条数
        //    int count3 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount3, null));
        //    Literal11.Text = count3.ToString();
        //}
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}