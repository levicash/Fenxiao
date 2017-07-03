using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
    public class PrvNext
    {
        public static DataTable Prv(string time, int type, string table)
        {
            string sql = "select top 1 * from " + table + " where AddTime>#" + Convert.ToDateTime(time).ToString("yyyy-MM-dd HH:mm:ss") + "# and Type=" + type + " order by AddTime";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Next(string time, int type, string table)
        {
            string sql = "select top 1 * from " + table + " where AddTime<#" + Convert.ToDateTime(time).ToString("yyyy-MM-dd HH:mm:ss") + "# and Type=" + type + " order by AddTime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Prv1(string time, string table)
        {
            string sql = "select top 1 * from " + table + " where Dtime>#" + Convert.ToDateTime(time).ToString("yyyy-MM-dd HH:mm:ss") + "# order by Dtime";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Next1(string time, string table)
        {
            string sql = "select top 1 * from " + table + " where Dtime<#" + Convert.ToDateTime(time).ToString("yyyy-MM-dd HH:mm:ss") + "# order by Dtime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Prv2(string time, string table)
        {
            string sql = "select top 1 * from " + table + " where AddTime>#" + Convert.ToDateTime(time).ToString("yyyy-MM-dd HH:mm:ss") + "# order by AddTime";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Next2(string time, string table)
        {
            string sql = "select top 1 * from " + table + " where AddTime<#" + Convert.ToDateTime(time).ToString("yyyy-MM-dd HH:mm:ss") + "# order by AddTime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Prv3(int order, int type, string table)
        {
            string sql = "select top 1 * from " + table + " where Orders<" + order + " and Type=" + type + " order by Orders desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Next3(int order, int type, string table)
        {
            string sql = "select top 1 * from " + table + " where Orders>" + order + " and Type=" + type + " order by Orders";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Prv4(int order, string table)
        {
            string sql = "select top 1 * from " + table + " where Orders<" + order + " order by Orders desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Next4(int order, string table)
        {
            string sql = "select top 1 * from " + table + " where Orders>" + order + " order by Orders";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Prv5(string time, int type, string table)
        {
            string sql = "select top 1 * from " + table + " where DATEDIFF([second], convert(nvarchar,AddTime,20) , '" + time + "')<0 and Type=" + type + " and Fis='发布' order by AddTime";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
        public static DataTable Next5(string time, int type, string table)
        {
            string sql = "select top 1 * from " + table + " where DATEDIFF([second], convert(nvarchar,AddTime,20) , '" + time + "')>0 and Type=" + type + " and Fis='发布' order by AddTime desc";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            return db;
        }
    }
}
