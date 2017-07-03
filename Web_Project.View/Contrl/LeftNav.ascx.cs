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
    public partial class LeftNav : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 首页获取产品分类
        /// </summary>
        /// <returns></returns>
        public static List<ProTypeCore> ProType()
        {
            List<ProTypeCore> list = new List<ProTypeCore>();
            string sql = "select * from ws_ProType where Type=0 order by Orders,Id";
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
        public static List<ProTypeCore> ProType1(int pid)
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
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        public static List<ProductInfoCore> ProductInfoMethod(int pid)
        {
            List<ProductInfoCore> list = new List<ProductInfoCore>();
            string sql = "select top 10 * from ws_ProductInfo where Type=" + pid + " and ShangJia='上架' order by Orders,Id";
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
                ProductInfoCore typeCore = new ProductInfoCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
    }
}