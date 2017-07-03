using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using System.Transactions;

namespace Web_Project.View.admin_.News
{
    public partial class AddNews : System.Web.UI.Page
    {
        int page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                    Drop();
                    Show();
                }
            }
        }
        protected void Drop()
        {
            DropDownList1.Items.Clear();
            string sql = "select * from ws_NewsType order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            DropDownList1.DataSource = db;
            DropDownList1.DataTextField = "Title";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();

            ListItem li = new ListItem("--请选择分类", "-1");
            DropDownList1.Items.Insert(0, li);
        }
        protected void Show()
        {
            if (Request["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select *  from ws_NewsInfo  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    DropDownList1.SelectedValue = db.Rows[0]["Type"].ToString();
                    TextBox2.Text = db.Rows[0]["Laiyuan"].ToString();
                    TextBox1.Text = db.Rows[0]["AddTime"].ToString() == "" ? "" : Convert.ToDateTime(db.Rows[0]["AddTime"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");
                    Description.InnerText = db.Rows[0]["Desp"].ToString();
                    if (db.Rows[0]["Dis"].ToString() == "置顶")
                    {
                        CheckBox1.Checked = true;
                    }
                    if (db.Rows[0]["Jis"].ToString() == "推荐")
                    {
                        CheckBox2.Checked = true;
                    }
                    if (db.Rows[0]["Fis"].ToString() == "发布")
                    {
                        CheckBox3.Checked = true;
                    }
                    Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "~/admin_/Images/no_pic.gif" : ("../Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                }
            }
            else
            {
                CheckBox3.Checked = true;
                TextBox1.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            }
            if (Request["type"] != null)
            {
                DropDownList1.SelectedValue = Request["type"].ToString();
            }
        }
        /// <summary>
        /// 提交
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string dis = "";
                string jis = "";
                string fis = "";
                string title = txtTitle.Text.Trim();
                string laiyuan = TextBox2.Text.Trim();
                string description = Description.InnerText.ToString().Replace("'", "''");
                string date = TextBox1.Text.Trim();
                int type = Convert.ToInt32(DropDownList1.SelectedValue);
                if (CheckBox1.Checked)
                {
                    dis = CheckBox1.Text;
                }
                if (CheckBox2.Checked)
                {
                    jis = CheckBox2.Text;
                }
                if (CheckBox3.Checked)
                {
                    fis = CheckBox3.Text;
                }
                string imgName = filePic.FileName.ToString();
                string imgPath = Server.MapPath("../Images/proImg/");
                string NewName = "";
                if (Request["id"] != null)
                {
                    string sql = "";
                    int nid = Convert.ToInt32(Request["id"].ToString());
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
                    sql = string.Format("update ws_NewsInfo set Title='{0}',Desp='{1}',AddTime='{2}',Dis='{3}',Jis='{4}',Fis='{5}',Type={6},Laiyuan='{7}'", title, description, date, dis, jis, fis, type, laiyuan);
                    if (NewName != "")
                    {
                        sql += string.Format(",ImgName='{0}'", NewName);
                        string sqlPic = "select * from ws_NewsInfo where Id = " + nid + "";
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
                    sql += string.Format(" where Id={0}", nid);
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                    if (up > 0)
                    {
                        if (Request["page"] != null)
                        {
                            page = Convert.ToInt32(Request["page"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='NewsInfo.aspx?page=" + page + "'</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddNews.aspx?nid=" + nid + "'</script>");
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
                            "insert into ws_NewsInfo(Title,Desp,AddTime,Dis,Jis,Fis,Type,Laiyuan,ImgName) values('{0}','{1}','{2}','{3}','{4}','{5}',{6},'{7}','{8}')",
                            title, description, date, dis, jis, fis, type, laiyuan, NewName);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddNews.aspx?type=" + type + "'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddNews.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "",
                                                        "<script>alert('出现错误，请重试');window.location='NewsInfo.aspx'</script>");
            }
        }
        /// <summary>
        /// 返回
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request["page"] != null)
            {
                page = Convert.ToInt32(Request["page"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='NewsInfo.aspx?page=" + page + "'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='NewsInfo.aspx'</script>");
            }
        }
    }
}