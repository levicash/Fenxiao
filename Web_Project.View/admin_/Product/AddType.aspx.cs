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
    public partial class AddType : System.Web.UI.Page
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
        protected void DDLShow()
        {
            //下拉框绑定
            ddlType.Items.Clear();
            string sql = "select * from ws_ProType order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Digui(db, ddlType, 0, "", 0);
            ListItem li = new ListItem("--分类--", "0");
            ddlType.Items.Insert(0, li);
        }
        public string Space(int length)
        {
            string temp = "";
            for (int i = 0; i < length; i++)
            {
                temp += "　";  ////注意这里的空白是智能abc输入法状态下的v11字符；
            }
            return temp;
        }
        /// <summary>
        /// 下拉框绑定
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="ddl"></param>
        /// <param name="typeId"></param>
        /// <param name="str"></param>
        protected void Digui(DataTable dt, DropDownList ddl, int typeId, string str, int length)
        {
            DataRow[] rows = dt.Select("Type='" + typeId + "'");
            string str_;
            for (int i = 0; i < rows.Length; i++)
            {
                if (typeId == 0)
                {
                    str_ = "";
                }
                else
                {
                    str_ = "├";
                }
                ListItem item = new ListItem();
                item.Text = Space(length) + str_ + rows[i]["Title"].ToString();     //Bind text
                item.Value = rows[i]["id"].ToString();                                //Bind value
                ddl.Items.Add(item);
                Digui(dt, ddl, Convert.ToInt32(rows[i]["id"]), str_, length + 1);
            }
        }
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int Typeid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select * from ws_ProType where id=" + Typeid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    ddlType.SelectedValue = db.Rows[0]["Type"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                    RadioButtonList1.SelectedValue = db.Rows[0]["IsXianShi"].ToString();
                    RadioButtonList2.SelectedValue = db.Rows[0]["IsDaoHang"].ToString();
                    Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "~/admin_/Images/no_pic.gif" : ("../Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                }
            }
            if (Request["type"] != null)
            {
                ddlType.SelectedValue = Request["type"].ToString();
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
                int type = Convert.ToInt32(ddlType.SelectedValue.ToString());
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                int isXianShi = Convert.ToInt32(RadioButtonList1.SelectedValue.ToString());
                int isDaoHang = Convert.ToInt32(RadioButtonList2.SelectedValue.ToString());
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
                            "update ws_ProType set Title='{0}',AddTime='{1}',Orders={2},Type={3},IsXianShi={4},IsDaoHang={5}", name,
                             date, order, type, isXianShi, isDaoHang);
                    if (NewName != "")
                    {
                        strSql += string.Format(",ImgName='{0}'", NewName);
                        string sqlPic = "select * from ws_ProType where Id = " + typeid + "";
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
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('更新成功');window.location='ProType.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('更新失败');window.location='AddType.aspx?Typeid=" + Convert.ToInt32(Request["Typeid"].ToString()) + "'</script>");
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
                            "insert into ws_ProType(Title,AddTime,Orders,Type,ImgName,IsXianShi,IsDaoHang) values('{0}','{1}',{2},{3},'{4}',{5},{6})", name,
                             date, order, type, NewName, isXianShi, isDaoHang);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');window.location='AddType.aspx?type=" + type + "'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddType.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误请重试');window.location='ProType.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='ProType.aspx'</script>");
        }
    }
}