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
    public partial class Index : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                Jiaodian();
                NewInfo();
                BannerXiaCe();
                ProInfo();
            }
        }
        protected void Jiaodian()
        {
            string sql = "select * from ws_WapJiaoDian where IsOr=1 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        protected void NewInfo()
        {
            string sql1 = "select top 5 * from ws_NewsInfo where Fis='发布' order by AddTime desc";
            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
            Repeater2.DataSource = db1;
            Repeater2.DataBind();
        }
        /// <summary>
        /// 广告展示
        /// </summary>
        protected void BannerXiaCe()
        {
            string sql = "select top 1 * from ws_Advertising where Id=4 and IsOr=1 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal1.Text = "<a href='" + db.Rows[0]["Address"].ToString() + "'>" + (db.Rows[0]["ImgName"].ToString() == "" ? "<img src='../admin_/Images/no_pic.gif' />" : "<img src='" + ("../admin_/Images/proImg/" + db.Rows[0]["ImgName"].ToString()) + "'/>") + "</a>";
            }
        }
        protected void ProInfo()
        {
            string sql1 = "select top 3 * from ws_ProductInfo where ReXiao='热销' and ShangJia='上架' order by Orders,Id";
            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
            Repeater3.DataSource = db1;
            Repeater3.DataBind();
            string sql2 = "select top 12 * from ws_ProductInfo where XinPin='新品' and ShangJia='上架' order by Orders,Id";
            DataTable db2 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql2, null);
            Repeater4.DataSource = db2;
            Repeater4.DataBind();
        }
        public string ProXinPinPrice(string pid)
        {
            string str = "0.00";
            if (FrontUser.IsAuthenticated)
            {
                string uname = FrontUser.UserName.ToString();//当前登录账户的用户名
                string sql = "select Userlevel from ws_RegisterInfo where Rname='" + uname + "'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    int level = Convert.ToInt32(db.Rows[0][0].ToString());
                    string sql1 = "select Price" + level + " from ws_ProductInfo where Id=" + pid + "";
                    DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
                    if (db1.Rows.Count > 0)
                    {
                        str = db1.Rows[0][0].ToString();
                    }
                }
            }
            else
            {
                str = "登录查看";
            }
            return str;
        }
        protected void WebInfo()
        {
            Page.Header.Title = Web.webInfo();
        }
    }
}