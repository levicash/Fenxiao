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

namespace Web_Project.View.Contrl
{
    public partial class Foot : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LinkInfo();
            }
        }
        /// <summary>
        /// 网站底部单页
        /// </summary>
        /// <returns></returns>
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
        protected void LinkInfo()
        {
            string sql = "select * from ws_LinkInfo where IsXianShi=1 order by Orders,Id";
            DataSet db = DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
    }
}