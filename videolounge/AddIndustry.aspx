<%@ Page Title="Add Industry" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddIndustry.aspx.cs" Inherits="videolounge.AddIndustry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblAddIndustryHeader" runat="server" Text="Add Industry" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
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
                <asp:Label ID="lblAddIndustry" runat="server" Text="Add Industry" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtIndustry" runat="server" Font-Names="Calibri" Font-Size="Small" Width="250px"></asp:TextBox>
            </td>
        </tr>
     </table>
     <table><br />
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddIndustry" runat="server" Text="Add Industry" CssClass="silverButton" OnClick="btnAddIndustry_Click"/>
            </td>
        </tr>
     </table>
</asp:Content>
