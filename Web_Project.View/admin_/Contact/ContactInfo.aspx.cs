using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Contact
{
    public partial class ContactInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "",
                                                       "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                    Show();
                }
            }
        }
        protected void Show()
        {
            string strSql = "select count(*) from Contact";
            int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql, null));
            if (count == 1)
            {
                string strSql1 = "select * from Contact";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql1, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["Title"].ToString();
                    Desp.InnerText = db.Rows[0]["Desp"].ToString();
                    Content.InnerText = db.Rows[0]["Content"].ToString();
                }
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
                string title = txtTitle.Text.Trim();
                string desp = Desp.InnerText.ToString().Replace("'", "''");
                string content = Content.InnerText.ToString().Replace("'", "''");
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string strSql2 = "select count(*) from Contact";
                int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql2, null));
                if (count == 1)
                {
                    string sql = "update Contact set Title='" + title + "',Desp='" + desp + "',Content='" +
                                 content + "',AddTime='" + date + "'";
                    int iu = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                    if (iu > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改成功');window.location='ContactInfo.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='ContactInfo.aspx'</script>");
                    }
                }
                else
                {
                    string strSql =
                        string.Format(
                            "insert into Contact(Title,Desp,Content,AddTime) values('{0}','{1}','{2}','{3}')",
                            title, desp, content, date);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='ContactInfo.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='ContactInfo.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "",
                                                   "<script>alert('出现错误，请重试');window.location='ContactInfo.aspx'</script>");
            }

        }
    }
}