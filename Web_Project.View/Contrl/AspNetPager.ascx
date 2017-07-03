<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AspNetPager.ascx.cs"
    Inherits="Web_Project.View.Contrl.AspNetPager" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<div class="pager" runat="server" id="hidediv">
    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="anpager" OnPageChanged="AspNetPager1_PageChanged"
        FirstPageText="首页" LastPageText="尾页" NextPageText="&gt;" PrevPageText="&lt;"
        ShowPageIndexBox="Never" RecordCount="228" CurrentPageButtonClass="cpb">
    </webdiyer:AspNetPager>
    <span>共<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>条数据&nbsp;第</span>
    <input type="text" class="page_txt" id="pagecurrent" runat="server" value="" onkeydown="javascript:enter(this,$('*[id$=Button1]'))" />
    <span>页</span>
</div>
