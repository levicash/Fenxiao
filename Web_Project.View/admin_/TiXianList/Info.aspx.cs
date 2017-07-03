using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using Web_Project.View.Contrl;

namespace Web_Project.View.admin_.TiXianList
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Pager1.binddata += new Pager.ShowDelegate2(ShowInfo);
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                }
            }
        }
        protected void ShowInfo()
        {
            string sqlCount = "";//获取总条数
            string sqlInfo = "";//具体查询sql
            string title = txtTitle.Text.Trim();
            sqlCount = "select count(*) from ws_TiXianInfo where 1=1";//获取总条数
            sqlInfo = "select a.*,b.KaHao as bkahao,b.KaiHuHang as bkaihuhang,b.KaiHuRen as bkaihuren from ws_TiXianInfo a left join ws_RegisterInfo b on a.Uname=b.Rname where 1=1";
            if (title != "")
            {
                sqlCount += " and Uname='" + title + "'";
                sqlInfo += " and a.Uname='" + title + "'";
            }
            Pager1._pagesize = 12;//每页显示的条数
            Pager1._orderFid = "sp.AddTime desc";//排序字段
            Pager1._RowCountSql = sqlCount;//获取总条数
            Pager1._InfoSql = sqlInfo;//具体查询sql
            Repeater1.DataSource = Pager1.PageInfo();
            Repeater1.DataBind();
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