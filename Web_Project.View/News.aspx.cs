using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using Web_Project.View.Contrl;

namespace Web_Project.View
{
    public partial class News : System.Web.UI.Page
    {
        public int nwid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Pager1.binddata += new Pager.ShowDelegate2(NInfo);
            if (!IsPostBack)
            {
                NewsShow();
                NInfo();
            }
        }
        protected void NewsShow()
        {
            string sql = "select * from ws_NewsType order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        protected void NInfo()
        {
            string sqlCount = "";//获取总条数
            string sqlInfo = "";//具体查询sql
            if (RouteData.Values["nid"] != null)
            {
                int nid = Convert.ToInt32(RouteData.Values["nid"].ToString());
                sqlInfo = "select a.*,b.Id as bid,b.Title as btitle from ws_NewsInfo a left join ws_NewsType b on a.Type=b.Id where a.Type=" + nid + " and a.Fis='发布'";
                sqlCount =
                    "select count(*) from ws_NewsInfo where Type=" + nid + " and Fis='发布'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlInfo, null);
                if (db.Rows.Count > 0)
                {
                    Literal1.Text = db.Rows[0]["btitle"].ToString();
                    WebInfo(db.Rows[0]["btitle"].ToString());
                }
            }
            else
            {
                sqlInfo = "select * from NewsInfo where Fis='发布'";
                sqlCount =
                    "select count(*) from ws_NewsInfo where Fis='发布'";
                Literal1.Text = "新闻资讯";
                WebInfo("新闻资讯");
            }
            Pager1._pagesize = 25;//每页显示的条数
            Pager1._orderFid = "sp.AddTime desc";//排序字段
            Pager1._RowCountSql = sqlCount;//获取总条数
            Pager1._InfoSql = sqlInfo;//具体查询sql
            Repeater2.DataSource = Pager1.PageInfo();
            Repeater2.DataBind();
        }
        protected string Html(string name)
        {
            return ClearHtml.clearHtml1(name);
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}