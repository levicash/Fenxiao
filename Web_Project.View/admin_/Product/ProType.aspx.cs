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
    public partial class ProType : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script language=javascript>top.location='../login.aspx'</script>");
                }
                else
                {
                    //Repeater绑定
                    string sql = "select * from ws_ProType order by Orders,Id";
                    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                    DataColumn dc = new DataColumn("Id", typeof(Int32));
                    DataColumn dc1 = new DataColumn("Title", typeof(string));
                    DataColumn dc2 = new DataColumn("Orders", typeof(Int32));
                    DataColumn dc3 = new DataColumn("AddTime", typeof(DateTime));
                    DataColumn dc4 = new DataColumn("ImgName", typeof(string));
                    DataColumn dc5 = new DataColumn("IsXianShi", typeof(Int32));
                    DataColumn dc6 = new DataColumn("IsDaoHang", typeof(Int32));
                    table.Columns.Add(dc);
                    table.Columns.Add(dc1);
                    table.Columns.Add(dc2);
                    table.Columns.Add(dc3);
                    table.Columns.Add(dc4);
                    table.Columns.Add(dc5);
                    table.Columns.Add(dc6);
                    RepeaterDigui(db, repProduct, 0, "", 0);
                }
            }
        }
        /// <summary>
        /// Repeater递归
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="rep"></param>
        /// <param name="typeId"></param>
        /// <param name="str"></param>
        /// <param name="length"></param>
        protected void RepeaterDigui(DataTable dt, Repeater rep, int typeId, string str, int length)
        {
            DataRow[] rows = dt.Select("Type='" + typeId + "'");
            string str_;
            for (int i = 0; i < rows.Length; i++)
            {
                if (typeId == 0)
                {
                    str_ = "";
                }
                else
                {
                    str_ = "├";
                }
                DataRow row = table.NewRow();
                row["Id"] = rows[i]["Id"];
                row["Title"] = Space(length) + str_ + rows[i]["Title"];
                row["Orders"] = rows[i]["Orders"];
                row["AddTime"] = rows[i]["AddTime"];
                row["ImgName"] = rows[i]["ImgName"];
                row["IsXianShi"] = rows[i]["IsXianShi"];
                row["IsDaoHang"] = rows[i]["IsDaoHang"];
                table.Rows.Add(row);
                rep.DataSource = table;
                rep.DataBind();
                RepeaterDigui(dt, rep, Convert.ToInt32(rows[i]["Id"]), str_, length + 1);
            }
        }
        public string Space(int length)
        {
            string temp = "";
            for (int i = 0; i < length; i++)
            {
                temp += "　";  ////注意这里的空白是智能abc输入法状态下的v11字符；
            }
            return temp;
        }
    }
}