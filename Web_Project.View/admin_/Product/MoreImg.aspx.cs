using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using System.Data;

namespace Web_Project.View.admin_.Product
{
    public partial class MoreImg : System.Web.UI.Page
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
                    GetTitle();
                    ShowInfo();
                }
            }
        }

        protected void GetTitle()
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                string sql = "select Title from ws_ProductInfo where Id=" + id;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal2.Text = db.Rows[0][0].ToString();
                }
            }
        }

        /// <summary>
        /// 信息绑定
        /// </summary>
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                string sql = "select a.*,b.Title as bname from ws_MoreImgInfo a left join ws_ProductInfo b on a.Type=b.Id where a.Type=" + id + " order by a.Orders,a.Id";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                repProduct.DataSource = db;
                repProduct.DataBind();
            }
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "",
                    "<script language=javascript>window.location='AddMoreImg.aspx?id=" + id + "'</script>");
            }
        }
    }
}