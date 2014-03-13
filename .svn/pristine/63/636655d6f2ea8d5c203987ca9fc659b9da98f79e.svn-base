<%@ Page Title="Live Jobs" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LiveJobs.aspx.cs" Inherits="videolounge.LiveJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">

        function openCalendar() {
            window.open('popup-calendar.aspx?ctlid=<%=txtLiveJobsCalendarDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
            return false;
        }

        function openCalendarForDateLastContact() {
            window.open('popup-calendar.aspx?ctlid=<%=txtLiveJobsDateLastContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
            return false;
        }

        function openCalendarForDateNextContact() {
            window.open('popup-calendar.aspx?ctlid=<%=txtLiveJobsDateNextContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
            return false;
        }
        

    </script>

    <table style="margin-left: 250px">
        <tr>
            <td>
                <asp:label id="lblLiveJobs" runat="server" text="Live Jobs" forecolor="#4D6095" font-bold="true"></asp:label>
            </td>
            <td>
                <asp:label id="lblMessageHeader" runat="server" forecolor="Red" font-bold="true"></asp:label>
            </td>
        </tr>
    </table>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div style="margin-left:-30px;" class="fancyLabel">
        <asp:Panel ID="pnlLiveJobs" runat="server" GroupingText="Live Jobs">
                <asp:RadioButton ID="radioViewLiveJobs" runat="server" CssClass="fancyLabel" Text="View All" AutoPostBack="true"
                    GroupName="livejobs" OnCheckedChanged="radioViewLiveJobs_CheckedChanged"/>&nbsp;
				<asp:RadioButton ID="radioViewLiveJobsReport" runat="server" CssClass="fancyLabel" Text="View Report" AutoPostBack="true"
                    GroupName="livejobs" OnCheckedChanged="radioViewLiveJobsReport_CheckedChanged"/>
        </asp:Panel>
     </div>

     <div id="divLiveJobs" runat="server">
     
        <table style="margin-left: 0px;">
                <tr>
                    <td>
                        <asp:Label ID="lblLiveJobName" runat="server" Text="Job Name" CssClass="fancyLabel4"></asp:Label>            
                     </td>
                     <td>
                        <asp:ListBox ID="lstLiveJobs" runat="server" AutoPostBack="True" CssClass="compactListboxAppointments"
	                        Height="260px" ToolTip="Select a job to view its details" OnSelectedIndexChanged="lstLiveJobs_SelectedIndexChanged" Width="160px">
                        </asp:ListBox>
                     </td>
                </tr>
       </table>

       <div>
            <table style="margin-left: 240px; margin-top:-250px">
            <tr>
                <td>
                    <asp:Label ID="lblEmployee" runat="server" Text="Employee" CssClass="fancyLabel7"></asp:Label> 
                </td>
                <td>
                         <asp:DropDownList ID="ddlLiveJobsEmployee" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
	                        <asp:Label ID="lblLiveJobsAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlLiveJobsAgency" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLiveJobsCountry" runat="server" Text="Country" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLiveJobsCountry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblLiveJobsIndustry" runat="server" Text="Industry" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLiveJobsIndustry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblLiveJobsJobName" runat="server" Text="Job Name" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLiveJobsJobName" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblLiveJobsDate" runat="server" Text="Date" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnLiveJobsOpenCalendarDate" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar();"/>&nbsp;
                            <asp:TextBox ID="txtLiveJobsCalendarDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblLiveJobsDateLastContact" runat="server" Text="Date Last Contact" CssClass="fancyLabel8"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnLiveJobsDateLastContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForDateLastContact();"/>&nbsp;
                            <asp:TextBox ID="txtLiveJobsDateLastContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblLiveJobsDateNextContact" runat="server" Text="Date Next Contact" CssClass="fancyLabel2"></asp:Label>                            
                        </td>
                        <td>
                            <asp:Button ID="btnLiveJobsDateNextContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForDateNextContact();"/>&nbsp;
                            <asp:TextBox ID="txtLiveJobsDateNextContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblLiveJobsOutcomeLastContact" runat="server" Text="Last Outcome" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLiveJobsOutcomeLastContact" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblLiveJobsNextActionRequired" runat="server" Text="Next Action" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLiveJobsNextActionRequired" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblLiveJobsValue" runat="server" Text="Value" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLiveJobsValue" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblLiveJobsJobActive" runat="server" Text="Job Active?" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButton ID="radioJobActiveYes" runat="server" Text="Yes" GroupName="active" AutoPostBack="true" CssClass="fancyLabel" 
                                oncheckedchanged="radioJobActiveYes_CheckedChanged"/>&nbsp;
                            <asp:RadioButton ID="radioJobActiveNo" runat="server" Text="No" GroupName="active" AutoPostBack="true" CssClass="fancyLabel" 
                                oncheckedchanged="radioJobActiveNo_CheckedChanged"/>&nbsp;
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblCompany" runat="server" Text="Company" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLiveJobsCompany" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblStage" runat="server" Text="Stage" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLiveJobsStage" runat="server" CssClass="fancyLabel" ReadOnly="true"></asp:TextBox>
                        </td>
                     </tr>
                     
                </table>
                </div>

                <div id="div2" runat="server" style="margin-left:500px;">
                    <table>
	                    <tr>
		                    <td>
			                    <asp:Button ID="btnLiveJobs" runat="server" Text="Save Changes" CssClass="silverButton" OnClick="btnLiveJobs_Click"/>
                            </td>
                        </tr>
                    </table>
                </div>
        </div>
</asp:Content>
