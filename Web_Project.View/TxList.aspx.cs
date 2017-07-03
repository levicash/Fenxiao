using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using Web_Project.View.Contrl;

namespace Web_Project.View
{
    public partial class TxList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Pager1.binddata += new Pager.ShowDelegate2(ShowInfo);
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                TiXianZong();
                ShowInfo();
            }
        }

        protected void TiXianZong()
        {
            string uname = FrontUser.UserName.ToString();
            string sqlInfo = "select sum(HouMoney) as sjiner from ws_TiXianInfo where Uname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo, null);
            if (db.Rows.Count>0)
            {
                Literal1.Text = db.Rows[0]["sjiner"].ToString() == "" ? "0" : db.Rows[0]["sjiner"].ToString();
            }
            string sqlInfo1 = "select sum(HouMoney) as sjiner from ws_TiXianInfo where Uname='" + uname + "' and ShenHe=1";
            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo1, null);
            if (db1.Rows.Count > 0)
            {
                Literal2.Text = db1.Rows[0]["sjiner"].ToString() == "" ? "0" : db1.Rows[0]["sjiner"].ToString();
            }
            string sqlInfo2 = "select sum(HouMoney) as sjiner from ws_TiXianInfo where Uname='" + uname + "' and ShenHe=2";
            DataTable db2 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo2, null);
            if (db2.Rows.Count > 0)
            {
                Literal3.Text = db2.Rows[0]["sjiner"].ToString() == "" ? "0" : db2.Rows[0]["sjiner"].ToString();
            }
        }

        protected void ShowInfo()
        {
            WebInfo("奖金提现列表");
            string sqlCount = "";//获取总条数
            string sqlInfo = "";//具体查询sql
            string uname = FrontUser.UserName.ToString();
            sqlCount = "select count(*) from ws_TiXianInfo where Uname='" + uname + "'";//获取总条数
            sqlInfo = "select * from ws_TiXianInfo where Uname='" + uname + "'";
            Pager1._pagesize = 12;//每页显示的条数
            Pager1._orderFid = "AddTime desc";//排序字段
            Pager1._RowCountSql = sqlCount;//获取总条数
            Pager1._InfoSql = sqlInfo;//具体查询sql
            Repeater1.DataSource = Pager1.PageInfo();
            Repeater1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            ShowInfo();
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}