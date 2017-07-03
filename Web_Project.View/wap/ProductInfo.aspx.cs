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
    public partial class ProductInfo : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        public int prid = 0;
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
                ProMoreImgMethod();
                Info();
            }
        }
        protected void ProMoreImgMethod()
        {
            if (Request["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"].ToString());
                string sql = "select * from ws_MoreImgInfo where Type=" + pid + " order by Orders,Id";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                Repeater1.DataSource = db;
                Repeater1.DataBind();
            }
        }
        protected void Info()
        {
            string sql = "";
            int order = 0;
            int type = 0;
            if (Request["id"] != null)
            {
                prid = Convert.ToInt32(Request["id"].ToString());
                int pid = Convert.ToInt32(Request["id"].ToString());
                sql = "select a.*,b.Title as bname from ws_ProductInfo a left join ws_ProType b on a.Type=b.Id where a.Id=" + pid + " order by b.Orders,a.Orders";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal1.Text = Literal4.Text = db.Rows[0]["Title"].ToString();
                    Literal2.Text = Literal5.Text = ProXinPinPrice(pid.ToString());
                    Literal3.Text = db.Rows[0]["Desp"].ToString();
                    Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "../admin_/Images/no_pic.gif" : ("../admin_/Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                }
            }
        }
        public string ProXinPinPrice(string pid)
        {
            string str = "0.00";
            if (FrontUser.IsAuthenticated)
            {
                string uname = FrontUser.UserName.ToString();//当前登录账户的用户名
                //int uid = FrontUser.RegisterInfoId(uname);//当前登录账户的ID
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