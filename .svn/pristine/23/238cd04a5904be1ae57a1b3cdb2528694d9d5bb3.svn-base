<%@ Page Title="Add Country" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddCountry.aspx.cs" Inherits="videolounge.AddCountry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblAddCountryHeader" runat="server" Text="Add Country" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
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
                <asp:Label ID="lblAddCountry" runat="server" Text="Add Country" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" Font-Names="Calibri" Font-Size="Small" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblRegion" runat="server" Text="Region" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlRegions" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
     </table>
     <table><br />
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddCountry" runat="server" Text="Add Country" CssClass="silverButton" OnClick="btnAddCountry_Click"/>
            </td>
        </tr>
     </table>
</asp:Content>
