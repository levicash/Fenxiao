﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.ManagesUser
{
    public partial class AddUserList : System.Web.UI.Page
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
            string sql = "select * from ws_BackUserRole order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            DropDownList1.DataSource = db;
            DropDownList1.DataTextField = "Title";
            DropDownList1.DataValueField = "Id";
            DropDownList1.DataBind();

            ListItem li = new ListItem("--请选择角色", "-1");
            DropDownList1.Items.Insert(0, li);
        }
        protected void ProShow()
        {
            if (Request["pid"] != null)
            {
                int pid = Convert.ToInt32(Request["pid"].ToString());
                string strSql = "select *  from ws_BackUserInfo  where Id=" + pid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["UserName"].ToString();
                    DropDownList1.SelectedValue = db.Rows[0]["Type"].ToString();
                    txtDes.Text = db.Rows[0]["Remarks"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string title = txtTitle.Text.Trim();
                int type = Convert.ToInt32(DropDownList1.SelectedValue);
                string pwd = txtPwd.Text.Trim();
                string txtdes = txtDes.Text.Trim();
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"); ;
                if (Request["pid"] != null)
                {
                    int pid = Convert.ToInt32(Request["pid"].ToString());
                    string strSql = "update ws_BackUserInfo set UserName='" + title + "',Type=" + type + ",Remarks='" + txtdes + "',AddTime='" + date + "',Orders=" + order + "";
                    //密码不为空时，修改密码
                    if (pwd != "")
                    {
                        strSql += ",Pwd='" + pwd + "'";
                    }
                    strSql += " where Id=" + pid;
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                               "<script>alert('修改成功');window.location='UserList.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='AddUserList.aspx?pid=" + pid + "'</script>");
                    }
                }
                else
                {
                    string strSql = "";
                    strSql = "insert into ws_BackUserInfo";
                    strSql += "(UserName,Pwd,Type,Remarks,AddTime,Orders) values ";
                    strSql += "('" + title + "','" + pwd + "'," + type + ",'" + txtdes + "','" + date + "'," + order + ")";
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='AddUserList.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='AddUserList.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='UserList.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='UserList.aspx'</script>");
        }
    }
}