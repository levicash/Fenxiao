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
    public partial class Settle : System.Web.UI.Page
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
                WebInfo();
                BuyProListMethod();
            }
        }
        protected void BuyProListMethod()
        {
            string uname = Literal2.Text = FrontUser.UserName.ToString();
            string sqlUser = "select * from ws_RegisterInfo where Rname='" + uname + "' order by AddTime desc";
            DataTable dbUser = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlUser, null);
            if (dbUser.Rows.Count > 0)
            {
                Literal1.Text = dbUser.Rows[0]["Uname"].ToString();
                Literal3.Text = dbUser.Rows[0]["Province"].ToString() + dbUser.Rows[0]["City"].ToString() + dbUser.Rows[0]["County"].ToString() + dbUser.Rows[0]["Address"].ToString();
            }

            string sqlCar = "select * from BuyListView where Rname='" + uname + "' and IsOrder=2 order by AddTime desc";
            DataTable dbCar = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlCar, null);
            Repeater1.DataSource = dbCar;
            Repeater1.DataBind();
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
        protected void WebInfo()
        {
            Page.Header.Title = Web.webInfo();
        }
    }
}