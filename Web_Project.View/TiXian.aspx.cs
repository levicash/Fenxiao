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
    public partial class TiXian : System.Web.UI.Page
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
                WebInfo("申请提现");
                UserInfoMethod();
            }
        }
        /// <summary>
        /// 获取当前登录人的等级信息
        /// </summary>
        protected void UserInfoMethod()
        {
            string userName = FrontUser.UserName.ToString();
            string sql = "select * from ws_RegisterInfo where Rname='" + userName + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal1.Text = userName;
                Literal2.Text = db.Rows[0]["Jiangjin"].ToString();
            }
            string sql1 = "select top 1 * from ws_RateInstall";
            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
            if (db1.Rows.Count > 0)
            {
                Literal3.Text = (float.Parse(db1.Rows[0]["TxBili"].ToString()) * 100).ToString();
                HiddenField1.Value = db1.Rows[0]["TxBili"].ToString();
            }
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}