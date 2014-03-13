<%@ Page Title="Appointments" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddAppointment.aspx.cs" Inherits="videolounge.Appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblAddAppointment" runat="server" Text="Add Appointment" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMessageHeader" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
   </table>

   <script type="text/javascript">

       function openCalendar() {
           window.open('popup-calendar.aspx?ctlid=<%=txtAppointmentDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }
	
    </script>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <table style="margin-left:-30px; margin-top:15px">
        <tr>
            <td>
                <asp:Label ID="lblAppointmentDate" runat="server" Text="Appointment Date" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnOpenCalendar" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar();"/>
                &nbsp;<asp:TextBox ID="txtAppointmentDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lnlAppointmentTime" runat="server" Text="Appointment Time" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAppointmentTime" runat="server" Font-Names="Calibri" Font-Size="Small" placeholder="HH:MM"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAppointmentDescription" runat="server" Text="Description" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAppointmentDescription" runat="server" Font-Names="Calibri" Font-Size="Small" Width="350px" TextMode="MultiLine" Rows="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAppointmentLocation" runat="server" Text="Appointment Location" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                <asp:Label ID="lblOr" runat="server" Text="Or" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:Label ID="lblAppointmentCountry" runat="server" Text="Appointment Country" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmployee" runat="server" Text="Employee" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCompany" runat="server" Text="Entity/Company" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCompany" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddAppointment" runat="server" Text="Add Appointment" CssClass="silverButton" OnClick="btnAddAppointment_Click"/>
            </td>
        </tr>
     </table>
</asp:Content>
