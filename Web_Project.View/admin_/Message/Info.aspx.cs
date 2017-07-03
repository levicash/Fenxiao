using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.admin_.Message
{
    public partial class Info : System.Web.UI.Page
    {
        int page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowInfo();
            }
        }
        protected void ShowInfo()
        {
            if (Request["id"] != null)
            {
                int id = Convert.ToInt32(Request["id"].ToString());
                string sql = "select * from MailInfo where Id=" + id + "";
                DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
                if (db.Rows.Count > 0)
                {
                    Label1.Text = db.Rows[0]["Title"].ToString();
                    Label2.Text = db.Rows[0]["Content"].ToString();
                    Label4.Text = db.Rows[0]["Name"].ToString();
                    Label6.Text = db.Rows[0]["Phone"].ToString();
                    RadioButtonList1.SelectedValue = db.Rows[0]["IsHf"].ToString();
                    Textarea1.InnerText = db.Rows[0]["HuiFuCon"].ToString();
                    Label10.Text = db.Rows[0]["AddTime"].ToString();
                    Label3.Text = db.Rows[0]["HuiFuTime"].ToString();
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                int ishf = Convert.ToInt32(RadioButtonList1.SelectedValue.ToString());
                string huifucon = Textarea1.InnerText.ToString().Replace("'", "''");
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                if (Request["id"] != null)
                {
                    int id = Convert.ToInt32(Request["id"].ToString());
                    string strSql = "update MailInfo set HuiFuCon='" + huifucon + "',IsHf=" + ishf + ",HuiFuTime='" + date + "'";
                    strSql += " where Id=" + id;
                    int up = DBHelpers.ExecuteNonQuery(DBHelpers.conn, CommandType.Text, strSql, null);
                    if (up > 0)
                    {
                        if (Request["page"] != null)
                        {
                            page = Convert.ToInt32(Request["page"].ToString());
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='MessageList.aspx?page=" + page + "'</script>");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');window.location='MessageList.aspx'</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "",
                                                           "<script>alert('修改失败');window.location='Info.aspx?pid=" + id + "'</script>");
                    }
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('出现错误，请重试');window.location='MessageList.aspx'</script>");
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Request["page"] != null)
            {
                page = Convert.ToInt32(Request["page"].ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='MessageList.aspx?page=" + page + "'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.location='MessageList.aspx'</script>");
            }
        }
    }
}