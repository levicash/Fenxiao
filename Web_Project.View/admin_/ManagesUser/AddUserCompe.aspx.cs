using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.ManagesUser
{
    public partial class AddUserCompe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
            if (!IsPostBack)
            {
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "",
                                                       "<script language=javascript>top.location='../login.aspx'</script>");
                }
                else
                {
                    Drop();
                    if (Request["pid"] != null)
                    {
                        ProShow();
                    }
                }
            }
        }
        protected void Drop()
        {
            DropDownList1.Items.Clear();
            string sql = "select * from ws_BackUserCompetence where Type=0 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            DropDownList1.DataSource = db;
            DropDownList1.DataTextField = "Title";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();

            ListItem li = new ListItem("--请选择权限", "0");
            DropDownList1.Items.Insert(0, li);
        }
        protected void ProShow()
        {
            if (Request["pid"] != null)
            {
                int pid = Convert.ToInt32(Request["pid"].ToString());
                string strSql = "select *  from ws_BackUserCompetence  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    DropDownList1.SelectedValue = db.Rows[0]["Type"].ToString();
                    txtUrl.Text = db.Rows[0]["Url"].ToString();
                    txtDes.Text = db.Rows[0]["Remarks"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                    Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "~/admin_/Images/no_pic.gif" : ("../Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                    if (db.Rows[0]["IsDingBu"].ToString() == "展示")
                    {
                        CheckBox4.Checked = true;
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string dingbu = "";
                string title = txtTitle.Text.Trim();
                int type = Convert.ToInt32(DropDownList1.SelectedValue);
                string url = txtUrl.Text.Trim();
                string txtdes = txtDes.Text.Trim();
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                if (CheckBox4.Checked)
                {
                    dingbu = "展示";
                }
                string imgName = filePic.FileName.ToString();
                string imgPath = Server.MapPath("../Images/proImg/");
                string NewName = "";
                if (Request["pid"] != null)
                {
                    int pid = Convert.ToInt32(Request["pid"].ToString());
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
                    string strSql = "update ws_BackUserCompetence set Title='" + title + "',Type=" + type + ",Url='" + url + "',Remarks='" + txtdes + "',AddTime='" + date + "',Orders=" + order + ",IsDingBu='" + dingbu + "'";
                    if (NewName != "")
                    {
                        strSql += ",ImgName='" + NewName + "'";
                        string sqlPic = "select * from ws_BackUserCompetence where Id = " + pid + "";
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
                    strSql += " where Id=" + pid;
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                               "<script>alert('修改成功');window.location='UserCompe.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddUserCompe.aspx?pid=" + pid + "'</script>");
                    }
                }
                else
                {
                    string strSql = "";
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
                    strSql = "insert into ws_BackUserCompetence";
                    strSql += "(Title,Url,Type,Remarks,AddTime,Orders,IsDingBu,ImgName) values ";
                    strSql += "('" + title + "','" + url + "'," + type + ",'" + txtdes + "','" + date + "'," + order + ",'" + dingbu + "','" + NewName + "')";
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddUserCompe.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddUserCompe.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='UserCompe.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='UserCompe.aspx'</script>");
        }
    }
}