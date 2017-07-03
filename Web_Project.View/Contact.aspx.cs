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
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebInfo("联系我们");
                Info();
            }
        }
        protected void Info()
        {
            string sql = "select top 1 * from Contact order by AddTime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal2.Text = db.Rows[0]["Content"].ToString();
            }
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}