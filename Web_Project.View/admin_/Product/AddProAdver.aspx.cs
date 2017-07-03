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
    public partial class AddProAdver : System.Web.UI.Page
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
                    DDLShow();
                    ShowInfo();
                }
            }
        }
        /// <summary>
        /// 绑定新闻分类
        /// </summary>
        protected void DDLShow()
        {
            DropDownList1.Items.Clear();
            string sql = "select * from ws_ProType where Type=0 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            DropDownList1.DataSource = db;
            DropDownList1.DataTextField = "Title";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();

            ListItem li = new ListItem("--请选择分类", "-1");
            DropDownList1.Items.Insert(0, li);
        }
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int Typeid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select * from ws_ProAdver where id=" + Typeid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    DropDownList1.SelectedValue = db.Rows[0]["Type"].ToString();
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
                string name = txtTitle.Text.Trim().Replace("'", "''");
                int type = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
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
                            "update ws_ProAdver set Title='{0}',AddTime='{1}',Orders={2},Type={3}", name,
                             date, order, type);
                    if (NewName != "")
                    {
                        strSql += string.Format(",ImgName='{0}'", NewName);
                        string sqlPic = "select * from ws_ProAdver where Id = " + typeid + "";
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
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('更新成功');window.location='ProAdver.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('更新失败');window.location='AddProAdver.aspx?Typeid=" + Convert.ToInt32(Request["Typeid"].ToString()) + "'</script>");
                    }
                }
                else
                {
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
                            "insert into ws_ProAdver(Title,AddTime,Orders,Type,ImgName) values('{0}','{1}',{2},{3},'{4}')", name,
                             date, order, type, NewName);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');window.location='AddProAdver.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddProAdver.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误请重试');window.location='ProAdver.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='ProAdver.aspx'</script>");
        }
    }
}