using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Core;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class Single : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowInfo();
            }
        }
        public static List<SingleTypeCore> SingleTypeMethod()
        {
            List<SingleTypeCore> list = new List<SingleTypeCore>();
            string sql = "select * from ws_SingleType where IsXianShi=1 order by Orders,Id";
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
                SingleTypeCore typeCore = new SingleTypeCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        public static List<SingleInfoCore> SingleInfoMethod(int pid)
        {
            List<SingleInfoCore> list = new List<SingleInfoCore>();
            string sql = "select * from ws_SingleInfo where Type=" + pid + " and IsXianShi=1 order by Orders,Id";
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
                SingleInfoCore typeCore = new SingleInfoCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        protected void ShowInfo()
        {
            if (RouteData.Values["sid"] != null)
            {
                int sid = Convert.ToInt32(RouteData.Values["sid"].ToString());
                string sql = "select * from ws_SingleInfo where Id=" + sid + " order by AddTime desc";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal1.Text = db.Rows[0]["Title"].ToString();
                    Literal2.Text = db.Rows[0]["Desp"].ToString();
                    WebInfo(db.Rows[0]["Title"].ToString());
                }
            }
            else
            {
                string sql = "select top 1 * from ws_SingleInfo order by Orders,Id";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal1.Text = db.Rows[0]["Title"].ToString();
                    Literal2.Text = db.Rows[0]["Desp"].ToString();
                    WebInfo(db.Rows[0]["Title"].ToString());
                }
            }
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}