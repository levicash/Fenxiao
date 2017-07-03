<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="YueAdd.aspx.cs" Inherits="Web_Project.View.YueAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <script src="layer/layer.js" type="text/javascript"></script>
    <script src="Scripts/yueadd.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".left_box p a").removeClass("mea");
            $(".left_box p a.achongzhi").addClass("mea");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        <div class="mright_1">
            <span>我要充值</span>
        </div>
        <div class="reg zhuan">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td class="td1">
                        我的余额：
                    </td>
                    <td style="width: 50%; padding-left: 15px;">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        充值金额：
                    </td>
                    <td>
                        <input class="regcode" id="txt_jine" type="text" value="0" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <div class="zhuan_6">
                <a href="javascript:void(0)">确认充值</a>
            </div>
        </div>
    </div>
</asp:Content>
