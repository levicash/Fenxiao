using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebInfo("客户留言");
                ConInfo();
            }
        }
        protected void ConInfo()
        {
            string sql = "select top 1 * from Contact order by AddTime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal1.Text = db.Rows[0]["Desp"].ToString();
            }
        }
        [WebMethod]
        public static int MessageMethod(string tit, string content, string name, string phone)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string strSql = string.Format("insert into MailInfo(Title,Name,Phone,Content,AddTime,IsHf) values('{0}','{1}','{2}','{3}','{4}',{5})", tit, name, phone, content, date, 1);
            int i = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
            return i;
        }
        [WebMethod]
        public static int SiteMessageMethod(string name, string phone, string content)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string strSql = string.Format("insert into MailInfo(Name,Phone,Content,AddTime) values('{0}','{1}','{2}','{3}')", name, phone, content, date);
            int i = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
            return i;
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}