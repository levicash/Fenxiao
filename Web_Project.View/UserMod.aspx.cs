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
    public partial class UserMod : System.Web.UI.Page
    {
        public string rbianhao = "";
        public string rname = "";
        public string tuijianren = "";
        public string uname = "";
        public string card = "";
        public string address = "";
        public string kahao = "";
        public string kaihuhang = "";
        public string kaihuren = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                WebInfo("个人资料");
                UserInfoMethod();
            }
        }
        /// <summary>
        /// 获取当前登录人的部分信息  除会员等级、所属区域
        /// </summary>
        protected void UserInfoMethod()
        {
            string userName = FrontUser.UserName.ToString();
            string sql = "select * from ws_RegisterInfo where Rname='"+userName+"'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count>0)
            {
                //rbianhao = GetUserBianHao.GetUserBianHaoMethod(db.Rows[0]["Rbianhao"].ToString());
                rname = db.Rows[0]["Rname"].ToString();
                tuijianren = db.Rows[0]["TuiJianRen"].ToString();
                uname = db.Rows[0]["Uname"].ToString();
                card = db.Rows[0]["IdCard"].ToString();
                address = db.Rows[0]["Address"].ToString();
                kahao = db.Rows[0]["KaHao"].ToString();
                kaihuhang = db.Rows[0]["KaiHuHang"].ToString();
                kaihuren = db.Rows[0]["KaiHuRen"].ToString();
            }
        }
        

        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}