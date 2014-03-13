<%@ Page Title="Add Marketing Action" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddMa.aspx.cs" Inherits="videolounge.AddMa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblAddMA" runat="server" Text="Add Marketing Action" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMessageHeader" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
   </table>

   <script type="text/javascript">

       function openCalendar() {
           window.open('popup-calendar.aspx?ctlid=<%=txtDateLastContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendar2() {
           window.open('popup-calendar2.aspx?ctlid=<%=txtDateNextContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }
	
	
    </script>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblEmployee" runat="server" Text="Employee" CssClass="fancyLabel"></asp:Label> 
            </td>
            <td>
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="fancyLabel"></asp:Label> 
            </td>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="fancyLabel"></asp:Label>    
            </td>
            <td>
                <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblAgency" runat="server" Text="Agency/Clients" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlAgency" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
            </td>
        </tr/>
        <tr>
            <td>
                <asp:Label ID="lblCompany" runat="server" Text="Entity/Company" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEntity" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblOpportunityDescription" runat="server" Text="Opportunity" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOpportunityDescription" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDateLastContact" runat="server" Text="Date Of Last Contact" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnDateLastContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar();"/>&nbsp;
                <asp:TextBox ID="txtDateLastContact" runat="server" CssClass="fancyLabel" Width="80px"></asp:TextBox>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Black" Font-Bold="True" Font-Size="Smaller"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDateNextContact" runat="server" Text="Date Of Next Contact" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnDateNextContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar2();"/>&nbsp;
                <asp:TextBox ID="txtDateNextContact" runat="server" CssClass="fancyLabel" Width="80px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblOutcomeLastContact" runat="server" Text="Outcome Of Last Contact" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOutcomeLastContact" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblNextActionRequired" runat="server" Text="Next Action Required" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNextActionRequired" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDebbieComments" runat="server" Text="Debbie Comments" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDebbieComments" runat="server" TextMode="MultiLine" Rows="7" Font-Names="Calibri" Font-Size="12px" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td>
                <asp:Button ID="btnAddMA" runat="server" Text="Add" CssClass="silverButton" onclick="btnAddMA_Click" ToolTip="Click here to add this marketing action"/>
            </td>
        </tr>
    </table>
</asp:Content>
