using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.RateInstall
{
    public partial class Install : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
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
            string strSql = "select count(*) from ws_RateInstall";
            int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql, null));
            if (count == 1)
            {
                string strSql1 = "select * from ws_RateInstall";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, strSql1, null);
                if (db.Rows.Count > 0)
                {
                    txtTitle.Text = db.Rows[0]["YiJiBili"].ToString();
                    TextBox1.Text = db.Rows[0]["ErJiBili"].ToString();
                    TextBox2.Text = db.Rows[0]["SanJiBili"].ToString();
                    TextBox3.Text = db.Rows[0]["TxBili"].ToString();
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string yuelixi = txtTitle.Text.Trim();
                string zengzhilv = TextBox1.Text.Trim();
                string fzrbili = TextBox2.Text.Trim();
                string gqprice = TextBox3.Text.Trim();
                string strSql2 = "select count(*) from ws_RateInstall";
                int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, strSql2, null));
                if (count == 1)
                {
                    string sql = "update ws_RateInstall set YiJiBili=" + yuelixi + ",ErJiBili=" + zengzhilv + ",SanJiBili=" + fzrbili + ",TxBili=" + gqprice + "";
                    int iu = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, sql, null);
                    if (iu > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改成功');window.location='Install.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='Install.aspx'</script>");
                    }
                }
                else
                {
                    string strSql =
                        string.Format(
                            "insert into ws_RateInstall(YiJiBili,ErJiBili,SanJiBili,TxBili) values({0},{1},{2},{3})",
                            yuelixi, zengzhilv, fzrbili, gqprice);
                    int ic = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (ic > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加成功');window.location='Install.aspx'</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('添加失败');window.location='Install.aspx'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "",
                                                   "<script>alert('出现错误，请重试');window.location='Install.aspx'</script>");
            }
        }
    }
}