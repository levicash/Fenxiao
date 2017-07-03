using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Security;
using System.Web.SessionState;

namespace Web_Project.View
{
    public class Global : System.Web.HttpApplication
    {
        void RegisterUrlRouting(System.Web.Routing.RouteCollection routs)
        {
            routs.MapPageRoute(
             "Product", "Product_{pid}.aspx", "~/Product.aspx"
             );
            routs.MapPageRoute(
            "Case", "Case_{cid}.aspx", "~/Case.aspx"
            );
            routs.MapPageRoute(
            "ProductInfo", "ProductInfo_{pid}_{tid}.aspx", "~/ProductInfo.aspx"
            );
            routs.MapPageRoute(
            "Aother", "Aother_{aid}.aspx", "~/Aother.aspx"
            );
            routs.MapPageRoute(
          "News", "News_{nid}.aspx", "~/News.aspx"
          );
            routs.MapPageRoute(
           "NewsInfo", "NewsInfo_{nid}_{tid}.aspx", "~/NewsInfo.aspx"
           );
            routs.MapPageRoute(
          "FhList", "FhList_{oid}_{pid}.aspx", "~/FhList.aspx"
          );
            routs.MapPageRoute(
         "VideoInfo", "VideoInfo_{vid}_{tid}.aspx", "~/VideoInfo.aspx"
         );
            routs.MapPageRoute(
          "Video", "Video_{vid}.aspx", "~/Video.aspx"
          );
            routs.MapPageRoute(
         "Single", "Single_{sid}.aspx", "~/Single.aspx"
         );
        }
        void Application_Start(object sender, EventArgs e)
        {
            // 在应用程序启动时运行的代码
            RegisterUrlRouting(System.Web.Routing.RouteTable.Routes);
        }
        void Application_End(object sender, EventArgs e)
        {
            //  在应用程序关闭时运行的代码

        }

        void Application_Error(object sender, EventArgs e)
        {
            // 在出现未处理的错误时运行的代码
            // 在出现未处理的错误时运行的代码         
            //Exception objErr = Server.GetLastError().GetBaseException();
            //string error = string.Empty;
            //string errortime = string.Empty;
            //string erroraddr = string.Empty;
            //string errorinfo = string.Empty;
            //string errorsource = string.Empty;
            //string errortrace = string.Empty;

            //error += "发生时间:" + System.DateTime.Now.ToString() + "<br>";
            //errortime = "发生时间:" + System.DateTime.Now.ToString();

            //error += "发生异常页: " + Request.Url.ToString() + "<br>";
            //erroraddr = "发生异常页: " + Request.Url.ToString();

            //error += "异常信息: " + objErr.Message + "<br>";
            //errorinfo = "异常信息: " + objErr.Message;

            //errorsource = "错误源:" + objErr.Source;
            //errortrace = "堆栈信息:" + objErr.StackTrace;
            //error += "--------------------------------------<br>";
            //Server.ClearError();
            //Application["error"] = error;

            ////独占方式，因为文件只能由一个进程写入.
            //System.IO.StreamWriter writer = null;
            //try
            //{
            //    lock (this)
            //    {
            //        // 写入日志
            //        string year = DateTime.Now.Year.ToString();
            //        string month = DateTime.Now.Month.ToString();
            //        string path = string.Empty;
            //        string filename = DateTime.Now.Day.ToString() + ".html";
            //        path = Server.MapPath("~/ErrorLog/") + year + "/" + month;
            //        //如果目录不存在则创建
            //        if (!System.IO.Directory.Exists(path))
            //        {
            //            System.IO.Directory.CreateDirectory(path);
            //        }
            //        System.IO.FileInfo file = new System.IO.FileInfo(path + "/" + filename);


            //        //文件不存在就创建,true表示追加

            //        writer = new System.IO.StreamWriter(file.FullName, true);

            //        string ip = "用户IP:" + Request.UserHostAddress;
            //        string line = "-----------------------------------------------------";

            //        string log = "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><p style='font-size:9pt;'><br>" + line + "<br><font color='red'>" + errortime + "&nbsp;&nbsp;" + erroraddr + "</font><br /><font color='green'>" + "<br/>" + ip + errorinfo + "<br>" + errorsource + "<br>" + errortrace.Replace("\r\n", "<br>") + "</font></p>";
            //        writer.WriteLine(log);

            //    }
            //}
            //finally
            //{
            //    if (writer != null)
            //        writer.Close();
             
            //}
            //Response.Redirect("~/ErrorPage.aspx");
        }

        void Session_Start(object sender, EventArgs e)
        {
            // 在新会话启动时运行的代码

        }

        void Session_End(object sender, EventArgs e)
        {
            // 在会话结束时运行的代码。 
            // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
            // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
            // 或 SQLServer，则不会引发该事件。

        }

    }
}
