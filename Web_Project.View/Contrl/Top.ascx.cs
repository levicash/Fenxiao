using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.Contrl
{
    public partial class Top : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyCartCountMethod();
                ProDaoHang();
            }
        }

        protected void MyCartCountMethod()
        {
            if (FrontUser.IsAuthenticated)
            {
                string uname = FrontUser.UserName.ToString();
                string sql = "select count(*) from ws_BuyProList where Rname='" + uname + "' and IsOrder=2";
                Literal1.Text = DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null).ToString();
            }
            else
            {
                Literal1.Text = "0";
            }
        }

        protected void ProDaoHang()
        {
            string sql = "select top 7 * from ws_ProType where IsDaoHang=1 order by Orders,Id";
            DataSet db = DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
    }
}