<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="videolounge.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblAddUser" runat="server" Text="Add User" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
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
                <asp:Label ID="lblUsername" runat="server" Text="Username" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="fancyLabel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="fancyLabel" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="fancyLabel" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><br />
                <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="silverButton" onclick="btnAddUser_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
