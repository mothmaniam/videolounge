<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popup-calendar.aspx.cs" Inherits="videolounge.popup_calendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">

                function passDateValue(CtlID, DateValue) {
                    window.opener.document.getElementById(CtlID).value = DateValue;
                    window.close();
                }  
      
    </script>  

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#CD335F"
            BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
            Font-Size="8pt" ForeColor="#EB5182" Height="200px" Width="220px" OnDayRender="Calendar1_DayRender">
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#E0357F" ForeColor="#E23175" />
            <WeekendDayStyle BackColor="#CCCCFF" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
            Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
        </asp:Calendar>
    </div>
    </form>
</body>
</html>
