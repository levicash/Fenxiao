using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.News
{
    public partial class NewsInfo : System.Web.UI.Page
    {
        public int page = 0;
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
                    if (Request["page"] != null)
                    {
                        ViewState["current"] = Request["page"].ToString();
                    }
                    Drop();
                    ShowInfo();
                }
            }
        }
        /// <summary>
        /// 绑定新闻分类
        /// </summary>
        protected void Drop()
        {
            DropDownList1.Items.Clear();
            string sql = "select * from ws_NewsType order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            DropDownList1.DataSource = db;
            DropDownList1.DataTextField = "Title";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();

            ListItem li = new ListItem("--请选择分类", "-1");
            DropDownList1.Items.Insert(0, li);
        }
        /// <summary>
        /// 信息绑定
        /// </summary>
        protected void ShowInfo()
        {
            DBCommon db = new DBCommon();
            string title = txtTitle.Text.Trim();//查询标题
            int type = DropDownList1.SelectedValue == "" ? 0 : Convert.ToInt32(DropDownList1.SelectedValue);//查询分类
            string _orderFid = "AddTime desc";//排序字段
            if (ViewState["current"] != null)
            {
                AspNetPager1.CurrentPageIndex = int.Parse(ViewState["current"].ToString());
                ViewState["current"] = null;
            }
            AspNetPager1.PageSize =15;
            string sqlCount = "select count(*) from ws_NewsInfo where 1=1";//获取总条数
            if (title != "")
            {
                sqlCount += " and Title like '%" + title + "%'";
            }
            if (type > 0)
            {
                sqlCount += " and Type =" + type;
            }
            AspNetPager1.RecordCount = db.GetRowCount1(sqlCount);
            this.Literal1.Text = AspNetPager1.RecordCount.ToString();
            this.pagecurrent.Value = AspNetPager1.CurrentPageIndex.ToString();
            page = Convert.ToInt32(AspNetPager1.CurrentPageIndex.ToString());
            string sqlInfo =
                "select a.*,b.Title as btitle from ws_NewsInfo a left join ws_NewsType b on a.Type=b.Id where 1=1";//具体查询sql
            if (title != "")
            {
                sqlInfo += " and a.Title like '%" + title + "%'";
            }
            if (type > 0)
            {
                sqlInfo += " and a.Type =" + type;
            }
            Repeater1.DataSource = db.GetinfoList1(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, _orderFid, sqlInfo);
            Repeater1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ViewState["current"] = this.pagecurrent.Value;
            ShowInfo();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            ShowInfo();
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            ShowInfo();
        }
    }
}