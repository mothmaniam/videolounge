<%@ Page Title="Edit User" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="videolounge.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblEditUser" runat="server" Text="Edit User" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMessageHeader" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
   </table> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="margin-left:-30px; margin-top:15px">
        <tr>
            <td>
                <asp:Label ID="lblEmployee" runat="server" Text="Select Employee" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNewPassword" runat="server" Text="New Password" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server" Font-Names="Calibri" Font-Size="Small" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblConfirmNewPassword" runat="server" Text="Confirm New Password" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmNewPassword" runat="server" Font-Names="Calibri" Font-Size="Small" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="radioStatusActive" runat="server" cssclass="fancyLabel" Text="Enabled"
                    GroupName="status" oncheckedchanged="radioStatusActive_CheckedChanged" AutoPostBack="true"/>&nbsp;
                <asp:RadioButton ID="radioStatusInactive" runat="server" cssclass="fancyLabel" Text="Disabled"
                    GroupName="status" oncheckedchanged="radioStatusInactive_CheckedChanged" AutoPostBack="true" />
            </td>
        </tr>
        <tr>
	        <td><br />
                <asp:Button ID="btnUpdateUser" runat="server" Text="Update User" CssClass="silverButton" OnClick="btnUpdateUser_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
