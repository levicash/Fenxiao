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
    public partial class OrdList1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                BuyListMethod();
            }
        }

        protected void BuyListMethod()
        {
            if (Request["oid"] != null)
            {
                string uname = FrontUser.UserName.ToString();
                int oid = Convert.ToInt32(Request["oid"].ToString());
                string sqlOrder = "select * from ws_OrderList where Rname='" + uname + "' and Id=" + oid + "";
                DataTable dbOrder = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlOrder, null);
                if (dbOrder.Rows.Count > 0)
                {
                    string orderId = dbOrder.Rows[0]["OrderId"].ToString();
                    Literal1.Text = orderId;
                    Literal2.Text = dbOrder.Rows[0]["IsFaHuo"].ToString() == "1" ? "已发货" : "未发货";
                    Literal3.Text = dbOrder.Rows[0]["KdDanhao"].ToString();
                    Literal4.Text = dbOrder.Rows[0]["KdGongsi"].ToString();
                    string sql = "select a.*,a.DanJia*a.Num as Zprice,b.Title as btitle,b.ImgName as bimgname from ws_BuyProList a left join ws_ProductInfo b on a.Pid=b.Id where a.OrderId='" + orderId + "' order by a.AddTime desc";
                    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                    Repeater1.DataSource = db;
                    Repeater1.DataBind();
                }

            }
        }
    }
}