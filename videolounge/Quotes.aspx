<%@ Page Title="Quotes" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Quotes.aspx.cs" Inherits="videolounge.Quotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblQuotes" runat="server" Text="Quotes" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMessageHeader" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
   </table> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="float:left; width:20px">
        <asp:ListBox ID="lstOpportunities" runat="server" AutoPostBack="True" CssClass="compactListbox2"
            Height="260px" ToolTip="Select opportunity number from list box to load the details"
            OnSelectedIndexChanged="lstOpportunities_SelectedIndexChanged"></asp:ListBox>
    </div>
    
   <table>
        <tr>
            <td>
                <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="fancyLabel2"></asp:Label> 
            </td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server" ReadOnly="true" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="fancyLabel"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtIndustry" runat="server" ReadOnly="true" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblAgency" runat="server" Text="Agency/Clients" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAgency" runat="server" ReadOnly="true" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
            </td>
       </tr>
       <tr>
            <td>
                <asp:Label ID="lblEntity" runat="server" Text="Entity/Company" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEntity" runat="server" ReadOnly="true" Font-Names="Calibri" Font-Size="12px" Width="180px"></asp:TextBox>
            </td>
       </tr>
    </table><p></p>

    <table>
        <tr>
            <td>
                <asp:Label ID="lblOpportunityDescription" runat="server" Text="Opportunity" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOpportunityDescription" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblCampaign" runat="server" Text="Campaign" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCampaign" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDateLastContact" runat="server" Text="Date Of Last Contact" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDateLastContact" runat="server" Width="100px" Font-Size="Small" Font-Names="Calibri"></asp:TextBox>&nbsp;
                <asp:Label ID="lblMessage" runat="server" ForeColor="Black" Font-Bold="True" 
                    Font-Size="Smaller"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDateNextContact" runat="server" Text="Date Of Next Contact" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDateNextContact" runat="server" Width="100px" Font-Size="Small" Font-Names="Calibri"></asp:TextBox>&nbsp;
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="lblOutcomeLastContact" runat="server" Text="Outcome Of Last Contact" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOutcomeLastContact" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblNextActionRequired" runat="server" Text="Next Action Required" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNextActionRequired" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDebbieComments" runat="server" Text="Debbie Comments" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDebbieComments" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtStatus" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblLikelihood" runat="server" Text="Likelihood" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <fieldset>
                    <asp:RadioButton ID="radioHighlyLikely" runat="server" Text="Highly Likely" GroupName="Likelihood" CssClass="single-line-panel" AutoPostBack="true" 
                        oncheckedchanged="radioHighlyLikely_CheckedChanged"/>&nbsp;
                    <asp:RadioButton ID="radioLikely" runat="server" Text="Likely" GroupName="Likelihood" CssClass="single-line-panel" AutoPostBack="true" 
                        oncheckedchanged="radioLikely_CheckedChanged"/>&nbsp;
                    <asp:RadioButton ID="radioLessLikely" runat="server" Text="Less Likely" GroupName="Likelihood" CssClass="single-line-panel" AutoPostBack="true" 
                        oncheckedchanged="radioLessLikely_CheckedChanged"/>&nbsp;
                    <asp:RadioButton ID="radioInThePipeline" runat="server" Text="In The Pipeline" GroupName="Likelihood" CssClass="single-line-panel" AutoPostBack="true" 
                        oncheckedchanged="radioInThePipeline_CheckedChanged"/>
                </fieldset>
            </td>
            <td>
                <asp:Label ID="lblBudget" runat="server" Text="Budget" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBudget" runat="server" Font-Names="Calibri" Font-Size="12px" Width="350px" MaxLength="19"></asp:TextBox>
            </td>
        </tr>
            <td>
                <asp:Label ID="lblLastUpdatedBy" runat="server" Text="Last Updated By" CssClass="fancyLabel2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLastUpdatedBy" runat="server" Font-Names="Calibri" Font-Size="12px" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td>
                <br /><asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="silverButton" ToolTip="Click here to update this quote" onclick="btnUpdate_Click"/>
            </td>
        </tr>
    </table>

</asp:Content>
