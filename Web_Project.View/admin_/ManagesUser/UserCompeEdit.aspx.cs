using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.ManagesUser
{
    public partial class UserCompeEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                    GetUserName();
                    UserCompeList();
                }
            }
        }
        /// <summary>
        /// 根据参数logid获取用户名
        /// </summary>
        protected void GetUserName()
        {
            if (Request["logid"] != null)
            {
                int logid = Convert.ToInt32(Request["logid"].ToString());
                string sql = "select * from ws_BackUserInfo where Id=" + logid + "";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    lterAdmin.Text = db.Rows[0]["UserName"].ToString();
                }
            }
        }
        /// <summary>
        /// 绑定一级权限菜单
        /// </summary>
        protected void UserCompeList()
        {
            string sql = "";
            //当前登录用户名
            int logid = Convert.ToInt32(AdminInfo.UserID.ToString());
            //查询当前登录会员的角色
            int roleId = 0;
            string sqlRole = "select Type from ws_BackUserInfo where Id=" + logid + "";
            DataTable dbRole = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlRole, null);
            if (dbRole.Rows.Count > 0)
            {
                roleId = Convert.ToInt32(dbRole.Rows[0]["Type"].ToString());
            }
            if (roleId != 1)
            {
                string sqlCom = "select * from ws_BackLimitTable where LogId=" + logid;
                DataTable dbCom = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlCom, null);
                if (dbCom.Rows.Count > 0)
                {
                    string com = dbCom.Rows[0]["FatherId"].ToString();
                    string shuzu = com.TrimEnd(',');
                    sql = "select * from ws_BackUserCompetence where Type=0 and Id in (" + shuzu +
                          ") order by Orders,Id";
                }
            }
            else
            {
                sql = "select * from ws_BackUserCompetence where Type=0 order by Orders,Id";
            }
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        /// <summary>
        /// 绑定二级权限菜单
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Repeater1_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string sql = "";
                string id = (e.Item.FindControl("HiddenField1") as HiddenField).Value.ToString();
                Repeater Repeater2 = e.Item.FindControl("Repeater2") as Repeater;
                //当前登录用户名
                int logid = Convert.ToInt32(AdminInfo.UserID.ToString());
                //查询当前登录会员的角色
                int roleId = 0;
                string sqlRole = "select Type from ws_BackUserInfo where Id=" + logid + "";
                DataTable dbRole = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlRole, null);
                if (dbRole.Rows.Count > 0)
                {
                    roleId = Convert.ToInt32(dbRole.Rows[0]["Type"].ToString());
                }
                if (roleId != 1)
                {
                    string sqlCom = "select * from ws_BackLimitTable where LogId=" + logid;
                    DataTable dbCom = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlCom, null);
                    if (dbCom.Rows.Count > 0)
                    {
                        string com = dbCom.Rows[0]["SonId"].ToString();
                        string shuzu = com.TrimEnd(',');
                        sql = "select * from ws_BackUserCompetence where Type=" + id + " and Id in (" + shuzu +
                              ") order by Orders,Id";
                    }
                }
                else
                {
                    sql = "select * from ws_BackUserCompetence where Type=" + id + " order by Orders,Id";
                }
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                Repeater2.DataSource = db;
                Repeater2.DataBind();
            }
        }
        /// <summary>
        /// 获取权限
        /// </summary>
        /// <param name="loginid"></param>
        /// <returns></returns>
        [WebMethod]
        public static string GetLink(int loginid)
        {
            string sql = "select FatherId,SonId from ws_BackLimitTable where LogId=" + loginid + "";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            string strLink = "";
            for (int i = 0; i < db.Rows.Count; i++)
            {
                strLink += db.Rows[i][0].ToString() + db.Rows[i][1].ToString();
            }
            return strLink;
        }
        /// <summary>
        /// 修改用户权限
        /// </summary>
        /// <param name="loginid">当前登录ID</param>
        /// <param name="fid">父级权限</param>
        /// <param name="sid">子级权限</param>
        /// <returns></returns>
        [WebMethod]
        public static int UpdateUserCompetence(int loginid, string fid, string sid)
        {
            int Upid = 0;
            string sql = "";
            string sqllogCon = "select count(*) from ws_BackLimitTable where LogId=" + loginid + "";
            int logCon = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqllogCon, null));
            if (logCon > 0)
            {
                sql = "update ws_BackLimitTable set FatherId='" + fid + "',SonId='" + sid + "' where LogId=" + loginid + "";
            }
            else
            {
                sql = "insert into ws_BackLimitTable(LogId,FatherId,SonId) values(" + loginid + ",'" + fid + "','" + sid + "')";
            }
            Upid = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return Upid;
        }
    }
}