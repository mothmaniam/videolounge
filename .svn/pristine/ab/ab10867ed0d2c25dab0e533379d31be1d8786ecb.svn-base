<%@ Page Title="Daily Actions" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DailyActions.aspx.cs" Inherits="videolounge.DailyActions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left: 250px">
        <tr>
            <td>
                <asp:label id="lblDailyActions" runat="server" text="Daily Actions" forecolor="#4D6095" font-bold="true"></asp:label>
            </td>
            <td>
                <asp:label id="lblMessageHeader" runat="server" forecolor="Red" font-bold="true"></asp:label>
            </td>
        </tr>
    </table>
    
    <script type="text/javascript">

        function openCalendar() {
            window.open('popup-calendar.aspx?ctlid=<%=txtSearchDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
            return false;
        }
	
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="margin-left: -40px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblEmployee" runat="server" Text="Select Employee" CssClass="fancyLabel"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlEmployees_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>

    <table style="margin-left: -40px; margin-top: 15px">
        <tr>
            <td>
                <asp:Label ID="lblSortCountry" runat="server" Text="Country" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:Label ID="lblSortIndustry" runat="server" Text="Industry" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlIndustry" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlIndustry_SelectedIndexChanged"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:Label ID="lblSortEntity" runat="server" Text="Entity/Company" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlEntity" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlEntity_SelectedIndexChanged"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAgency" runat="server" Text="Agency" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlAgency" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlAgency_SelectedIndexChanged"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:Label ID="lblSortDateNextContact" runat="server" Text="Date Next Contact" CssClass="fancyLabel"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlMonths" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlMonths_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                <asp:Label ID="lblOr" runat="server" Text="OR" CssClass="fancyLabel"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnOpenCalendar" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar();"/>&nbsp;
                <asp:TextBox ID="txtSearchDate" runat="server" CssClass="fancyLabel" Width="80px"></asp:TextBox>&nbsp;
                <asp:Button ID="btnSearch" runat="server" CssClass="buttonsmd" Text="Search" OnClick="btnSearch_Click" Width="50px"/>
            </td>
        </tr>
    </table><br />

    <asp:GridView ID="gridOpportunities" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" CssClass="fancyGridLabel" ForeColor="#333333" 
        GridLines="None" AllowPaging="True" AllowSorting="True" 
        EmptyDataText="No results..." EnableSortingAndPagingCallbacks="True" 
        ShowHeaderWhenEmpty="True" Width="100%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>

            <asp:BoundField DataField="Employee" HeaderText="Employee" ItemStyle-HorizontalAlign="Center"/>
            
           <%-- <asp:BoundField DataField="Country" HeaderText="Country" />

            <asp:BoundField DataField="Job_Industry" HeaderText="Industry" ItemStyle-HorizontalAlign="Center"/>--%>

            <asp:BoundField DataField="Agency" HeaderText="Agency" ItemStyle-HorizontalAlign="Center" />

            <asp:BoundField DataField="Company_Name" HeaderText="Company Name/Entity" ItemStyle-HorizontalAlign="Center" />

            <asp:BoundField DataField="Opportunity_Name" HeaderText="Job Name" ItemStyle-HorizontalAlign="Center" />

            <%--<asp:BoundField DataField="Date_Last_Contact" HeaderText="Date of Last Contact" ItemStyle-HorizontalAlign="Center" />

            <asp:BoundField DataField="Outcome_Last_Contact" HeaderText="Outcome of Last Contact" ItemStyle-HorizontalAlign="Center" />--%>

            <asp:BoundField DataField="Next_Action_Required" HeaderText="Next Action Required" ItemStyle-HorizontalAlign="Center" />

            <asp:BoundField DataField="Date_Next_Contact" HeaderText="Date of Next Contact" ItemStyle-HorizontalAlign="Center" />

            <%--<asp:BoundField DataField="Debbie_Comments" HeaderText="Debbie's Comments" ItemStyle-HorizontalAlign="Center"/>--%>

            <%--<asp:BoundField DataField="Opportunity_Stage" HeaderText="Opportunity Stage" ItemStyle-HorizontalAlign="Center" />--%>
        </Columns>

        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

</asp:Content>