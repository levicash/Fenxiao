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
    public partial class ProductInfo : System.Web.UI.Page
    {
        public int page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Session["ManagerPageUrl"] = HttpContext.Current.Request.Url.OriginalString;
                if (AdminInfo.UserID == null || AdminInfo.UserID == "" || AdminInfo.UserID.Equals(""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script language=javascript>alert('已退出登录！');top.location='../login.aspx'</script>");
                }
                else
                {
                    if (Request["page"] != null)
                    {
                        ViewState["current"] = Request["page"].ToString();
                    }
                    DDLShow();
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
        /// <summary>
        /// 信息绑定
        /// </summary>
        protected void ShowInfo()
        {
            DBCommon db = new DBCommon();
            string title = txtTitle.Text.Trim();//查询标题
            int type = ddlType.SelectedValue == "" ? 0 : Convert.ToInt32(ddlType.SelectedValue);//查询分类
            string _orderFid = "sp.border,sp.bId,sp.Orders,sp.Id";//排序字段
            if (ViewState["current"] != null)
            {
                AspNetPager1.CurrentPageIndex = int.Parse(ViewState["current"].ToString());
                ViewState["current"] = null;
            }
            AspNetPager1.PageSize = 15;
            string sqlCount = "select count(*) from ws_ProductInfo where 1=1";//获取总条数
            if (title != "")
            {
                sqlCount += " and Title like '%" + title + "%'";
            }
            if (type > 0)
            {
                sqlCount += " and Type =" + type;
            }
            AspNetPager1.RecordCount = db.GetRowCount1(sqlCount);
            this.Literal1.Text = AspNetPager1.RecordCount.ToString();
            this.pagecurrent.Value = AspNetPager1.CurrentPageIndex.ToString();
            page = Convert.ToInt32(AspNetPager1.CurrentPageIndex.ToString());
            string sqlInfo =
                "select a.*,b.Id as bId,b.Title as btitle,b.Orders as border from ws_ProductInfo a left join ws_ProType b on a.Type=b.Id where 1=1";//具体查询sql
            if (title != "")
            {
                sqlInfo += " and a.Title like '%" + title + "%'";
            }
            if (type > 0)
            {
                sqlInfo += " and a.Type =" + type;
            }
            repProduct.DataSource = db.GetinfoList1(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, _orderFid, sqlInfo);
            repProduct.DataBind();
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
        /// 查询产品对应的多图数量
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int MoreImgCount(int id)
        {
            int mCount = 0;
            string sql = "select count(*) from ws_MoreImgInfo where Type=" + id + "";
            mCount = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            return mCount;
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
    }
}