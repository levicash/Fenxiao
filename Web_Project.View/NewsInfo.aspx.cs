using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class NewsInfo : System.Web.UI.Page
    {
        public int pvid = 0;
        public int nxid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewsShow();
                Info();
            }
        }
        protected void NewsShow()
        {
            string sql = "select * from ws_NewsType order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        protected void Info()
        {
            string sql = "";
            string dtime = "";
            int type = 0;
            if (RouteData.Values["nid"] != null)
            {
                int nid = Convert.ToInt32(RouteData.Values["nid"].ToString());
                sql = "select a.*,b.Title as btitle,b.Id as bid from ws_NewsInfo a left join ws_NewsType b on a.Type=b.Id where a.Id=" + nid + " order by a.AddTime desc";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    WebInfo(db.Rows[0]["Title"].ToString());
                    Literal1.Text = db.Rows[0]["btitle"].ToString();
                    Literal5.Text = db.Rows[0]["AddTime"].ToString() == "" ? "" : Convert.ToDateTime(db.Rows[0]["AddTime"].ToString()).ToShortDateString();
                    Literal4.Text = db.Rows[0]["Title"].ToString();
                    Literal6.Text = db.Rows[0]["Laiyuan"].ToString();
                    Literal7.Text = db.Rows[0]["Desp"].ToString();
                    dtime = db.Rows[0]["AddTime"].ToString();
                    if (db.Rows[0]["Type"].ToString()!="")
                    {
                        type = Convert.ToInt32(db.Rows[0]["Type"].ToString());
                    }
                }
                DataTable db1 = PrvNext.Prv5(dtime, type, "ws_NewsInfo");
                if (db1.Rows.Count > 0)
                {
                    pvid = Convert.ToInt32(db1.Rows[0]["Id"].ToString());
                    string phtml = "<a href='NewsInfo_" + pvid + "_" + type + ".aspx'>" + db1.Rows[0]["Title"].ToString() + "</a>";
                    Label4.Text = phtml;
                }
                else
                {
                    Label4.Text = "没有了";
                }
                DataTable db2 = PrvNext.Next5(dtime, type, "ws_NewsInfo");
                if (db2.Rows.Count > 0)
                {
                    nxid = Convert.ToInt32(db2.Rows[0]["Id"].ToString());
                    Label5.Text = "<a href='NewsInfo_" + nxid + "_" + type + ".aspx'>" + db2.Rows[0]["Title"].ToString() + "</a>";
                }
                else
                {
                    Label5.Text = "没有了";
                }
            }
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}