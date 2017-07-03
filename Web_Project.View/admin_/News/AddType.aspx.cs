using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.News
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
                int id = Convert.ToInt32(Request["id"].ToString());
                string strSql = "select * from ws_NewsType where id=" + id;
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
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
                string name = txtTitle.Text.Trim();
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                int order = Convert.ToInt32(txtOrder.Text);
                if (Request["id"] != null)
                {
                    int id = Convert.ToInt32(Request["id"].ToString());
                    string strSql =
                        string.Format(
                            "update ws_NewsType set Title='{0}',AddTime='{1}',Orders={3} where id={2}", name,
                             date, id, order);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('更新成功');window.location='NewsType.aspx'</script>");
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
                            "insert into ws_NewsType(Title,AddTime,Orders) values('{0}','{1}',{2})", name,
                            date, order);
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误请重试');window.location='NewsType.aspx'</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='NewsType.aspx'</script>");
        }
    }
}