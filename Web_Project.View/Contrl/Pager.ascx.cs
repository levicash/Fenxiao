using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Project.Data;

namespace Web_Project.View.Contrl
{
    public partial class Pager : System.Web.UI.UserControl
    {
        public string _orderFid { get; set; }//排序字段
        DBCommon db = new DBCommon();
        public int _pagesize { get; set; }
        public string _RowCountSql { get; set; }
        public string _InfoSql { get; set; }
        public delegate void ShowDelegate2();
        public event Pager.ShowDelegate2 binddata;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public DataSet PageInfo()
        {
            if (ViewState["current"] != null)
            {
                AspNetPager1.CurrentPageIndex = int.Parse(ViewState["current"].ToString());
                ViewState["current"] = null;
            }
            AspNetPager1.PageSize = _pagesize;
            AspNetPager1.RecordCount = db.GetRowCount1(_RowCountSql);
            this.Literal1.Text = AspNetPager1.RecordCount.ToString();
            this.pagecurrent.Value = AspNetPager1.CurrentPageIndex.ToString();
            return db.GetinfoList1(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, _orderFid, _InfoSql);
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            binddata();
        }
    }
}