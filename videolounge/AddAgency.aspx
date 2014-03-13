<%@ Page Title="Add Agency" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddAgency.aspx.cs" Inherits="videolounge.AddAgency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblAddAgencyHeader" runat="server" Text="Add Agency" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
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
                <asp:Label ID="lblAddAgency" runat="server" Text="Add Agency" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAgency" runat="server" Font-Names="Calibri" Font-Size="Small" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAdditionalInfo" runat="server" Text="Additional Info" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAdditionalInfo" runat="server" Font-Names="Calibri" Font-Size="Small" Width="250px" TextMode="MultiLine" Rows="5"></asp:TextBox>
            </td>
        </tr>
     </table>
     <table><br />
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddAgency" runat="server" Text="Add Agency" CssClass="silverButton" OnClick="btnAddAgency_Click"/>
            </td>
        </tr>
     </table>
</asp:Content>
