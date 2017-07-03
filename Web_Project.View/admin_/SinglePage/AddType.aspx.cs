using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.SinglePage
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
                    ShowInfo();
                }
            }
        }
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int Typeid = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select * from ws_SingleType where id=" + Typeid;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    RadioButtonList1.SelectedValue = db.Rows[0]["IsXianShi"].ToString();
                    txtOrder.Text = db.Rows[0]["Orders"].ToString();
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
                int isXianShi = Convert.ToInt32(RadioButtonList1.SelectedValue.ToString());
                int order = Convert.ToInt32(txtOrder.Text.Trim());
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                if (Request["id"] != null)
                {
                    string strSql =
                        string.Format(
                            "update ws_SingleType set Title='{0}',AddTime='{1}',Orders={2},IsXianShi={3}", name,
                             date, order, isXianShi);
                    strSql += string.Format("  where id={0}", Convert.ToInt32(Request["id"].ToString()));
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('更新成功');window.location='Type.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('更新失败');window.location='AddType.aspx?Typeid=" + Convert.ToInt32(Request["Typeid"].ToString()) + "'</script>");
                    }
                }
                else
                {
                    string strSql =
                        string.Format(
                            "insert into ws_SingleType(Title,AddTime,Orders,IsXianShi) values('{0}','{1}',{2},{3})", name,
                             date, order, isXianShi);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');window.location='AddType.aspx'</script>");
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误请重试');window.location='Type.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='Type.aspx'</script>");
        }
    }
}