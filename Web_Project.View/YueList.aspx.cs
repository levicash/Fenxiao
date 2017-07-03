using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using Web_Project.View.Contrl;

namespace Web_Project.View
{
    public partial class YueList : System.Web.UI.Page
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
                ShowInfo();
            }
        }

        protected void ShowInfo()
        {
            WebInfo("充值记录");
            string sqlCount = "";//获取总条数
            string sqlInfo = "";//具体查询sql

            string stime = TextBox2.Text.Trim();//开始时间
            string etime = TextBox3.Text.Trim();//结束时间

            string uname = FrontUser.UserName.ToString();
            sqlCount = "select count(*) from ws_ChongZhiInfo where Rname='" + uname + "'";//获取总条数
            sqlInfo = "select * from ws_ChongZhiInfo where Rname='" + uname + "'";

            if (stime != "" && etime != "")
            {
                sqlCount += " and DATEDIFF([day], convert(nvarchar,AddTime,23) , '" + stime + "')<=0 and DATEDIFF([day], convert(nvarchar,AddTime,23) , '" + etime + "')>=0";
                sqlInfo += " and DATEDIFF([day], convert(nvarchar,AddTime,23) , '" + stime + "')<=0 and DATEDIFF([day], convert(nvarchar,AddTime,23) , '" + etime + "')>=0";
            }

            Pager1._pagesize = 20;//每页显示的条数
            Pager1._orderFid = "sp.AddTime desc";//排序字段
            Pager1._RowCountSql = sqlCount;//获取总条数
            Pager1._InfoSql = sqlInfo;//具体查询sql
            Repeater1.DataSource = Pager1.PageInfo();
            Repeater1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            ShowInfo();
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            ShowInfo();
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}