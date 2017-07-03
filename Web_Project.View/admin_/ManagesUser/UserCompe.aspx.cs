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
    public partial class UserCompe : System.Web.UI.Page
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
                    UserCompeList();
                }
            }
        }
        /// <summary>
        /// 信息绑定
        /// </summary>
        /// <summary>
        /// 绑定一级权限菜单
        /// </summary>
        protected void UserCompeList()
        {
            string sql = "select * from ws_BackUserCompetence where Type=0 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            repProInfo.DataSource = db;
            repProInfo.DataBind();
        }
        protected void Repeater1_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string id = (e.Item.FindControl("HiddenField1") as HiddenField).Value.ToString();
                Repeater Repeater2 = e.Item.FindControl("Repeater2") as Repeater;
                string sql = "select * from ws_BackUserCompetence where Type=" + id + " order by Orders,Id";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                Repeater2.DataSource = db;
                Repeater2.DataBind();
            }
        }
        /// <summary>
        /// 删除选中的一级权限
        /// </summary>
        /// <param name="HiTopId"></param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDeleteAll(string HiTopId)
        {
            string id = HiTopId.TrimEnd(',').ToString();
            int AllNum = 0;
            string sql = "";
            //删除一级权限的sql
            sql = "delete from ws_BackUserCompetence where Id in (" + id + ")";
            AllNum = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            //删除对应的二级权限的sql
            if (AllNum > 0)
            {
                string sqler = "delete from ws_BackUserCompetence where Type in (" + id + ")";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sqler, null);
            }
            return AllNum;
        }
        /// <summary>
        /// 单一删除第一级权限
        /// </summary>
        /// <param name="compyiid">当前一级权限的ID</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDiYiSingleDel(int compyiid)
        {
            int singleId = 0;
            string sql = "";
            sql = "delete from ws_BackUserCompetence where Id =" + compyiid + "";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            //删除对应的二级权限的sql
            if (singleId > 0)
            {
                string sqler = "delete from ws_BackUserCompetence where Type =" + compyiid + "";
                DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sqler, null);
            }
            return singleId;
        }
        /// <summary>
        /// 单一删除第二级权限
        /// </summary>
        /// <param name="comperid">当前二级权限的ID</param>
        /// <returns></returns>
        [WebMethod]
        public static int BtnDiErSingleDel(int comperid)
        {
            int singleId = 0;
            string sql = "";
            sql = "delete from ws_BackUserCompetence where Id =" + comperid + "";
            singleId = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
            return singleId;
        }
    }
}