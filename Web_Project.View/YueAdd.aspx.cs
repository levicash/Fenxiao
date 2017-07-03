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
    public partial class YueAdd : System.Web.UI.Page
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
                WebInfo("我要充值");
                ShowInfo();
            }
        }

        protected void ShowInfo()
        {
            string rname = FrontUser.UserName.ToString();
            int rid = FrontUser.RegisterInfoId(rname);
            string sqlKc = "select YuErMoney from ws_RegisterInfo where Id=" + rid + "";
            DataTable dbKc = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlKc, null);
            if (dbKc.Rows.Count > 0)
            {
                Literal1.Text = dbKc.Rows[0][0].ToString();
            }
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}