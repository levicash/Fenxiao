using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using System.Data;

namespace Web_Project.View.admin_.OrderList
{
    public partial class OrderInfo : System.Web.UI.Page
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
                    OrderInfoMethod();
                }
            }
        }

        protected void OrderInfoMethod()
        {
            if (Request["oid"] != null)
            {
                string oid = Request["oid"].ToString();
                Literal1.Text = "<span style='color:red;font-weight: bold;'>" + oid + "</span>";
                string sql = "select * from ws_OrderList where OrderId='" + oid + "'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal2.Text = db.Rows[0]["IsFaHuo"].ToString() == "1"
                        ? "<span style='color:red;font-weight: bold;'>已发货</span>"
                        : "<span style='color:red;font-weight: bold;'>未发货</span>";
                }
                string sql1 = "select a.* ,a.DanJia*a.Num as Zprice,b.Title as btitle from ws_BuyProList a left join ws_ProductInfo b on a.Pid=b.Id where a.OrderId='" + oid + "' order by a.AddTime desc";
                DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
                Repeater1.DataSource = db1;
                Repeater1.DataBind();
            }
            if (Request["rname"] != null)
            {
                string rname = Request["rname"].ToString();
                string sql = "select * from ws_RegisterInfo where Rname='" + rname + "'";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal3.Text = "<span style='color:red;font-weight: bold;'>" + db.Rows[0]["Uname"].ToString() + "</span>";
                    Literal4.Text = "<span style='color:red;font-weight: bold;'>" + db.Rows[0]["Address"].ToString() + "</span>";
                }
            }
        }
    }
}