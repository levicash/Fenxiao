<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="Web_Project.View.Contrl.Pager" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<style type="text/css">
    .pager
    {
        margin: 3px;
        color: #ff6500;
        padding: 10px;
    }
    .anpager
    {
        float: left;
        padding: 0px 0;
    }
    .pager span.cpb
    {
        border: #ff5500 1px solid;
        padding: 5px 7px;
        font-weight: bold;
        color: #ff5500;
        margin-right: 3px;
        background: #ffeee5;
    }
    .pager span
    {
        color: #999999;
        margin-right: 3px;
        text-decoration: none;
    }
    .pager a.disabled
    {
        border: #ffe3c6 1px solid;
        padding: 5px 7px;
        color: #ffe3c6;
        margin-right: 3px;
        background: #fff;
    }
    .pager a
    {
        border: #cccccc 1px solid;
        padding: 5px 7px;
        color: #0063dc;
        background: #fff;
        margin-right: 3px;
        text-decoration: none;
    }
    .pager a:hover
    {
        border: #ff5500 1px solid;
        color: #ff5500;
        background: #ffeee5;
    }
    .page_txt
    {
        width: 20px;
        text-align: center;
    }
</style>
<div class="pager" runat="server" id="hidediv">
    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="anpager" OnPageChanged="AspNetPager1_PageChanged"
        FirstPageText="<<" LastPageText=">>" NextPageText="&gt;" PrevPageText="&lt;"
        ShowPageIndexBox="Never" RecordCount="228" NumericButtonCount="5" CurrentPageButtonClass="cpb">
    </webdiyer:AspNetPager>
    <span>共&nbsp;&nbsp;<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>&nbsp;&nbsp;条数据,当前第&nbsp;&nbsp;</span>
    <input type="text" class="page_txt" id="pagecurrent" runat="server" value="" onkeydown="javascript:enter(this,$('*[id$=Button1]'))" />
    <span>&nbsp;&nbsp;页</span>
</div>
