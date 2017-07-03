using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Company
{
    public partial class AInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script language=javascript>top.location='../login.aspx'</script>");
                }
                else
                {
                    ShowInfo();
                }
            }
        }
        protected void ShowInfo()
        {
            string strSql = "select count(*) from [ws_RegisterInfo] where UserType='公司账号'";
            int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql, null));
            if (count == 1)
            {
                string sql = "select top 1 * from [ws_RegisterInfo] where UserType='公司账号' order by AddTime desc";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    TextBox8.Text = db.Rows[0]["Rname"].ToString();
                }
            }
        }
        #region 密码加密
        /// <summary>
        /// 传入明文，返回用MD5加密后的字符串
        /// </summary>
        /// <param name="str">要加密的字符串</param>
        /// <returns>用MD5加密后的字符串</returns>
        public static string ToMD5(string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "md5");
        }
        #endregion
        /// <summary>
        /// 提交
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string uname = TextBox8.Text.Trim();
                string upass = txtPassWord.Text.Trim();
                string erjipass = TextBox1.Text.Trim();
                string strSql2 = "select count(*) from [ws_RegisterInfo] where UserType='公司账号'";
                int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql2, null));
                if (count == 1)
                {
                    string sql = "update [ws_RegisterInfo] set Rname='" + uname + "'";
                    if (upass != "")
                    {
                        sql += ",Rpass='" + ToMD5(upass) + "'";
                    }
                    if (erjipass != "")
                    {
                        sql += ",ErJiPass='" + ToMD5(erjipass) + "'";
                    }
                    sql += " where UserType='公司账号'";

                    int iu = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                    if (iu > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改成功');window.location='AInfo.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AInfo.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "",
                                                   "<script>alert('出现错误，请重试');window.location='AInfo.aspx'</script>");
            }

        }
    }
}