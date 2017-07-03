using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Product
{
    public partial class ProAdver : System.Web.UI.Page
    {
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
            string sql = "select * from ws_ProType where Type=0 order by Orders,Id";
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
            string sql = "select a.*,b.Title as btitle from ws_ProAdver a left join ws_ProType b on a.Type=b.Id order by b.Orders,b.Id,a.Orders,a.Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
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