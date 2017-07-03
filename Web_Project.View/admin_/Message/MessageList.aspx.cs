using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Message
{
    public partial class MessageList : System.Web.UI.Page
    {
        public int page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            //PagedDataSource pdsList = new PagedDataSource();
            //string sql = "";
            //string title = txtTitle.Text.ToString();
            //if (title != "")
            //{
            //    sql = "select * from MailInfo where Title like '%" + title + "%' order by AddTime desc";
            //}
            //else
            //{
            //    sql = "select * from MailInfo order by  AddTime desc";
            //}
            //if (ViewState["current"] != null)
            //{
            //    AspNetPager1.CurrentPageIndex = int.Parse(ViewState["current"].ToString());
            //    ViewState["current"] = null;
            //}
            //pdsList.DataSource = OnPage.getInfo(sql).Tables[0].DefaultView;
            //pdsList.AllowPaging = true;//数据源允许分页
            //this.AspNetPager1.PageSize = 20;
            //pdsList.PageSize = this.AspNetPager1.PageSize;//取控件的分页大小
            //pdsList.CurrentPageIndex = this.AspNetPager1.CurrentPageIndex - 1;//显示当前页
            //pagecurrent.Value = this.AspNetPager1.CurrentPageIndex.ToString();
            //page = Convert.ToInt32(this.AspNetPager1.CurrentPageIndex.ToString());
            ////设置控件)
            //this.AspNetPager1.RecordCount = OnPage.getInfo(sql).Tables[0].Rows.Count;//记录总数
            //Literal1.Text = OnPage.getInfo(sql).Tables[0].Rows.Count.ToString();
            //this.repProInfo.DataSource = pdsList;
            //this.repProInfo.DataBind();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            ShowInfo();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            ViewState["current"] = this.pagecurrent.Value;
            ShowInfo();
        }
    }
}