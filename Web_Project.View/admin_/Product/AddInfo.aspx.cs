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
    public partial class AddInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "",
                                                       "<script language=javascript>top.location='../login.aspx'</script>");
                }
                else
                {
                    DDLShow();
                    ProShow();
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
        protected void ProShow()
        {
            if (Request["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select *  from ws_ProductInfo  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    TxtPrice1.Text = db.Rows[0]["Price1"].ToString();
                    TxtPrice2.Text = db.Rows[0]["Price2"].ToString();
                    TextBox3.Text = db.Rows[0]["BianHao"].ToString();
                    TextBox4.Text = db.Rows[0]["GuiGe"].ToString();
                    Description.InnerText = db.Rows[0]["Desp"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                    ddlType.SelectedValue = db.Rows[0]["Type"].ToString();
                    Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "~/admin_/Images/no_pic.gif" : ("../Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                    if (db.Rows[0]["JingPin"].ToString() == "精品")
                    {
                        CheckBox1.Checked = true;
                    }
                    if (db.Rows[0]["XinPin"].ToString() == "新品")
                    {
                        CheckBox2.Checked = true;
                    }
                    if (db.Rows[0]["ReXiao"].ToString() == "热销")
                    {
                        CheckBox3.Checked = true;
                    }
                    if (db.Rows[0]["ShangJia"].ToString() == "上架")
                    {
                        CheckBox4.Checked = true;
                    }
                }
            }
            if (Request["type"] != null)
            {
                ddlType.SelectedValue = Request["type"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int page = 0;
                string jingpin = "";
                string xinpin = "";
                string rexiao = "";
                string shangjia = "";
                string title = txtTitle.Text.Trim().Replace("'", "''");
                string price1 = TxtPrice1.Text.Trim().Replace("'", "''");
                string price2 = TxtPrice2.Text.Trim().Replace("'", "''");
                string bianhao = TextBox3.Text.Trim().Replace("'", "''");
                string guige = TextBox4.Text.Trim().Replace("'", "''");
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                int type = Convert.ToInt32(ddlType.SelectedValue.ToString());//一级产品分类
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string desp = Description.InnerText.ToString().Replace("'", "''");
                if (CheckBox1.Checked)
                {
                    jingpin = CheckBox1.Text;
                }
                if (CheckBox2.Checked)
                {
                    xinpin = CheckBox2.Text;
                }
                if (CheckBox3.Checked)
                {
                    rexiao = CheckBox3.Text;
                }
                if (CheckBox4.Checked)
                {
                    shangjia = "上架";
                }
                string imgName = filePic.FileName.ToString();
                string imgPath = Server.MapPath("../Images/proImg/");
                string NewName = "";
                if (Request["id"] != null)
                {
                    int pid = Convert.ToInt32(Request["id"].ToString());
                    //小图
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
                    string strSql = "update ws_ProductInfo set Title='" + title + "',YPrice='" + price1 + "',XPrice='" + price2 + "',BianHao='" + bianhao + "',GuiGe='" + guige + "',Desp='" + desp + "',JingPin='" + jingpin + "',XinPin='" + xinpin + "',ReXiao='" + rexiao + "',ShangJia='" + shangjia + "',Type=" + type + ",Orders=" + order + ",AddTime='" + date + "'";
                    if (NewName != "")
                    {
                        strSql += ",ImgName='" + NewName + "'";
                        string sqlPic = "select * from ws_ProductInfo where Id = " + pid + "";
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
                        if (Request["page"] != null)
                        {
                            page = Convert.ToInt32(Request["page"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='ProductInfo.aspx?page=" + page + "'</script>");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='ProductInfo.aspx'</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddInfo.aspx?pid=" + pid + "'</script>");
                    }
                }
                else
                {
                    string strSql = "";
                    if (filePic.HasFile)
                    {
                        string str = imgName.Substring(imgName.LastIndexOf('.') + 1);
                        NewName = DateTime.Now.ToString("i_yyyyMMddhhmmss_ffff") + "." + str; //重命名上传文件
                        if (!Directory.Exists(imgPath)) //判断路径是否存在
                        {
                            Directory.CreateDirectory(imgPath); //如果不存在创建文件夹           
                        }
                        filePic.SaveAs(imgPath + NewName); //图片 上传
                    }
                    strSql = "insert into ws_ProductInfo";
                    strSql += "(Title,YPrice,XPrice,BianHao,GuiGe,ImgName,Desp,Type,JingPin,XinPin,ReXiao,ShangJia,Orders,AddTime) values ";
                    strSql += "('" + title + "','" + price1 + "','" + price2 + "','" + bianhao + "','" + guige + "','" + NewName + "','" + desp + "'," + type + ",'" + jingpin + "','" + xinpin + "','" + rexiao + "','" + shangjia + "'," + order + ",'" + date + "')";
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddInfo.aspx?type=" + type + "'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddInfo.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='ProductInfo.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int page = 0;
            if (Request["page"] != null)
            {
                page = Convert.ToInt32(Request["page"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='ProductInfo.aspx?page=" + page + "'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='ProductInfo.aspx'</script>");
            }
        }
    }
}