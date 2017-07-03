using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Product
{
    public partial class AddSingImg : System.Web.UI.Page
    {
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
                    GetTitle();
                    ShowInfo();
                }
            }
        }
        protected void GetTitle()
        {
            if (Request["tid"] != null)
            {
                int id = Convert.ToInt32(Request["tid"].ToString());
                string sql = "select Title from ws_ProductInfo where Id=" + id;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal2.Text = db.Rows[0][0].ToString();
                }
            }
        }
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select * from ws_MoreImgInfo where id=" + id;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                    Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "~/admin_/Images/no_pic.gif" : ("../Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                }
            }
        }
        /// <summary>
        /// 添加事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string imgName = filePic.FileName.ToString();
                string imgPath = Server.MapPath("../Images/proImg/");
                string NewName = "";
                if (Request["id"] != null)
                {
                    int typeid = Convert.ToInt32(Request["id"].ToString());
                    if (filePic.HasFile)
                    {
                        string str = imgName.Substring(imgName.LastIndexOf('.') + 1);
                        NewName = DateTime.Now.ToString("yyyyMMddhhmmss_ffff") + "." + str; //重命名上传文件
                        if (!Directory.Exists(imgPath)) //判断路径是否存在
                        {
                            Directory.CreateDirectory(imgPath); //如果不存在创建文件夹           
                        }
                        filePic.SaveAs(imgPath + NewName); //图片 上传
                    }
                    string strSql =
                        string.Format(
                            "update ws_MoreImgInfo set AddTime='{0}',Orders={1}",
                             date, order);
                    if (NewName != "")
                    {
                        strSql += string.Format(",ImgName='{0}'", NewName);
                        string sqlPic = "select * from ws_MoreImgInfo where Id = " + typeid + "";
                        DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlPic, null);
                        if (dt.Rows.Count > 0)
                        {
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                if (File.Exists(Server.MapPath("../Images/proImg/" + dt.Rows[i]["ImgName"].ToString())))
                                {
                                    File.Delete(Server.MapPath("../Images/proImg/" + dt.Rows[i]["ImgName"].ToString()));
                                }
                            }
                        }
                    }
                    strSql += string.Format("  where id={0}", typeid);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        if (Request["tid"] != null)
                        {
                            int tid = Convert.ToInt32(Request["tid"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "",
                                "<script>alert('更新成功');window.location='MoreImg.aspx?id=" + tid + "'</script>");
                        }
                    }
                    else
                    {
                        if (Request["tid"] != null)
                        {
                            int tid = Convert.ToInt32(Request["tid"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "",
                                "<script>alert('更新失败');window.location='MoreImg.aspx?id=" + tid + "'</script>");
                        }
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误请重试');window.location='ProductInfo.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request["tid"] != null)
            {
                int tid = Convert.ToInt32(Request["tid"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "",
                    "<script>window.location='MoreImg.aspx?id=" + tid + "'</script>");
            }
        }
    }
}