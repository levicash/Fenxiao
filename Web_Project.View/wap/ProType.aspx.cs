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
    public partial class ProType : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                WebInfo("产品分类");
                RepProType();
            }
        }
        protected void RepProType()
        {
            string sql = "select * from ws_ProType where Type=0 and IsXianShi=1 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        public static List<ProTypeCore> GetProType()
        {
            List<ProTypeCore> list = new List<ProTypeCore>();
            string sql = "select * from ws_ProType where Type=0 and IsXianShi=1 order by Orders,Id";
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
                ProTypeCore typeCore = new ProTypeCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        public static List<ProTypeCore> GetProType1(int pid)
        {
            List<ProTypeCore> list = new List<ProTypeCore>();
            string sql = "select * from ws_ProType where Type=" + pid + " and IsXianShi=1 order by Orders,Id";
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
                ProTypeCore typeCore = new ProTypeCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.ImgName = dataReader["ImgName"].ToString();
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}