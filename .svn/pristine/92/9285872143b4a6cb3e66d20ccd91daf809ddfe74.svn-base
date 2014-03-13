<%@ Page Title="Edit Appointment" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EditAppointment.aspx.cs" Inherits="videolounge.EditAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left:250px">
        <tr>
            <td>
                <asp:Label ID="lblEditAppointment" runat="server" Text="Edit/Delete Appointment" ForeColor="#4D6095" Font-Bold="true"></asp:Label>
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

       function Validate() {
           var yes = confirm("Are you sure you want to delete this appointment?");
           if (yes) {
               Page_ClientValidate();
               return Page_IsValid;
           }
           return false;
       }
	
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="margin-left:-40px">
        <table>
        <tr>
            <td>
                <asp:Label ID="lblEmployee" runat="server" Text="Employee" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAppointments" runat="server" Text="Appointments" CssClass="fancyLabel"></asp:Label>            
            </td>
            <td>
                <asp:ListBox ID="lstAppointments" runat="server" CssClass="compactListbox3" AutoPostBack="True"
                    OnSelectedIndexChanged="lstAppointments_SelectedIndexChanged" Height="230px" ToolTip="Select appointment to load its details"></asp:ListBox>
            </td>
        </tr>
        </table>
    </div>

    <fieldset style="margin-top:-250px; margin-left:160px">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblAppointmentDate" runat="server" Text="Appointment Date" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnOpenCalendar" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar();"/>&nbsp;
                <asp:TextBox ID="txtAppointmentDate" runat="server" CssClass="fancyLabel"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="lblAppointmentTime" runat="server" Text="Appointment Time" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAppointmentTime" runat="server" CssClass="fancyLabel" placeholder="HH:MM"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAppointmentDescription" runat="server" Text="Appointment Description" CssClass="fancyLabel"></asp:Label>
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
                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>&nbsp;
                <asp:Label ID="lblOr" runat="server" Text="Or" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:Label ID="lblCountry" runat="server" Text="Appointment Country" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCompany" runat="server" Text="Company" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCompany" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
    </table>
    </fieldset>

    <table style="margin-left:350px">
         <tr>
            <td>
                <br /><asp:Button ID="btnEditAppointment" runat="server" Text="Edit Appointment" CssClass="silverButton" OnClick="btnEditAppointment_Click"/>
                &nbsp;<asp:Label ID="Label1" runat="server" Text="Or" CssClass="fancyLabel"></asp:Label>&nbsp;
            </td>
            <td>
                <br /><asp:Button ID="btnDeleteAppointment" runat="server" Text="Delete Appointment" CssClass="silverButton"
                OnClick="btnDeleteAppointment_Click" OnClientClick="return Validate()"/>
            </td>
        </tr>
    </table>

</asp:Content>
