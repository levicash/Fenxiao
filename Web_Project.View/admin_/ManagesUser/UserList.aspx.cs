using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using Web_Project.View.Contrl;
using System.Data;

namespace Web_Project.View.admin_.ManagesUser
{
    public partial class UserList : System.Web.UI.Page
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
                    ShowInfo();
                }
            }
        }
        /// <summary>
        /// 信息绑定
        /// </summary>
        protected void ShowInfo()
        {
            string sql = "";
            sql = "select a.*,b.Title as btitle from ws_BackUserInfo a left join ws_BackUserRole b on a.Type=b.Id where a.Type<>1 order by a.Orders,a.Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
    }
}