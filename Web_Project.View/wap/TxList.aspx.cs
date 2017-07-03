using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.wap
{
    public partial class TxList : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                string strSql = "select * from ws_WebInfo";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    webKey = db.Rows[0]["webKey"].ToString() == "" ? "" : db.Rows[0]["webKey"].ToString();
                    webDes = db.Rows[0]["webDep"].ToString() == "" ? "" : db.Rows[0]["webDep"].ToString();
                }
                HtmlMeta metaKeyWords = new HtmlMeta();
                HtmlMeta metaDescription = new HtmlMeta();
                metaKeyWords.Name = "Keywords";
                metaKeyWords.Content = webKey;
                metaDescription.Name = "description";
                metaDescription.Content = webDes;
                Header.Controls.Add(metaKeyWords);
                Header.Controls.Add(metaDescription);//Header1是head的id
                WebInfo();
                string uname = FrontUser.UserName.ToString();
                TiXianZong(uname);
                TiXianInfo(uname);
            }
        }
        protected void TiXianZong(string uname)
        {
            string sqlInfo = "select sum(HouMoney) as sjiner from ws_TiXianInfo where Uname='" + uname + "'";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo, null);
            if (db.Rows.Count > 0)
            {
                Literal1.Text = db.Rows[0]["sjiner"].ToString() == "" ? "0" : db.Rows[0]["sjiner"].ToString();
            }
            string sqlInfo1 = "select sum(HouMoney) as sjiner from ws_TiXianInfo where Uname='" + uname + "' and ShenHe=1";
            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo1, null);
            if (db1.Rows.Count > 0)
            {
                Literal2.Text = db1.Rows[0]["sjiner"].ToString() == "" ? "0" : db1.Rows[0]["sjiner"].ToString();
            }
            string sqlInfo2 = "select sum(HouMoney) as sjiner from ws_TiXianInfo where Uname='" + uname + "' and ShenHe=2";
            DataTable db2 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo2, null);
            if (db2.Rows.Count > 0)
            {
                Literal3.Text = db2.Rows[0]["sjiner"].ToString() == "" ? "0" : db2.Rows[0]["sjiner"].ToString();
            }
        }
        protected void TiXianInfo(string uname)
        {
            string sql1 = "select * from ws_TiXianInfo where Uname='" + uname + "' order  by AddTime desc";
            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
            Repeater1.DataSource = db1;
            Repeater1.DataBind();
        }
        protected void WebInfo()
        {
            Page.Header.Title = Web.webInfo();
        }
    }
}