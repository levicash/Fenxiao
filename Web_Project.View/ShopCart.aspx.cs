using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using System.Data;

namespace Web_Project.View
{
    public partial class ShopCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                WebInfo("购物车");
                BuyProListMethod();
            }
        }

        protected void BuyProListMethod()
        {
            string uname = FrontUser.UserName.ToString();
            string sql = "select * from BuyListView where Rname='" + uname + "' and IsOrder=2 order by AddTime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        public string ProXinPinPrice(string pid)
        {
            string str = "0.00";
            if (FrontUser.IsAuthenticated)
            {
                string sql1 = "select XPrice from ws_ProductInfo where Id=" + pid + "";
                DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
                if (db1.Rows.Count > 0)
                {
                    str = db1.Rows[0][0].ToString();
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