﻿using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Choujiang
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
                    if (Request["id"] != null)
                    {
                        ProShow();
                    }
                    else
                    {
                        //TextBox1.Text = "http://";
                    }
                }
            }
        }
        protected void ProShow()
        {
            if (Request["id"] != null)
            {
                int pid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select *  from ws_Prize  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtPno.Text = db.Rows[0]["Pno"].ToString();
                    txtPname.Text = db.Rows[0]["Pname"].ToString();
                    txtPrice.Text = db.Rows[0]["Price"].ToString();
                    txtPsize.Text = db.Rows[0]["Psize"].ToString();
                    txtPcomment.Text = db.Rows[0]["Pcomment"].ToString();
                    radiotuijian.SelectedValue = db.Rows[0]["isshow"].ToString();
                    //Image1.ImageUrl = db.Rows[0]["ImgName"].ToString() == "" ? "~/admin_/Images/no_pic.gif" : ("../Images/proImg/" + db.Rows[0]["ImgName"].ToString());
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string Pno = txtPno.Text.Trim();
                string PName = txtPname.Text.Trim();
                double Price = Convert.ToDouble(txtPrice.Text.Trim());
                int Psize = Convert.ToInt32(txtPsize.Text.Trim());
                string Pcomment = txtPcomment.Text.Trim();
                int isShow = Convert.ToInt32(radiotuijian.SelectedValue.ToString());//是否推荐
                if (Request["id"] != null)
                {
                    int pid = Convert.ToInt32(Request["id"].ToString());

                    string strSql = "UPDATE dbo.ws_Prize SET PNO ='" + Pno + "',PName='" + PName + "',Price=" + Price + ",PSize=" + Psize + ",PComment='" + Pcomment + "',isshow=" + isShow + " WHERE id=" + pid;

                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                               "<script>alert('修改成功');window.location='Info.aspx'</script>");
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
                    strSql = " INSERT INTO ws_Prize( PNO , PName , PGrade , Price , PSize , PType , IsShow , PMessage , PComment ) VALUES  ('" + Pno + "','" + PName + "',1," + Price + "," + Psize + ",'1'," + isShow + ",'','" + Pcomment + "')";

                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddInfo.aspx'</script>");
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='Info.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='Info.aspx'</script>");
        }
    }
}