using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.TiXian
{
    public partial class TiXian : System.Web.UI.Page
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
                    ShowInfo();
                }
            }
        }
        /// <summary>
        /// 信息绑定
        /// </summary>
        protected void ShowInfo()
        {
            DBCommon db = new DBCommon();
            string title = txtTitle.Text.Trim();//查询标题
            string czname = TextBox2.Text.Trim();
            string _orderFid = "AddTime desc";//排序字段
            if (ViewState["current"] != null)
            {
                AspNetPager1.CurrentPageIndex = int.Parse(ViewState["current"].ToString());
                ViewState["current"] = null;
            }
            AspNetPager1.PageSize = 15;

            string sqlCount = "select count(*)  from ws_TiXianInfo a left join ws_RegisterInfo b on a.Uname=b.Rname where 1=1";//获取总条数
            string sqlInfo =
                "select a.*,b.Uname as buname,b.KaHao,b.KaiHuHang,b.KaiHuRen from ws_TiXianInfo a left join ws_RegisterInfo b on a.Uname=b.Rname where 1=1";//具体查询sql
            if (title != "")
            {
                sqlCount += " and a.Rname like '%" + title + "%'";
                sqlInfo += " and a.Rname like '%" + title + "%'";
            }
            if (czname != "")
            {
                sqlCount += " and b.Uname like '%" + czname + "%'";
                sqlInfo += " and b.Uname like '%" + czname + "%'";
            }
            AspNetPager1.RecordCount = db.GetRowCount1(sqlCount);
            this.Literal1.Text = AspNetPager1.RecordCount.ToString();
            this.pagecurrent.Value = AspNetPager1.CurrentPageIndex.ToString();
            page = Convert.ToInt32(AspNetPager1.CurrentPageIndex.ToString());

            Repeater1.DataSource = db.GetinfoList1(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, _orderFid, sqlInfo);
            Repeater1.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            ShowInfo();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ViewState["current"] = this.pagecurrent.Value;
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