using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_
{
    public partial class right : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    Response.Write("<script language=javascript>top.location='login.aspx'</script>");
                }
                else
                {
                    //获取用户名
                    lterAdmin.Text = AdminInfo.UserName;

                    ////获取年月日星期
                    //string[] Day = new string[] { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
                    //DateTime dt = DateTime.Now;
                    //string weeks = Day[Convert.ToInt32(dt.DayOfWeek)];
                    //lterTime.Text = dt.ToString("yyyy年MM月dd日") + "   " + weeks;

                    //查询最后登录时间
                    string sql = "select * from ws_BackUserInfo where UserName='" + AdminInfo.UserName + "'";
                    DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                    if (db.Rows.Count > 0)
                    {
                        Literal14.Text = db.Rows[0]["LastTime"].ToString() == "" ? "您这是第一次登录" : db.Rows[0]["LastTime"].ToString();
                    }

                    //服务器名称
                    lterFuWuQi.Text = Request.ServerVariables["SERVER_NAME"].ToString();
                    //获取IP
                    lterIP.Text = Page.Request.UserHostAddress.ToString();

                    Literal1.Text = GetOSVersion();
                    Literal2.Text = GetNetVersion();
                    Literal3.Text = ServiceIIS;
                    Literal4.Text = GetSystemLength;
                    //查询会员总数
                    string sql1 = "select count(*) from ws_RegisterInfo";
                    int count1 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql1, null));
                    Literal5.Text = count1.ToString();
                    //查询今天会员总数
                    string date = DateTime.Now.ToString("yyyy-MM-dd");
                    string sql2 = "select count(*) from ws_RegisterInfo where DATEDIFF([day], convert(nvarchar,AddTime,20) , '" + date + "')=0";
                    int count2 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql2, null));
                    Literal6.Text = count2.ToString();

                    //Literal8.Text = UserlevelMethod("联合创始人").ToString();
                    //Literal9.Text = UserlevelMethod("总代理").ToString();
                    //Literal10.Text = UserlevelMethod("省级代理").ToString();
                    //Literal11.Text = UserlevelMethod("市级代理").ToString();
                    //Literal12.Text = UserlevelMethod("特约代理").ToString();
                    //Literal13.Text = UserlevelMethod("零售商").ToString();
                }
            }
        }

        protected int UserlevelMethod(string userlevel)
        {
            string sql2 = "select count(*) from ws_RegisterInfo where UserType='" + userlevel + "'";
            int count2 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql2, null));
            return count2;
        }

        /// <summary>
        /// 获取服务器系统信息
        /// </summary>
        public string GetOSVersion()
        {
            OperatingSystem os = Environment.OSVersion;
            return os.ToString();
        }

        /// <summary>
        /// 获取服务器.net版本
        /// </summary>
        /// <returns></returns>
        public string GetNetVersion()
        {
            return Environment.Version.ToString();
        }
        /// <summary>
        /// 递归文件目录，返回目录下所有文件大小
        /// </summary>
        /// <param name="d">传入的路径</param>
        /// <returns></returns>
        public static long DirSize(DirectoryInfo d)
        {
            long Size = 0;
            // 所有文件大小.
            FileInfo[] fis = d.GetFiles();
            foreach (FileInfo fi in fis)
            {
                Size += fi.Length;
            }
            // 遍历出当前目录的所有文件夹.
            DirectoryInfo[] dis = d.GetDirectories();
            foreach (DirectoryInfo di in dis)
            {
                Size += DirSize(di);   //这就用到递归了，调用父方法,注意，这里并不是直接返回值，而是调用父返回来的
            }
            return (Size);
        }

        /// <summary>
        /// 调用DirSize方法
        /// </summary>
        /// <returns></returns>
        public string GetDirSize()
        {
            string fullPath = HttpContext.Current.Server.MapPath("~/");
            DirectoryInfo d = new DirectoryInfo(fullPath);
            return (Convert.ToDouble(DirSize(d)) / 1024 / 1024).ToString("N") + "M";
        }
        /// <summary>
        /// 获取程序占用空间大小
        /// </summary>
        public string GetSystemLength
        {
            get { return GetDirSize(); }
        }
        /// <summary>
        /// 服务器IIS版本
        /// </summary>
        public string ServiceIIS
        {
            get { return HttpContext.Current.Request.ServerVariables["SERVER_SOFTWARE"]; }
        }
    }
}