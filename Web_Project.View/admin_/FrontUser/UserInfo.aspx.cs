using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.FrontUser
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "",
                        "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                    ShowInfo();
                }
            }
        }
        protected void ShowInfo()
        {
            if (Request["uid"] != null)
            {
                int uid = Convert.ToInt32(Request["uid"].ToString());
                string sql = "select * from ws_RegisterInfo where Id=" + uid + " order by AddTime desc";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal1.Text = db.Rows[0]["Rname"].ToString();
                    Literal2.Text = db.Rows[0]["Rname"].ToString();
                    Literal3.Text = db.Rows[0]["Uname"].ToString();
                    Literal4.Text = db.Rows[0]["ZhuCeRen"].ToString();
                    Literal5.Text = db.Rows[0]["TuiJianRen"].ToString();
                    //Literal6.Text = db.Rows[0]["Uname"].ToString();
                    Literal7.Text = db.Rows[0]["IdCard"].ToString();
                    Literal12.Text = db.Rows[0]["Province"].ToString();
                    Literal13.Text = db.Rows[0]["City"].ToString();
                    Literal14.Text = db.Rows[0]["County"].ToString();
                    Literal15.Text = db.Rows[0]["Address"].ToString();
                    Literal16.Text = db.Rows[0]["KaHao"].ToString();
                    Literal17.Text = db.Rows[0]["KaiHuHang"].ToString();
                    Literal18.Text = db.Rows[0]["KaiHuRen"].ToString();
                    //Literal21.Text = db.Rows[0]["TiXianMoney"].ToString();
                    Literal25.Text = db.Rows[0]["AddTime"].ToString();
                }
            }
        }
    }
}