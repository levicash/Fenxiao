using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;
using System.Web.Services;
using System.Web.UI.HtmlControls;

namespace Web_Project.View.admin_
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    Response.Write("<script language=javascript>top.location='login.aspx'</script>");
                }
                else
                {
                    //获取用户名
                    Literal1.Text = AdminInfo.UserName;
                    Show();
                    DingBuShow();
                }
            }
        }
        /// <summary>
        /// 先绑定所有父级权限，通过Repeater1_ItemDataBound方法控制隐藏
        /// </summary>
        protected void Show()
        {
            string sql = "select * from ws_BackUserCompetence where Type=0 order by Orders,Id";
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater1.DataSource = db;
            Repeater1.DataBind();
        }
        /// <summary>
        /// 绑定二级权限
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Repeater1_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label lbl = e.Item.FindControl("lbl") as Label;

                //当前登录用户名
                int logid = Convert.ToInt32(AdminInfo.UserID.ToString());
                //先绑定子模块
                Repeater rptInfo2 = e.Item.FindControl("Repeater2") as Repeater;
                int mid = Convert.ToInt32(lbl.Text);
                rptInfo2.DataSource = _getModule_son(mid);
                rptInfo2.DataBind();

                //查询当前登录会员的角色
                int roleId = 0;
                string sqlRole = "select Type from ws_BackUserInfo where Id=" + logid + "";
                DataTable dbRole = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlRole, null);
                if (dbRole.Rows.Count > 0)
                {
                    roleId = Convert.ToInt32(dbRole.Rows[0]["Type"].ToString());
                }
                if (roleId != 1)
                {
                    //获取模块是否显示
                    HtmlControl dis_a = e.Item.FindControl("dis_a") as HtmlControl;
                    //获取父模块ID
                    string mids1 = "";
                    //判断是否有父模块
                    if (_getfunctionTable(logid).Tables[0].Rows.Count > 0)
                    {
                        mids1 = _getfunctionTable(logid).Tables[0].Rows[0][0].ToString();
                        //获取子模块ID
                        string mids2 = _getfunctionTable(logid).Tables[0].Rows[0][1].ToString();

                        string[] values1 = mids1.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        string[] values2 = mids2.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                        //循环比对，控制父模块隐藏
                        for (int index = 0; index < values1.Length; index++)
                        {
                            if (lbl.Text == values1[index])
                            {
                                dis_a.Visible = true;
                            }
                            else
                            {
                                continue;
                            }
                        }
                        //循环比对，控制子模块隐藏
                        for (int j = 0; j < rptInfo2.Items.Count; j++)
                        {
                            Label lbl2 = rptInfo2.Items[j].FindControl("lbl2") as Label;
                            HtmlControl dis_b = rptInfo2.Items[j].FindControl("dis_b") as HtmlControl;

                            for (int index2 = 0; index2 < values2.Length; index2++)
                            {
                                if (lbl2.Text == values2[index2])
                                {
                                    string faids = GetFatherId(Convert.ToInt32(lbl2.Text));
                                    if (lbl.Text == faids)
                                    {
                                        dis_a.Visible = true;
                                    }
                                    dis_b.Visible = true;
                                }
                                else
                                {
                                    continue;
                                }
                            }
                        }
                    }
                }
                else
                {
                    HtmlControl dis_a = e.Item.FindControl("dis_a") as HtmlControl;
                    dis_a.Visible = true;
                    //循环比对，控制子模块隐藏
                    for (int j = 0; j < rptInfo2.Items.Count; j++)
                    {
                        HtmlControl dis_b = rptInfo2.Items[j].FindControl("dis_b") as HtmlControl;
                        dis_b.Visible = true;
                    }
                }
            }
        }
        //获取子模块
        public DataSet _getModule_son(int mid)
        {
            string sql = "select * from  ws_BackUserCompetence where Type=" + mid + " order by Orders,Id";
            return DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql, null);
        }

        //获取功能表
        public DataSet _getfunctionTable(int userid)
        {
            string sql = "select FatherId,SonId from ws_BackLimitTable where LogId =" + userid;
            return DBHelpers.ExecuteDataSet(DBHelpers.conn, CommandType.Text, sql, null);
        }
        //根据子栏目ID获取父栏目编号
        protected string GetFatherId(int ids)
        {
            string fatherId = "";
            string sql = "select * from ws_BackUserCompetence where Id = " + ids;
            DataTable dt = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            if (dt.Rows.Count > 0)
            {
                fatherId = dt.Rows[0]["Type"].ToString();
            }
            return fatherId;
        }
        //顶部展示
        protected void DingBuShow()
        {
            string sql = "";
            //当前登录用户名
            int logid = Convert.ToInt32(AdminInfo.UserID.ToString());
            //查询当前登录会员的角色
            int roleId = 0;
            string sqlRole = "select Type from ws_BackUserInfo where Id=" + logid + "";
            DataTable dbRole = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlRole, null);
            if (dbRole.Rows.Count > 0)
            {
                roleId = Convert.ToInt32(dbRole.Rows[0]["Type"].ToString());
            }
            if (roleId != 1)
            {
                string sqlSon = "select SonId from ws_BackLimitTable where LogId=" + logid + "";
                DataTable dbSon = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sqlSon, null);
                if (dbSon.Rows.Count > 0)
                {
                    string strSon = dbSon.Rows[0]["SonId"].ToString();
                    sql = "select top 8 * from ws_BackUserCompetence where Id in (" + (strSon.TrimEnd(',')) +
                                 ") and IsDingBu='展示' order by Orders,Id";

                }
            }
            else
            {
                sql = "select top 8 * from ws_BackUserCompetence where IsDingBu='展示' order by Orders,Id";
            }
            DataTable db = DBHelpers.ExecuteDataTable(DBHelpers.conn, CommandType.Text, sql, null);
            Repeater3.DataSource = db;
            Repeater3.DataBind();
        }
    }
}