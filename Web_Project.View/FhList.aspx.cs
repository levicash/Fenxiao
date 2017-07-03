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
    public partial class FhList : System.Web.UI.Page
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
                WebInfo("订单详情");
                BuyListMethod();
            }
        }

        protected void BuyListMethod()
        {
            if (RouteData.Values["oid"] != null)
            {
                string uname = FrontUser.UserName.ToString();
                int oid = Convert.ToInt32(RouteData.Values["oid"].ToString());
                string sqlOrder = "select * from ws_OrderList where TuiJianRen='" + uname + "' and Id=" + oid + "";
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
        /// <summary>
        /// 返回
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (RouteData.Values["pid"] != null)
            {
                int page = Convert.ToInt32(RouteData.Values["pid"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='FaHuo.aspx?page=" + page + "'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='FaHuo.aspx'</script>");
            }
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}