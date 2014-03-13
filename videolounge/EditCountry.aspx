<%@ Page Title="Edit Country" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EditCountry.aspx.cs" Inherits="videolounge.EditCountry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblEditCountryHeader" runat="server" Text="Edit Country" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
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
                <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCurrentRegion" runat="server" Text="Current Region" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCurrentRegion" runat="server" CssClass="fancyLabel" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblRegion" runat="server" Text="New Region" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlRegions" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlRegions_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
    </table>
    <table><br />
        <tr>
            <td colspan="2">
                <asp:Button ID="btnEditCountry" runat="server" Text="Edit Country" CssClass="silverButton" OnClick="btnEditCountry_Click"/>
            </td>
        </tr>
</table>
</asp:Content>
