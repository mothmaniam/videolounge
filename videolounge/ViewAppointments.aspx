<%@ Page Title="View Appointments" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ViewAppointments.aspx.cs" Inherits="videolounge.ViewAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left: 250px">
        <tr>
            <td>
                <asp:Label ID="lblViewAppointments" runat="server" Text="View Appointments" ForeColor="#4D6095"
                    Font-Bold="true"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblMessageHeader" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div style="margin-left:400px">
        <asp:Button ID="btnPrintAppointmentReport" runat="server" Text="Print Report" CssClass="silverButton" OnClick="btnPrintAppointmentReport_Click"/>
    </div>

    <div style="margin-left:-42px">
    
    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
        BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" OnDayRender="Calendar1_DayRender"
        SelectionMode="None" ShowNextPrevMonth="False" Height="200px" Width="100%" 
        FirstDayOfWeek="Monday" DayNameFormat="Shortest" ShowGridLines="True">
        <DayStyle Height="50px" />
        <SelectedDayStyle BackColor="#CCCCFF" BorderColor="#CCFF99" BorderStyle="Solid" 
            BorderWidth="2px" Font-Bold="True" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <DayHeaderStyle Font-Bold="True" BackColor="#FFCC66" Height="1px" />
        <SelectorStyle BackColor="#FFCC66" />
        <TitleStyle BackColor="#D29487" Font-Bold="True"
            Font-Size="9pt" ForeColor="#FFFFCC" />
    </asp:Calendar>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:videoloungeConnectionString %>" 
        SelectCommand="SELECT * FROM [Appointments] WHERE Appointment_Date = @DateIn">
        <SelectParameters>
            <asp:Parameter Name="DateIn" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>