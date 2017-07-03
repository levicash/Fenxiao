﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View
{
    public partial class FaHuo : System.Web.UI.Page
    {
        public int page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!FrontUser.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }
                WebInfo("发货管理");
                if (Request["page"] != null)
                {
                    ViewState["current"] = Request["page"].ToString();
                }
                ShowInfo();
                OrderListCount();
            }
        }
        /// <summary>
        /// 信息绑定
        /// </summary>
        protected void ShowInfo()
        {
            string uname = FrontUser.UserName.ToString();
            DBCommon db = new DBCommon();
            string title = txtTitle.Text.Trim();//订单号
            string _orderFid = "AddTime desc";//排序字段
            if (ViewState["current"] != null)
            {
                AspNetPager1.CurrentPageIndex = int.Parse(ViewState["current"].ToString());
                ViewState["current"] = null;
            }
            AspNetPager1.PageSize = 15;
            string sqlCount = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "'";//获取总条数
            if (title != "")
            {
                sqlCount += " and OrderId like '%" + title + "%'";
            }
            AspNetPager1.RecordCount = db.GetRowCount1(sqlCount);
            this.Literal1.Text = AspNetPager1.RecordCount.ToString();
            this.pagecurrent.Value = AspNetPager1.CurrentPageIndex.ToString();
            page = Convert.ToInt32(AspNetPager1.CurrentPageIndex.ToString());
            string sqlInfo =
                "select * from ws_OrderList where TuiJianRen='" + uname + "'";//具体查询sql
            if (title != "")
            {
                sqlInfo += " and OrderId like '%" + title + "%'";
            }
            Repeater1.DataSource = db.GetinfoList1(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, _orderFid, sqlInfo);
            Repeater1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ViewState["current"] = this.pagecurrent.Value;
            ShowInfo();
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            ShowInfo();
        }
        /// <summary>
        /// 订单数量
        /// </summary>
        protected void OrderListCount()
        {
            string uname = FrontUser.UserName.ToString();
            string sqlCount = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "'";//获取总条数
            int count1 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount, null));
            Literal2.Text = count1.ToString();
            string sqlCount2 = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "' and IsFaHuo=2";//获取总条数
            int count2 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount2, null));
            Literal3.Text = count2.ToString();
            string sqlCount3 = "select count(*) from ws_OrderList where TuiJianRen='" + uname + "' and IsFaHuo=1";//获取总条数
            int count3 = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sqlCount3, null));
            Literal4.Text = count3.ToString();
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            ShowInfo();
        }
        protected void WebInfo(string name)
        {
            Page.Header.Title = name + "--" + Web.webInfo();
        }
    }
}