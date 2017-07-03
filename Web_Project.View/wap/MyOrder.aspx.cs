using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Web_Project.Core;
using Web_Project.Data;

namespace Web_Project.View.wap
{
    public partial class MyOrder : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                string strSql = "select * from ws_WebInfo";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    webKey = db.Rows[0]["webKey"].ToString() == "" ? "" : db.Rows[0]["webKey"].ToString();
                    webDes = db.Rows[0]["webDep"].ToString() == "" ? "" : db.Rows[0]["webDep"].ToString();
                }
                HtmlMeta metaKeyWords = new HtmlMeta();
                HtmlMeta metaDescription = new HtmlMeta();
                metaKeyWords.Name = "Keywords";
                metaKeyWords.Content = webKey;
                metaDescription.Name = "description";
                metaDescription.Content = webDes;
                Header.Controls.Add(metaKeyWords);
                Header.Controls.Add(metaDescription);//Header1是head的id
                WebInfo();
            }
        }
        public static List<OrderListCore> OrderList()
        {
            string sql = "";
            string uname = FrontUser.UserName.ToString();
            List<OrderListCore> list = new List<OrderListCore>();
            if (System.Web.HttpContext.Current.Request["oid"] != null)
            {
                string oid = System.Web.HttpContext.Current.Request["oid"].ToString();
                if (oid=="1")
                {
                    //已发货
                    sql = "select * from ws_OrderList where Rname='" + uname + "' and IsFaHuo=1 order by AddTime desc";
                }
                if (oid == "2")
                {
                    //未发货
                    sql = "select * from ws_OrderList where Rname='" + uname + "' and IsFaHuo=2 order by AddTime desc";
                }
            }
            else
            {
                sql = "select * from ws_OrderList where Rname='" + uname + "' order by AddTime desc";
            }

            SqlDataReader dataReader;
            try
            {
                dataReader = DBHelpers.ExecuteReader(DBHelpers.conn, CommandType.Text, sql, null);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            while (dataReader.Read())
            {
                OrderListCore typeCore = new OrderListCore();
                typeCore.OrderId = dataReader["OrderId"].ToString();
                typeCore.Znum = Convert.ToInt32(dataReader["Znum"].ToString());
                typeCore.Zjiage = Convert.ToDecimal(dataReader["Zjiage"].ToString());
                typeCore.IsFaHuo = Convert.ToInt32(dataReader["IsFaHuo"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        public static List<BuyListViewCore> BuyListViewMethod(string orderId)
        {
            List<BuyListViewCore> list = new List<BuyListViewCore>();
            string sql = "select * from BuyListView where OrderId='" + orderId + "' order by AddTime desc";
            SqlDataReader dataReader;
            try
            {
                dataReader = DBHelpers.ExecuteReader(DBHelpers.conn, CommandType.Text, sql, null);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            while (dataReader.Read())
            {
                BuyListViewCore typeCore = new BuyListViewCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.ImgName = dataReader["ImgName"].ToString();
                typeCore.DanJia = Convert.ToDecimal(dataReader["DanJia"].ToString());
                typeCore.Num = Convert.ToInt32(dataReader["Num"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        protected void WebInfo()
        {
            Page.Header.Title = Web.webInfo();
        }
    }
}