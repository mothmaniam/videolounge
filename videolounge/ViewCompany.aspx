﻿<%@ Page Title="View/Edit Company" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewCompany.aspx.cs" Inherits="videolounge.EditCompany" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="css/stylesheet2.css" rel="stylesheet" type="text/css" />
    <link href="css/stylesheet.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        function openContacts() {
            window.open('ViewCompanyContacts.aspx', 'Contact Persons', 'scrollbars=no,resizable=no,width=800,height=300,left=300');
            return false;
        }

        function openNotes() {
            window.open('ViewCompanyNotes.aspx', 'Contact Persons', 'scrollbars=no,resizable=no,width=700,height=460,left=300');
            return false;
        }

       function openCalendar() {
           window.open('popup-calendar.aspx?ctlid=<%=txtAppointmentDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendar2() {
           window.open('popup-calendar.aspx?ctlid=<%=txtEditAppointmentDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendarForPipeline() {
           window.open('popup-calendar.aspx?ctlid=<%=txtPipelineCalendarDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendarForPipelineDateLastContact() {
           window.open('popup-calendar.aspx?ctlid=<%=txtPipelineDateLastContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }
       
       function openCalendarForPipelineDateLastContactEdit() {
           window.open('popup-calendar.aspx?ctlid=<%=txtEditPipelineDateLastContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendarForPipelineDateNextContactEdit() {
           window.open('popup-calendar.aspx?ctlid=<%=txtEditPipelineDateNextContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }
       
       function openCalendarForPipelineDateNextContact() {
           window.open('popup-calendar.aspx?ctlid=<%=txtPipelineDateNextContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendarForQuotes() {
           window.open('popup-calendar.aspx?ctlid=<%=txtQuotesCalendarDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendarForDebt() {
           window.open('popup-calendar.aspx?ctlid=<%=txtDebtCalendarDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }       

       function openCalendarForQuotesDateLastContactEdit() {
           window.open('popup-calendar.aspx?ctlid=<%=txtQuotesDateLastContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }

       function openCalendarForQuotesDateNextContactEdit() {
           window.open('popup-calendar.aspx?ctlid=<%=txtQuotesDateNextContact.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
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

       function openCalendarForPipelineEdit() {
           window.open('popup-calendar.aspx?ctlid=<%=txtEditPipelineCalendarDate.ClientID%>', 'Calendar', 'scrollbars=no,resizable=no,width=240,height=220,left=300');
           return false;
       }
	
    </script>

    <table style="margin-left: 250px">
        <tr>
            <td>
                <asp:label id="lblEditCompanyHeader" runat="server" text="View/Edit Company" forecolor="#4D6095" font-bold="true"></asp:label>
            </td>
            <td>
                <asp:label id="lblMessageHeader" runat="server" forecolor="Red" font-bold="true"></asp:label>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"/>

    <div id="divTabs" runat="server" style="margin-left:-40px; background-color: #E48383;">

    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="ajax__tab_msngallery-theme">
        <ajaxToolkit:TabPanel ID="tabPanelDefaultView" runat="server" HeaderText="Company" CssClass="tabs">
            <ContentTemplate>
            
            <div>
                <asp:RadioButton ID="radioCompanyTypeAdAgency" runat="server" Text="Ad Agency" 
                    AutoPostBack="True" CssClass="fancyLabel" 
                    OnCheckedChanged="radioCompanyTypeAdAgency_CheckedChanged" 
                    GroupName="channelAdAgency"/>&nbsp;
                <asp:RadioButton ID="radioCompanyTypeCorporate" runat="server" Text="Corporate" 
                    AutoPostBack="True" CssClass="fancyLabel" 
                    OnCheckedChanged="radioCompanyTypeCorporate_CheckedChanged" 
                    GroupName="channelAdAgency"/>&nbsp;
                <asp:RadioButton ID="radioCompanyTypeAll" runat="server" Text="All" 
                    AutoPostBack="True" CssClass="fancyLabel" 
                    OnCheckedChanged="radioCompanyTypeAll_CheckedChanged" 
                    GroupName="channelAdAgency"/>&nbsp;    
                <p></p>
            </div>

            <div style="float:left; width:20px" class="MyTabStyle">

                <asp:ListBox ID="lstCompanies" runat="server" AutoPostBack="True" CssClass="compactListbox5"
                    Height="300px" ToolTip="Select company name from list to load company details" 
                    OnSelectedIndexChanged="lstCompanies_SelectedIndexChanged">
                </asp:ListBox>
            </div>
            
            <table style="margin-left: 180px; margin-top: 0px">
                <tr>
                    <td>
                        <asp:Label ID="lblMarketer" runat="server" Text="Marketer" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMarketer" runat="server" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblLeadSourced" runat="server" Text="How/Where Lead Sourced" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLeadSourced" runat="server" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblAddCompany" runat="server" Text="Company Name" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server" CssClass="fancyLabel" Width="250px" 
                            Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblAffiliatedTo" runat="server" Text="Affiliated To" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAffiliatedTo" runat="server" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblLandline" runat="server" Text="Landline" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLandline" runat="server" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblWebsite" runat="server" Text="Website" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWebsite" runat="server" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblChannel" runat="server" Text="Channel" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="radioAdAgency" runat="server" Text="Ad Agency" 
                            CssClass="fancyLabel" AutoPostBack="True" GroupName="channel" 
                            oncheckedchanged="radioAdAgency_CheckedChanged" />&nbsp;
                        <asp:RadioButton ID="radioCorporate" runat="server" Text="Corporate" 
                            CssClass="fancyLabel" AutoPostBack="True" GroupName="channel" 
                            oncheckedchanged="radioCorporate_CheckedChanged" />&nbsp;
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="ddl"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblAdAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtClients" runat="server" CssClass="fancyLabel" Width="250px" 
                            Visible="False" placeholder="Client 1, Client 2"></asp:TextBox>
                        <asp:TextBox ID="txtAdAgency" runat="server" CssClass="fancyLabel" 
                            Width="250px" Visible="False" placeholder="Ad Agency 1, Ad Agency 2"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblTypeOfWork" runat="server" Text="Type of Work" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTypeOfWork" runat="server" CssClass="fancyLabel" Width="250px" placeholder="Food/Bank/Retailer etc"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblPhysicalAddress" runat="server" Text="Physical Address" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhysicalAddress" runat="server" TextMode="MultiLine" Rows="5" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblPostalAddress" runat="server" Text="Postal Address" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalAddress" runat="server" TextMode="MultiLine" Rows="5" CssClass="fancyLabel" Width="250px"></asp:TextBox>
                    </td>
                    </tr>
                    
                 <tr>
                    <td>
                        <asp:Label ID="lblProducers" runat="server" Text="Producers" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblProducersLocal" runat="server" Text="Local" CssClass="fancyLabel"></asp:Label>&nbsp;
                        <asp:TextBox ID="txtProducersLocal" runat="server" CssClass="fancyLabel" Width="250px" placeholder="E.g: The Video Lounge, Cape Films, DV Works"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblProducersInternational" runat="server" Text="International" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProducersInternational" runat="server" CssClass="fancyLabel" Width="250px" placeholder="E.g: The Video Lounge, Cape Films, DV Works"></asp:TextBox>
                    </td>
                  </tr>
                  
                  <tr>
                     <td>
                         <asp:Label ID="lblDirectors" runat="server" Text="Directors" CssClass="fancyLabel3"></asp:Label>&nbsp;
                     </td>
                     <td>
                         <asp:Label ID="lblDirectorsLocal" runat="server" Text="Local" CssClass="fancyLabel"></asp:Label>&nbsp;
                         <asp:TextBox ID="txtDirectorsLocal" runat="server" CssClass="fancyLabel" Width="250px" placeholder="E.g: The Video Lounge, Cape Films, DV Works"></asp:TextBox>
                     </td>
                     <td>
                         <asp:Label ID="lblDirectorsInternational" runat="server" Text="International" CssClass="fancyLabel2"></asp:Label>
                     </td>
                     <td>
                         <asp:TextBox ID="txtDirectorsInternational" runat="server" CssClass="fancyLabel" Width="250px" placeholder="E.g: The Video Lounge, Cape Films, DV Works"></asp:TextBox>
                     </td>
                  </tr>

                  <tr>
                    <td>
                        <asp:Label ID="lblProduceInSA" runat="server" Text="Produce In SA?" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="radioProdSAYes" runat="server" Text="Yes" AutoPostBack="True" CssClass="fancyLabel" GroupName="prodsa"/>&nbsp;
                        <asp:RadioButton ID="radioProdSANo" runat="server" Text="No" AutoPostBack="True" CssClass="fancyLabel" GroupName="prodsa"/>
                     </td>
                  </tr>
                     
                  <tr>
                    <td>
                        <asp:Label ID="lblProduceInCountries" runat="server" Text="Produce In" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:ListBox ID="lstCountries" runat="server" CssClass="fancyLabel"></asp:ListBox>&nbsp;
                        <asp:Button ID="btnAddtoPIC" runat="server" Text="&gt;&gt;" onclick="btnAddtoPIC_Click" />
                        <asp:Button ID="btnRemoveFromPIC" runat="server" Text="&lt;&lt;" onclick="btnRemoveFromPIC_Click" />
                        <asp:ListBox ID="lstCountriesAdded" runat="server" CssClass="fancyLabel"></asp:ListBox>
                     </td>
                  </tr>
                  
                  <tr>
                    <td>
                        <asp:Label ID="lblAgencyClients" runat="server" Text="Agency Clients" CssClass="fancyLabel3"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAgencyClients" runat="server" CssClass="fancyLabel" Width="250px" placeholder="Agency 1, Agency 2"></asp:TextBox>
                    </td>
                   </tr>
                   
                   <tr>
	                    <td>
		                    <asp:Label ID="lblContactPersons" runat="server" Text="Contact Persons" CssClass="fancyLabel3"></asp:Label>
                        </td>                       
                        <td>
		                    <asp:LinkButton ID="lnkContactPersons" runat="server" Text="View/Add/Edit/Remove Contacts" CssClass="fancyLabel" OnClientClick="javascript:return openContacts();"/>&nbsp;
                        </td>
                    </tr>
                    <tr>
	                    <td>
		                    <asp:Label ID="lblMeetings" runat="server" Text="Notes" CssClass="fancyLabel3"></asp:Label>
                        </td>                      
                        <td>
		                    <asp:LinkButton ID="lnkContactNotes" runat="server" 
                                Text="View/Add/Edit/Remove Notes" CssClass="fancyLabel" 
                                OnClientClick="javascript:return openNotes();"/>&nbsp;
                        </td>
                    </tr>
                        
                    <tr>
	                    <td>
		                    <asp:Button ID="btnEdit" runat="server" Text="Save Changes" CssClass="silverButton" onclick="btnEdit_Click" />
                        </td>
                    </tr>

                   </table>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabPanelJobsInPipeline" runat="server" HeaderText="Jobs in the Pipeline" CssClass="tabs">
            <ContentTemplate>

            <asp:Panel ID="pnlPipeline" runat="server" GroupingText="Jobs in the Pipeline">
                <asp:RadioButton ID="radioAddJobInPipeline" runat="server" CssClass="fancyLabel" Text="Add" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioAddJobInPipeline_CheckedChanged"/>&nbsp;
                <asp:RadioButton ID="radioEditJobInPipeline" runat="server" CssClass="fancyLabel" Text="View Active" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioEditJobInPipeline_CheckedChanged" ToolTip="View all active jobs in the pipeline"/>&nbsp;
                <asp:RadioButton ID="radioEditActiveJobInPipelineReport" runat="server" CssClass="fancyLabel" Text="View Active Report" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioEditActiveJobInPipelineReport_CheckedChanged"/>&nbsp;
                <asp:RadioButton ID="radioEditInactiveJobInPipeline" runat="server" CssClass="fancyLabel" Text="View Leads" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioEditInactiveJobInPipeline_CheckedChanged" ToolTip="Jobs in the pipeline that have not been set to active or inactive (leads)"/>&nbsp;                
                <asp:RadioButton ID="radioViewLeadsReport" runat="server" CssClass="fancyLabel" Text="View Leads Report" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioViewLeadsReport_CheckedChanged"/>&nbsp;
                <asp:RadioButton ID="radioViewInactiveLeads" runat="server" CssClass="fancyLabel" Text="View Inactive" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioViewInactiveLeads_CheckedChanged" ToolTip="View all inactive jobs in the pipeline"/>&nbsp;
                <asp:RadioButton ID="radioViewInactiveLeadsReport" runat="server" CssClass="fancyLabel" Text="View Inactive Report" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioViewInactiveLeadsReport_CheckedChanged"/>&nbsp;
                <asp:RadioButton ID="radioPrintPipelineReport" runat="server" CssClass="fancyLabel" Text="View All Report" AutoPostBack="true"
                    GroupName="pipeline" OnCheckedChanged="radioPrintPipelineReport_CheckedChanged" ToolTip="All jobs in the pipeline, regardless of whether they are active or not"/>&nbsp;
            </asp:Panel>

            <div id="divAddJobsInPipeline" runat="server">
                <table style="margin-left: 0px; margin-top:0px;">
                    <tr>
                        <td>
                            <asp:Label ID="lblPipelineEmployee" runat="server" Text="Employee" CssClass="fancyLabel"></asp:Label> 
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPipelineEmployee" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
	                        <asp:Label ID="lblPipelineAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel3"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlPipelineAgency" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPipelineCountry" runat="server" Text="Country" CssClass="fancyLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPipelineCountry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblPipelineIndustry" runat="server" Text="Industry" CssClass="fancyLabel3"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPipelineIndustry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblPipelineJobName" runat="server" Text="Job Name" CssClass="fancyLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPipelineJobName" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblPipelineDate" runat="server" Text="Date" CssClass="fancyLabel3"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnPipelineOpenCalendarDate" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForPipeline();"/>&nbsp;
                            <asp:TextBox ID="txtPipelineCalendarDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblPipelineDateLastContact" runat="server" Text="Date Last Contact" CssClass="fancyLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnPipelineDateLastContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForPipelineDateLastContact();"/>&nbsp;
                            <asp:TextBox ID="txtPipelineDateLastContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblPipelineDateNextContact" runat="server" Text="Date Next Contact" CssClass="fancyLabel3"></asp:Label>                            
                        </td>
                        <td>
                            <asp:Button ID="btnPipelineDateNextContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForPipelineDateNextContact();"/>&nbsp;
                            <asp:TextBox ID="txtPipelineDateNextContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblPipelineOutcomeLastContact" runat="server" Text="Last Outcome" CssClass="fancyLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPipelineOutcomeLastContact" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="7" Width="350px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblPipelineNextActionRequired" runat="server" Text="Next Action" CssClass="fancyLabel3"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPipelineNextActionRequired" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="7" Width="350px"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblPipelineValue" runat="server" Text="Value" CssClass="fancyLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPipelineValue" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                </table>

                <div id="div1" runat="server" style="margin-left:400px;">
                    <table>
	                    <tr>
		                    <td>
			                    <asp:Button ID="btnAddJobToPipeline" runat="server" Text="Add Job to Pipeline" CssClass="silverButton" OnClick="btnAddJobToPipeline_Click"/>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>

            <div id="divEditJobsInPipeline" runat="server">

                <table style="margin-left: 0px;">
                <tr>
                    <td>
                        <asp:Label ID="lblOpportunityName" runat="server" Text="Job Name" CssClass="fancyLabel4"></asp:Label>            
                     </td>
                     <td>
                        <asp:ListBox ID="lstPipelineOpportunities" runat="server" AutoPostBack="True" CssClass="compactListboxAppointments"
                                Height="260px" ToolTip="Select Job in the Pipeline to load its details"
                                OnSelectedIndexChanged="lstPipelineOpportunities_SelectedIndexChanged" Width="160px">
                        </asp:ListBox>
                     </td>
                </tr>
                </table>

                <div>
                <table style="margin-left: 240px; margin-top:-250px">
                    <tr>
                        <td>
                            <asp:Label ID="lblEditPipelineEmployee" runat="server" Text="Employee" CssClass="fancyLabel7"></asp:Label> 
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEditPipelineEmployee" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
	                        <asp:Label ID="lblEditPipelineAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlEditPipelineAgency" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEditPipelineCountry" runat="server" Text="Country" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEditPipelineCountry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblEditPipelineIndustry" runat="server" Text="Industry" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEditPipelineIndustry" runat="server" CssClass="ddl" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblEditPipelineJobName" runat="server" Text="Job Name" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEditPipelineJobName" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEditPipelineDate" runat="server" Text="Date" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnEditPipelineOpenCalendarDate" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForPipelineEdit();"/>&nbsp;
                            <asp:TextBox ID="txtEditPipelineCalendarDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblEditPipelineDateLastContact" runat="server" Text="Date Last Contact" CssClass="fancyLabel8"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnEditPipelineDateLastContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForPipelineDateLastContactEdit();"/>&nbsp;
                            <asp:TextBox ID="txtEditPipelineDateLastContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEditPipelineDateNextContact" runat="server" Text="Date Next Contact" CssClass="fancyLabel2"></asp:Label>                            
                        </td>
                        <td>
                            <asp:Button ID="btnEditPipelineDateNextContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForPipelineDateNextContactEdit();"/>&nbsp;
                            <asp:TextBox ID="txtEditPipelineDateNextContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblEditPipelineOutcomeLastContact" runat="server" Text="Last Outcome" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEditPipelineOutcomeLastContact" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEditPipelineNextActionRequired" runat="server" Text="Next Action" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEditPipelineNextActionRequired" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblEditPipelineValue" runat="server" Text="Value" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEditPipelineValue" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEditPipelineJobActive" runat="server" Text="Job Active?" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButton ID="radioJobActiveYes" runat="server" Text="Yes" GroupName="active" AutoPostBack="true" OnCheckedChanged="radioJobActiveYes_CheckedChanged" CssClass="fancyLabel"/>&nbsp;
                            <asp:RadioButton ID="radioJobActiveNo" runat="server" Text="No" GroupName="active" AutoPostBack="true" OnCheckedChanged="radioJobActiveNo_CheckedChanged" CssClass="fancyLabel"/>&nbsp;
                            <asp:RadioButton ID="radioJobActiveNotSet" runat="server" Text="Not Set" GroupName="active" AutoPostBack="true" CssClass="fancyLabel"/>&nbsp;
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblMoveToQuote" runat="server" Text="Move to Quote?" CssClass="fancyLabel7"></asp:Label>&nbsp;                            
                        </td>
                        <td>
                            <asp:RadioButton ID="radioMoveToQuoteYes" runat="server" Text="Yes" CssClass="fancyLabel"
                                AutoPostBack="true" GroupName="movetoquote" OnCheckedChanged="radioMoveToQuoteYes_CheckedChanged"/>
                            <asp:RadioButton ID="radioMoveToQuoteNo" runat="server" Text="No" CssClass="fancyLabel"
                                AutoPostBack="true" GroupName="movetoquote" OnCheckedChanged="radioMoveToQuoteNo_CheckedChanged"/>
                        </td>
                        <%--<td>
                            <asp:Label ID="lblJobSuccessful" runat="server" Text="Job Successful?" CssClass="fancyLabel7"></asp:Label>&nbsp;                            
                        </td>
                        <td>
                            <asp:RadioButton ID="radioJobSuccessfulYes" runat="server" Text="Yes" CssClass="fancyLabel"
                                AutoPostBack="true" GroupName="jobsuccess"/>&nbsp;
                            <asp:RadioButton ID="radioJobSuccessfulNo" runat="server" Text="No" CssClass="fancyLabel"
                                AutoPostBack="true" GroupName="jobsuccess"/>&nbsp;
                        </td>--%>
                     </tr>
                </table>
                </div>

                <div id="div2" runat="server" style="margin-left:500px;">
                    <table>
	                    <tr>
		                    <td>
			                    <asp:Button ID="btnEditPipeline" runat="server" Text="Save Changes" CssClass="silverButton" OnClick="btnEditPipeline_Click"/>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>

            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabPanelQuotes" runat="server" HeaderText="Quotes" CssClass="tabs">
            <ContentTemplate>

            <asp:Panel ID="pnlQuotes" runat="server" GroupingText="Quotes">
                <asp:RadioButton ID="radioQuotesView" runat="server" CssClass="fancyLabel" Text="View Active"
                    AutoPostBack="true" GroupName="viewquotes" OnCheckedChanged="radioQuotesView_CheckedChanged" ToolTip="View all active quotes"/>&nbsp;
                <asp:RadioButton ID="radioQuotesViewInactive" runat="server" CssClass="fancyLabel" Text="View Inactive" AutoPostBack="true"
                    GroupName="viewquotes" OnCheckedChanged="radioQuotesViewInactive_CheckedChanged" ToolTip="View all inactive quotes"/>&nbsp;
                <asp:RadioButton ID="radioQuotesViewReport" runat="server" CssClass="fancyLabel" Text="View All Active Report"
                    AutoPostBack="true" GroupName="viewquotes" OnCheckedChanged="radioQuotesViewReport_CheckedChanged"/>&nbsp;
                <asp:RadioButton ID="radioQuotesViewInactiveReport" runat="server" CssClass="fancyLabel" Text="View All Inactive Report"
                    AutoPostBack="true" GroupName="viewquotes" OnCheckedChanged="radioQuotesViewInactiveReport_CheckedChanged"/>&nbsp;
            </asp:Panel>

                <div id="divQuotes" runat="server">
                    <table style="margin-left: 0px;">
	                    <tr>
		                    <td>
			                    <asp:Label ID="lblQuoteName" runat="server" Text="Job Name" CssClass="fancyLabel4"></asp:Label>            
                            </td>
                            <td>
			                    <asp:ListBox ID="lstQuotes" runat="server" AutoPostBack="True" CssClass="compactListboxAppointments"
				                    Height="260px" ToolTip="Select a quote to load its details"
                                    OnSelectedIndexChanged="lstQuotes_SelectedIndexChanged" Width="160px">
                                </asp:ListBox>
                            </td>
                        </tr>
                    </table>

                <div>
                <table style="margin-left: 240px; margin-top:-250px">
                    <tr>
                        <td>
                            <asp:Label ID="lblQuotesEmployee" runat="server" Text="Employee" CssClass="fancyLabel7"></asp:Label> 
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlQuotesEmployee" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                        </td>
                        <td>
	                        <asp:Label ID="lblQuotesAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
	                        <asp:DropDownList ID="ddlQuotesAgency" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblQuotesCountry" runat="server" Text="Country" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlQuotesCountry" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="lblQuotesIndustry" runat="server" Text="Industry" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlQuotesIndustry" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblQuotesJobName" runat="server" Text="Job Name" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuotesJobName" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblQuotesDate" runat="server" Text="Date" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnQuotesOpenCalendarDate" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForQuotes();"/>&nbsp;
                            <asp:TextBox ID="txtQuotesCalendarDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblQuotesDateLastContact" runat="server" Text="Date Last Contact" CssClass="fancyLabel8"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnQuotesDateLastContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForQuotesDateLastContactEdit();"/>&nbsp;
                            <asp:TextBox ID="txtQuotesDateLastContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblQuotesDateNextContact" runat="server" Text="Date Next Contact" CssClass="fancyLabel2"></asp:Label>                       
                        </td>
                        <td>
                            <asp:Button ID="btnQuotesDateNextContact" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForQuotesDateNextContactEdit();"/>&nbsp;
                            <asp:TextBox ID="txtQuotesDateNextContact" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblQuotesOutcomeLastContact" runat="server" Text="Last Outcome" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuotesOutcomeLastContact" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblQuotesNextActionRequired" runat="server" Text="Next Action" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuotesNextActionRequired" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblQuotesCampaign" runat="server" Text="Campaign" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuotesCampaign" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblQuotesStatus" runat="server" Text="Status" CssClass="fancyLabel2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuotesStatus" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblQuotesValue" runat="server" Text="Value" CssClass="fancyLabel7"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuotesValue" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblQuotesLikelihood" runat="server" Text="Likelihood" CssClass="fancyLabel7"></asp:Label>
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
                     </tr>
                     <tr>
                        <td>
                            <asp:Label ID="lblMoveToDebt" runat="server" Text="Move to Debt?" CssClass="fancyLabel7"></asp:Label>&nbsp;                            
                        </td>
                        <td>
                            <asp:RadioButton ID="radioMoveToDebtYes" runat="server" Text="Yes" CssClass="fancyLabel"
                                AutoPostBack="true" GroupName="movetodebt" OnCheckedChanged="radioMoveToDebtYes_CheckedChanged"/>
                            <asp:RadioButton ID="radioMoveToDebtNo" runat="server" Text="No" CssClass="fancyLabel"
                                AutoPostBack="true" GroupName="movetodebt" OnCheckedChanged="radioMoveToDebtYes_CheckedChanged"/>
                        </td>
                     </tr>
                </table>
                </div>

                <div id="div3" runat="server">
                    <table style="margin-left:500px;">
	                    <tr>
		                    <td>
			                    <asp:Button ID="btnEditQuotes" runat="server" Text="Save Changes" CssClass="silverButton" OnClick="btnEditQuotes_Click"/>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>

                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabPanelDebtCollection" runat="server" HeaderText="Debt Collection" CssClass="tabs">
            <ContentTemplate>

                <asp:Panel ID="pnlDebt" runat="server" GroupingText="Debt">
                    <asp:RadioButton ID="radioDebtView" runat="server" CssClass="fancyLabel" Text="View All Active"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtView_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewReport" runat="server" CssClass="fancyLabel" Text="View All Active Report"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewReport_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewPaid" runat="server" CssClass="fancyLabel" Text="View Paid"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewPaid_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewPaidReport" runat="server" CssClass="fancyLabel" Text="View Paid Report"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewPaidReport_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewUnpaid" runat="server" CssClass="fancyLabel" Text="View Unpaid"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewUnpaid_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewUnpaidReport" runat="server" CssClass="fancyLabel" Text="View Unpaid Report"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewUnpaidReport_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewCompleted" runat="server" CssClass="fancyLabel" Text="View Successful"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewCompleted_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewCompletedReport" runat="server" CssClass="fancyLabel" Text="View Successful Report"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewCompletedReport_CheckedChanged"/>&nbsp;

                    <asp:RadioButton ID="radioDebtViewIncomplete" runat="server" CssClass="fancyLabel" Text="View Unsuccessful"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewIncomplete_CheckedChanged"/>&nbsp;
                    
                    <asp:RadioButton ID="radioDebtViewIncompleteReport" runat="server" CssClass="fancyLabel" Text="View Unsuccessful"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewIncompleteReport_CheckedChanged"/>&nbsp;

                    <%--<asp:RadioButton ID="radioDebtViewInactiveReport" runat="server" CssClass="fancyLabel" Text="View Inactive Report"
                        AutoPostBack="true" GroupName="viewdebt" OnCheckedChanged="radioDebtViewInactiveReport_CheckedChanged"/>&nbsp;--%>
            </asp:Panel>

                <div id="divDebt" runat="server">
                    <table style="margin-left: 0px;">
	                    <tr>
		                    <td>
			                    <asp:Label ID="lblDebtName" runat="server" Text="Job Name" CssClass="fancyLabel4"></asp:Label>            
                            </td>
                            <td>
			                    <asp:ListBox ID="lstDebt" runat="server" AutoPostBack="True" CssClass="compactListboxAppointments"
				                    Height="260px" ToolTip="Select debt item to load its details"
                                    OnSelectedIndexChanged="lstDebt_SelectedIndexChanged" Width="160px">
                                </asp:ListBox>
                            </td>
                        </tr>
                    </table>

                    <div>
                        <table style="margin-left: 240px; margin-top:-250px">
                            <tr>
                                <td>
                                    <asp:Label ID="lblDebtEmployee" runat="server" Text="Employee" CssClass="fancyLabel7"></asp:Label> 
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDebtEmployee" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                                </td>
                                <td>
	                                <asp:Label ID="lblDebtAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
	                                <asp:DropDownList ID="ddlDebtAgency" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDebtCountry" runat="server" Text="Country" CssClass="fancyLabel7"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDebtCountry" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="lblDebtIndustry" runat="server" Text="Industry" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDebtIndustry" runat="server" CssClass="ddl" AutoPostBack="True" Enabled="false"></asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <asp:Label ID="lblDebtJobName" runat="server" Text="Job Name" CssClass="fancyLabel7"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtJobName" runat="server" CssClass="fancyLabel"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblDebtDate" runat="server" Text="Date" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="btnDebtOpenCalendarDate" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendarForDebt();"/>&nbsp;
                                    <asp:TextBox ID="txtDebtCalendarDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
                                </td>
                             </tr>
					         <tr>
                                <td>
                                    <asp:Label ID="lblDebtCampaign" runat="server" Text="Campaign" CssClass="fancyLabel7"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtCampaign" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblDebtStatus" runat="server" Text="Status" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtStatus" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                                </td>
                             </tr>
					         <tr>
                                <td>
                                    <asp:Label ID="lblDebtRandAmount" runat="server" Text="Rand Amount" CssClass="fancyLabel7"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtRandAmount" runat="server" CssClass="fancyLabel"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblDebtNairaAmount" runat="server" Text="Naira Amount" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtNairaAmount" runat="server" CssClass="fancyLabel"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDebtValue" runat="server" Text="Value" CssClass="fancyLabel7"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtValue" runat="server" CssClass="fancyLabel"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblDebtPaid" runat="server" Text="Paid?" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="radioDebtPaidYes" runat="server" Text="Yes" AutoPostBack="true" GroupName="debtpaid" CssClass="fancyLabel"/>&nbsp;
                                    <asp:RadioButton ID="radioDebtPaidNo" runat="server" Text="No" AutoPostBack="true" GroupName="debtpaid" CssClass="fancyLabel"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDebtComments" runat="server" Text="Comments" CssClass="fancyLabel7"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDebtComments" runat="server" CssClass="fancyLabel" TextMode="MultiLine" Rows="5" Width="260px"></asp:TextBox>
                                </td>
                                <%--<td>
                                    <asp:Label ID="lblDebtJobActive" runat="server" Text="Job Active?" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="radioDebtJobActiveYes" runat="server" Text="Yes" AutoPostBack="true" GroupName="jobdone" CssClass="fancyLabel"/>&nbsp;
                                    <asp:RadioButton ID="radioDebtJobActiveNo" runat="server" Text="No" AutoPostBack="true" GroupName="jobdone" CssClass="fancyLabel"/>
                                </td>--%>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblJobSuccessful" runat="server" Text="Job Successful?" CssClass="fancyLabel2"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="radioDebtJobSuccessfulYes" runat="server" Text="Yes" CssClass="fancyLabel"
                                        AutoPostBack="true" GroupName="debtsuccess"/>&nbsp;
                                    <asp:RadioButton ID="radioDebtJobSuccessfulNo" runat="server" Text="No" CssClass="fancyLabel"
                                        AutoPostBack="true" GroupName="debtsuccess"/>&nbsp;
                                 </td>
                            </tr>
					
					        <div id="div4" runat="server">
                            <table style="margin-left:300px">
	                            <tr>
		                            <td>
			                            <asp:Button ID="btnSaveDebt" runat="server" Text="Save Changes" CssClass="silverButton" OnClick="btnSaveDebt_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </div>

                     </div>
                     </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tabPanelAppointments" runat="server" HeaderText="Appointments" CssClass="tabs">
            <ContentTemplate>

                <asp:Panel ID="pnlAppointments" runat="server" GroupingText="Appointment Menu">
                    <asp:RadioButton ID="radioAddAppointment" runat="server" Text="Add" AutoPostBack="true" GroupName="appointments" OnCheckedChanged="radioAddAppointment_CheckedChanged" CssClass="fancyLabel"/>&nbsp;
                    <asp:RadioButton ID="radioEditAppointment" runat="server" Text="Edit" AutoPostBack="true" GroupName="appointments" OnCheckedChanged="radioEditAppointment_CheckedChanged" CssClass="fancyLabel"/>&nbsp;
                    <asp:RadioButton ID="radioViewAppointment" runat="server" Text="View" AutoPostBack="true" GroupName="appointments" OnCheckedChanged="radioViewAppointment_CheckedChanged" CssClass="fancyLabel"/>
                    <asp:RadioButton ID="radioViewAppointmentReport" runat="server" Text="View Report" AutoPostBack="true" GroupName="appointments" OnCheckedChanged="radioViewAppointmentReport_CheckedChanged" CssClass="fancyLabel"/>
                    <asp:RadioButton ID="radioViewAppointmentReportAll" runat="server" Text="View Report (All Companies)" AutoPostBack="true" GroupName="appointments" OnCheckedChanged="radioViewAppointmentReportAll_CheckedChanged" CssClass="fancyLabel"/>
                </asp:Panel>

                <div id="divAddAppointments" runat="server">
                    <table style="margin-left: 0px;">
                    <tr>
                        <td>
                            <asp:Label ID="lblAppointmentDate" runat="server" Text="Appointment Date" CssClass="fancyLabel4"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnOpenCalendar" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar();"/>
                            &nbsp;<asp:TextBox ID="txtAppointmentDate" runat="server" CssClass="fancyLabel"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lnlAppointmentTime" runat="server" Text="Appointment Time" CssClass="fancyLabel4"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAppointmentTime" runat="server" Font-Names="Calibri" Font-Size="Small" placeholder="HH:MM"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAppointmentDescription" runat="server" Text="Description" CssClass="fancyLabel4"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAppointmentDescription" runat="server" Font-Names="Calibri" Font-Size="Small" Width="350px" TextMode="MultiLine" Rows="7"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAppointmentLocation" runat="server" Text="Appointment Location" CssClass="fancyLabel4"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>&nbsp;
                            <asp:Label ID="lblOr" runat="server" Text="Or" CssClass="fancyLabel"></asp:Label>&nbsp;
                            <asp:Label ID="lblAppointmentCountry" runat="server" Text="Appointment Country" CssClass="fancyLabel"></asp:Label>&nbsp;
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmployee" runat="server" Text="Employee" CssClass="fancyLabel4"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
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

                </div>

                <div id="divEditAppointments" runat="server">
                    <table style="margin-left: 0px;">
                    <tr>
                        <td>
                            <asp:Label ID="lblAppointments" runat="server" Text="Appointments" CssClass="fancyLabel4"></asp:Label>            
                        </td>
                        <td>
                            <asp:ListBox ID="lstAppointments" runat="server" CssClass="compactListboxAppointments" AutoPostBack="True"
                                OnSelectedIndexChanged="lstAppointments_SelectedIndexChanged" Height="260px" Width="160px"
                                ToolTip="Select appointment to load its details"></asp:ListBox>
                        </td>
                    </tr>
                    </table>

                    <div>
                    <table style="margin-left: 260px; margin-top:-250px">
                        <tr>
                            <td>
                                <asp:Label ID="lblEditAppointmentDate" runat="server" Text="Appointment Date" CssClass="fancyLabel3"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnOpenAppointmentCalendar" runat="server" Text="Open Calendar" CssClass="buttonsmd" OnClientClick="javascript:return openCalendar2();"/>&nbsp;
                                <asp:TextBox ID="txtEditAppointmentDate" runat="server" CssClass="fancyLabel"></asp:TextBox>&nbsp;
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblEditAppointmentTime" runat="server" Text="Appointment Time" CssClass="fancyLabel3"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditAppointmentTime" runat="server" CssClass="fancyLabel" placeholder="HH:MM"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblEditAppointmentDescription" runat="server" Text="Appointment Description" CssClass="fancyLabel3"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEditAppointmentDescription" runat="server" Font-Names="Calibri" Font-Size="Small" Width="350px" ForeColor="#434E66" TextMode="MultiLine" Rows="7"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEditAppointmentLocation" runat="server" Text="Appointment Location" CssClass="fancyLabel3"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAppointmentLocation" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>&nbsp;
                                <asp:Label ID="lblAppointmentOr" runat="server" Text="AND" CssClass="fancyLabel"></asp:Label>&nbsp;
                                <asp:Label ID="Label1" runat="server" Text="Appointment Country" CssClass="fancyLabel"></asp:Label>&nbsp;
                                <asp:DropDownList ID="ddlAppointmentCountry" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAppointmentCompany" runat="server" Text="Company" CssClass="fancyLabel3"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAppointmentCompany" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAppointmentEmployee" runat="server" Text="Employee" CssClass="fancyLabel3"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAppointmentEmployee" runat="server" CssClass="ddl" AutoPostBack="true"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                    <td>
                        <br />
                            <asp:Button ID="btnEditAppointment" runat="server" Text="Edit Appointment" CssClass="silverButton" OnClick="btnEditAppointment_Click"/>
                    </td>
                    <td>
                        <br />
                            <asp:Button ID="btnDeleteAppointment" runat="server" Text="Delete Appointment" CssClass="silverButton"
                            OnClick="btnDeleteAppointment_Click" OnClientClick="return Validate()"/>
            </td>
        </tr>
                    </table>
                    </div>
                </div>

                <div ID="divViewAppointments" runat="server" style="margin-left:0px">
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
                        SelectCommand="SELECT * FROM [Appointments] WHERE Appointment_Date = @DateIn AND Company_Name = @Company_Name">
                        <SelectParameters>
                            <asp:Parameter Name="DateIn" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        
    </ajaxToolkit:TabContainer>
    </div>
</asp:Content>