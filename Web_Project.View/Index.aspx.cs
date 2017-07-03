using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Web_Project.Core;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class Index1 : System.Web.UI.Page
    {
        public string webKey = "";
        public string webDes = "";
        string str = "";
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
                WebInfo();
                Jiaodian();
                BannerXiaCe();
                NewsInfo();
                ProXinPinInfo();
                YiLouShangMethod();
            }
        }
        /// <summary>
        /// 首页获取产品分类
        /// </summary>
        /// <returns></returns>
        public static List<ProTypeCore> ProType()
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
        /// <summary>
        /// 获取焦点图
        /// </summary>
        protected void Jiaodian()
        {
            string sql = "select * from ws_JiaoDian where IsOr=1 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        /// <summary>
        /// banner下方2个广告展示
        /// </summary>
        protected void BannerXiaCe()
        {
            string sql = "select top 1 * from ws_Advertising where Id=2 and IsOr=1 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal1.Text = "<a href='" + db.Rows[0]["Address"].ToString() + "'>" + (db.Rows[0]["ImgName"].ToString() == "" ? "<img src='admin_/Images/no_pic.gif' />" : "<img src='" + ("admin_/Images/proImg/" + db.Rows[0]["ImgName"].ToString()) + "'/>") + "</a>";
            }
            string sql2 = "select top 1 * from ws_Advertising where Id=1 and IsOr=1 order by Orders,Id";
            DataTable db2 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql2, null);
            if (db2.Rows.Count > 0)
            {
                Literal2.Text = "<a href='" + db2.Rows[0]["Address"].ToString() + "'>" + (db2.Rows[0]["ImgName"].ToString() == "" ? "<img src='admin_/Images/no_pic.gif' />" : "<img src='" + ("admin_/Images/proImg/" + db2.Rows[0]["ImgName"].ToString()) + "'/>") + "</a>";
            }
        }
        /// <summary>
        /// 公告信息等展示
        /// </summary>
        protected void NewsInfo()
        {
            string sql1 = "select top 9 * from ws_NewsInfo where Type=5 and Fis='发布' order by AddTime desc";
            DataSet db1 = DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql1, null);
            Repeater2.DataSource = db1;
            Repeater2.DataBind();
            string sql2 = "select top 9 * from ws_NewsInfo where Type=1 and Fis='发布' order by AddTime desc";
            DataSet db2 = DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql2, null);
            Repeater3.DataSource = db2;
            Repeater3.DataBind();
        }
        /// <summary>
        /// 首页新品产品展示
        /// </summary>
        protected void ProXinPinInfo()
        {
            string sqlTui = "select top 6 * from ws_ProductInfo where XinPin='新品' and ShangJia='上架' order by Orders,Id";
            DataTable dbTui = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlTui, null);
            Repeater4.DataSource = dbTui;
            Repeater4.DataBind();
        }

        //public string ProXinPinPrice(string pid)
        //{
        //    string str = "0.00";
        //    if (FrontUser.IsAuthenticated)
        //    {
        //        string uname = FrontUser.UserName.ToString();//当前登录账户的用户名
        //        //int uid = FrontUser.RegisterInfoId(uname);//当前登录账户的ID
        //        string sql = "select Userlevel from ws_RegisterInfo where Rname='" + uname + "'";
        //        DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
        //        if (db.Rows.Count > 0)
        //        {
        //            int level = Convert.ToInt32(db.Rows[0][0].ToString());
        //            string sql1 = "select Price" + level + " from ws_ProductInfo where Id=" + pid + "";
        //            DataTable db1 = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql1, null);
        //            if (db1.Rows.Count > 0)
        //            {
        //                str = db1.Rows[0][0].ToString();
        //            }
        //        }
        //    }
        //    else
        //    {
        //        str = "登录查看";
        //    }
        //    return str;
        //}

        /// <summary>
        /// 1F上方广告展示
        /// </summary>
        protected void YiLouShangMethod()
        {
            string sql = "select top 1 * from ws_Advertising where Id=3 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (db.Rows.Count > 0)
            {
                Literal3.Text = "<a href='" + db.Rows[0]["Address"].ToString() + "'>" + (db.Rows[0]["ImgName"].ToString() == "" ? "<img src='admin_/Images/no_pic.gif' />" : "<img src='" + ("admin_/Images/proImg/" + db.Rows[0]["ImgName"].ToString()) + "'/>") + "</a>";
            }
        }
        /// <summary>
        /// 首页获取产品分类
        /// </summary>
        /// <returns></returns>
        public static List<ProTypeCore> ProTypeYiJiMethod()
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
            int num = 1;
            while (dataReader.Read())
            {
                ProTypeCore typeCore = new ProTypeCore();
                typeCore.Title = dataReader["Title"].ToString();
                typeCore.Id = Convert.ToInt32(dataReader["Id"].ToString());
                typeCore.Num = num++;
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        public static List<ProTypeCore> ProTypeErJiMethod(int pid)
        {
            List<ProTypeCore> list = new List<ProTypeCore>();
            string sql = "select top 6 * from ws_ProType where Type=" + pid + " and IsXianShi=1 order by Orders,Id";
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
        /// <summary>
        /// 楼层中间精品部分
        /// </summary>
        /// <param name="pid"></param>
        /// <param name="tuijian"></param>
        /// <returns></returns>
        public static List<ProductInfoCore> ProductInfoMethod(int pid, string tuijian)
        {
            List<ProductInfoCore> list = new List<ProductInfoCore>();
            string sql = "select top 6 * from ws_ProductInfo where Type=" + pid + " and JingPin='" + tuijian + "' and ShangJia='上架' order by Orders,Id";
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
                typeCore.Type = Convert.ToInt32(dataReader["Type"].ToString());
                typeCore.ImgName = dataReader["ImgName"].ToString();
                typeCore.XPrice = Convert.ToDecimal(dataReader["XPrice"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        /// <summary>
        /// 楼层右侧热销部分
        /// </summary>
        /// <param name="pid"></param>
        /// <param name="tuijian"></param>
        /// <returns></returns>
        public List<ProductInfoCore> ProductInfoYouMethod(int pid, string tuijian)
        {
            str = "";
            List<ProductInfoCore> list = new List<ProductInfoCore>();
            //绑定数据
            DataTable dt = GetClassList("").Tables[0];
            DataRow[] drs = dt.Select("Type= " + pid);
            for (int i = 0; i < drs.Length; i++)
            {
                int classid = Convert.ToInt32(drs[i]["Id"].ToString());
                int sonparentid = classid;
                //递归子分类方法
                BindDrpNode(sonparentid, dt);
            }
            string sql = "select top 3 * from ws_ProductInfo where ReXiao='" + tuijian + "' and ShangJia='上架' ";
            if (str != "")
            {
                string str1 = pid + "," + str;
                sql += "and Type in (" + (str1.TrimEnd(',')) + ")";
            }
            else
            {
                sql += "and Type=" + pid + "";
            }
            sql += " order by Orders,Id";
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
                typeCore.Type = Convert.ToInt32(dataReader["Type"].ToString());
                typeCore.ImgName = dataReader["ImgName"].ToString();
                typeCore.XPrice = Convert.ToDecimal(dataReader["XPrice"].ToString());
                //typeCore.ShiChangJia = Convert.ToDecimal(dataReader["ShiChangJia"].ToString());
                list.Add(typeCore);
            }
            dataReader.Close();
            dataReader.Dispose();
            return list;
        }
        /// <summary>
        /// 绑定子分类
        /// </summary>
        /// <param name="parentid"></param>
        /// <param name="dt"></param>
        private void BindDrpNode(int parentid, DataTable dt)
        {
            DataRow[] drs = dt.Select("Type= " + parentid + "");
            str += parentid.ToString() + ",";
            for (int i = 0; i < drs.Length; i++)
            {
                int classid = Convert.ToInt32(drs[i]["Id"].ToString());
                BindDrpNode(classid, dt);
            }
        }
        /// <summary>
        /// 数据访问
        /// </summary>
        /// <param name="strWhere">SQL条件</param>
        /// <returns></returns>
        public DataSet GetClassList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * from ws_ProType ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, strSql.ToString(), null);
        }
        protected void WebInfo()
        {
            Page.Header.Title = Web.webInfo();
        }
    }
}