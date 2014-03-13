<%@ Page Title="Debt Collection" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddDebt.aspx.cs" Inherits="videolounge.DebtCollection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblDebtCollection" runat="server" Text="Add Debt" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMessageHeader" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
   </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div style="float:left; width:20px">
        <asp:ListBox ID="lstQuotes" runat="server" AutoPostBack="True" CssClass="compactListbox2"
            Height="260px" ToolTip="Select quote from list box to load the details"
            OnSelectedIndexChanged="lstQuotes_SelectedIndexChanged"></asp:ListBox>
    </div>

    <table>
        <tr>
            <td>
                <asp:Label ID="lblAgencyClient" runat="server" Text="Agency/Client" CssClass="fancyLabel2"></asp:Label> 
            </td>
            <td>
                <asp:TextBox ID="txtAgencyClient" runat="server" ReadOnly="true" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
           </td>
           <td>
                <asp:Label ID="lblCompany" runat="server" Text="Entity/Company" CssClass="fancyLabel2"></asp:Label> 
           </td>
           <td>
                <asp:TextBox ID="txtCompany" runat="server" ReadOnly="true" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
           </td>
       </tr>
       <tr>
           <td>
                <asp:Label ID="lblCampaign" runat="server" Text="Campaign" CssClass="fancyLabel2"></asp:Label> 
           </td>
           <td>
                <asp:TextBox ID="txtCampaign" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
           </td>
           <td>
                <asp:Label ID="lblQuoteStatus" runat="server" Text="Quote Status" CssClass="fancyLabel2"></asp:Label> 
           </td>
           <td>
                <asp:TextBox ID="txtQuoteStatus" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
           </td>
       </tr>
       <tr>
        <td>
            <asp:Label ID="lblRandAmount" runat="server" Text="Rand Amount" CssClass="fancyLabel2"></asp:Label> 
        </td>
        <td>
            <asp:TextBox ID="txtRandAmount" runat="server" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="lblNairaAmount" runat="server" Text="Naira Amount" CssClass="fancyLabel2"></asp:Label> 
        </td>
        <td>
            <asp:TextBox ID="txtNairaAmount" runat="server" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
        </td>
       </tr>
       <tr>
            <td>
                <asp:Label ID="lblQuoteComments" runat="server" Text="Comments" CssClass="fancyLabel2"></asp:Label> 
            </td>
            <td>
                <asp:TextBox ID="txtQuoteComments" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
       </tr>
       <tr>
            <td colspan="2"></td>
            <td>
                <asp:Button ID="btnAddDebt" runat="server" Text="Add to Debt Collection" CssClass="silverButton" onclick="btnAddDebt_Click"/>
            </td>
        </tr>
    </table><p></p>

</asp:Content>
