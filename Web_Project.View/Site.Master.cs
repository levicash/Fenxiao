using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class Site : System.Web.UI.MasterPage
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
                    //Literal1.Text = db.Rows[0]["webFoot"].ToString() == "" ? "" : db.Rows[0]["webFoot"].ToString();
                }
                HtmlMeta metaKeyWords = new HtmlMeta();
                HtmlMeta metaDescription = new HtmlMeta();
                metaKeyWords.Name = "Keywords";
                metaKeyWords.Content = webKey;
                metaDescription.Name = "description";
                metaDescription.Content = webDes;
                head.Controls.Add(metaKeyWords);
                head.Controls.Add(metaDescription);//Header1是head的id
                //Jiaodian();
                //AbType();
                //NewsShow();
                //ProType();
                //CaseType();
                //ConInfo();
                //LinkInfo();
            }
        }
        //protected void Jiaodian()
        //{
        //    string sql = "select * from JiaoDian where IsOr=1 order by Orders,Id";
        //    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
        //    Repeater4.DataSource = db;
        //    Repeater4.DataBind();
        //}
        //protected void AbType()
        //{
        //    string sql = "select * from AboutUsType order by Orders,Id";
        //    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
        //    Repeater10.DataSource = db;
        //    Repeater10.DataBind();
        //    Repeater1.DataSource = db;
        //    Repeater1.DataBind();
        //}
        //protected void NewsShow()
        //{
        //    string sql = "select * from NewsType order by Orders,Id";
        //    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
        //    Repeater5.DataSource = db;
        //    Repeater5.DataBind();
        //}

        //protected void ProType()
        //{
        //    string sql = "select * from ProType where Type=0 order by Orders,Id";
        //    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
        //    Repeater8.DataSource = db;
        //    Repeater8.DataBind();
        //    string sql1 = "select top 5 * from ProType where Type=0 order by Orders,Id";
        //    DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, sql1, null);
        //    Repeater2.DataSource = db1;
        //    Repeater2.DataBind();
        //}
        //protected void CaseType()
        //{
        //    string sql = "select * from CaseType order by Orders,Id";
        //    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, sql, null);
        //    Repeater9.DataSource = db;
        //    Repeater9.DataBind();
        //}
        //protected void ConInfo()
        //{
        //    string sql = "select top 1 * from Contact order by AddTime desc";
        //    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, sql, null);
        //    if (db.Rows.Count > 0)
        //    {
        //        Literal2.Text = db.Rows[0]["Desp"].ToString();
        //    }
        //}
        //protected void LinkInfo()
        //{
        //    string sql = "select * from LinkInfo where IsOr=1 order by Orders,Id";
        //    DataSet db = DBHelpers.ExecuteDataSet(DBHelpers.conn, sql, null);
        //    Repeater2.DataSource = db;
        //    Repeater2.DataBind();
        //}
    }
}