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
    public partial class AddMoreImg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                GetJingQuTitle();
                lblMessage.Visible = false;
            }
        }
        protected void GetJingQuTitle()
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                string sql = "select Title from ws_ProductInfo where Id=" + id;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Literal2.Text = db.Rows[0][0].ToString();
                }
            }
        }
        /// <summary>  
        /// 上传照片  
        /// </summary>  
        /// <param name="sender"></param>  
        /// <param name="e"></param>  
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                lblMessage.Visible = true;
                string FileName = "", NewName = ""; ;
                int ifile;
                System.Web.HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
                System.Text.StringBuilder strmsg = new System.Text.StringBuilder("");
                for (ifile = 0; ifile < files.Count; ifile++)
                {
                    if (files[ifile].FileName.Length > 0)
                    {
                        System.Web.HttpPostedFile postedfile = files[ifile];
                        if (postedfile.ContentLength / 1024 > 512) //单个文件不能大于512k  
                        {
                            strmsg.Append(Path.GetFileName(postedfile.FileName) + "不能大于512k!<br>");
                            break;
                        }
                        string fex = Path.GetExtension(postedfile.FileName);
                        if (fex != ".jpg" && fex != ".JPG" && fex != ".gif" && fex != ".GIF" && fex != ".bmp" &&
                            fex != ".BMP")
                        {
                            strmsg.Append(Path.GetFileName(postedfile.FileName) + "图片格式仅支持jpg,gif,bmp!<br>");
                            break;
                        }
                    }
                    else
                    {
                        strmsg.Append("没有图片！");
                        break;
                    }
                }
                if (strmsg.Length <= 0) //图片大小和格式都没问题  
                {
                    string dirpath = Server.MapPath("../Images/proImg/");
                    if (Directory.Exists(dirpath) == false)
                    {
                        Directory.CreateDirectory(dirpath);
                    }
                    for (int i = 0; i < files.Count; i++)
                    {
                        System.Web.HttpPostedFile myFile = files[i];
                        FileName = System.IO.Path.GetFileName(files[i].FileName);
                        string str = FileName.Substring(FileName.LastIndexOf('.') + 1);
                        NewName = DateTime.Now.ToString("yyyyMMddhhmmss_ffff") + "_" + i + "." + str; //重命名上传文件
                        if (FileName.Length > 0) //存在上传文件  
                        {
                            string ppath = dirpath + @"/" + NewName;

                            myFile.SaveAs(ppath);
                            AddPicture(NewName, id);
                        }
                    }
                    lblMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = strmsg.ToString();
                }
            }
        }
        /// <summary>  
        /// 将图片名称保存到数据库  
        /// </summary>  
        /// <param name="imgName"></param>  
        private void AddPicture(string imgName, int tId)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sql = "insert into ws_MoreImgInfo(ImgName,Type,AddTime) values('" + imgName + "'," + tId + ",'" + date + "')";
            DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='MoreImg.aspx?id=" + id + "'</script>");
            }
        }
    }
}