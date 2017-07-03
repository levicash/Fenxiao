using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_
{
    public partial class editpwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "code", "<script language=javascript>top.location='login.aspx'</script>");
                }
                else
                {
                    //获取用户名
                    Literal1.Text = AdminInfo.UserName;
                }
            }
        }
        [WebMethod]
        public static int EditPwd(string pwd)
        {
            string uid = AdminInfo.UserID.ToString();
            string strSql = "update ws_BackUserInfo set Pwd='" + pwd + "' where Id=" + uid + "";
            int row = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
            return row;
        }
    }
}