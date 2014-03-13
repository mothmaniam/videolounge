﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddCompany.aspx.cs" Inherits="videolounge.AddEntity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left: 250px">
        <tr>
            <td>
                <asp:label id="lblAddCompanyHeader" runat="server" text="Add Company" forecolor="#4D6095" font-bold="true"></asp:label>
            </td>
            <td>
                <asp:label id="lblMessageHeader" runat="server" forecolor="Red" font-bold="true"></asp:label>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <table style="margin-left: -30px; margin-top: 15px">
                <tr>
                    <td>
                        <asp:Label ID="lblMarketer" runat="server" Text="Marketer" CssClass="fancyLabel"></asp:Label>
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
                        <asp:Label ID="lblAddCompany" runat="server" Text="Company Name" CssClass="fancyLabel"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server" CssClass="fancyLabel" Width="250px"></asp:TextBox>
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
                        <asp:Label ID="lblLandline" runat="server" Text="Landline" CssClass="fancyLabel"></asp:Label>
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
                            CssClass="fancyLabel" AutoPostBack="true" GroupName="channel" 
                            oncheckedchanged="radioAdAgency_CheckedChanged" />&nbsp;
                        <asp:RadioButton ID="radioCorporate" runat="server" Text="Corporate" CssClass="fancyLabel"
                            OnCheckedChanged="radioCorporate_CheckedChanged" AutoPostBack="true" GroupName="channel" />&nbsp;
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="fancyLabel"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="ddl"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblAdAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel2"></asp:Label>
                    </td>
                    <td>
                        <%--<asp:DropDownList ID="ddlAgency" runat="server" CssClass="ddl"></asp:DropDownList>--%>
                        <asp:TextBox ID="txtClients" runat="server" CssClass="fancyLabel" Width="250px" Visible="false" placeholder="Client 1, Client 2"></asp:TextBox>
                        <asp:TextBox ID="txtAdAgency" runat="server" CssClass="fancyLabel" Width="250px" Visible="false" placeholder="Ad Agency 1, Ad Agency 2"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblTypeOfWork" runat="server" Text="Type of Work" CssClass="fancyLabel"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWorkTypes" runat="server" CssClass="fancyLabel" Width="250px" placeholder="Food/Bank/Retailer etc"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="lblPhysicalAddress" runat="server" Text="Physical Address" CssClass="fancyLabel"></asp:Label>
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
                        <asp:Label ID="lblProducers" runat="server" Text="Producers" CssClass="fancyLabel"></asp:Label>
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
                         <asp:Label ID="lblDirectors" runat="server" Text="Directors" CssClass="fancyLabel"></asp:Label>&nbsp;
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
                        <asp:Label ID="lblProduceInSA" runat="server" Text="Produce In SA?" CssClass="fancyLabel"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="radioProdSAYes" runat="server" Text="Yes" AutoPostBack="True" CssClass="fancyLabel" GroupName="prodsa"/>&nbsp;
                        <asp:RadioButton ID="radioProdSANo" runat="server" Text="No" AutoPostBack="True" CssClass="fancyLabel" GroupName="prodsa"/>
                     </td>
                  </tr>
                     
                  <tr>
                    <td>
                        <asp:Label ID="lblProduceInCountries" runat="server" Text="Produce In" CssClass="fancyLabel"></asp:Label>
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
                        <asp:Label ID="lblAgencyClients" runat="server" Text="Agency Clients" CssClass="fancyLabel"></asp:Label>
                    </td>
                    <td>
                        <%--<asp:ListBox ID="lstAgencyClients" runat="server" CssClass="fancyLabel" Width="180px"></asp:ListBox>&nbsp;
                        <asp:Button ID="btnAddtoAgencyClients" runat="server" Text="&gt;&gt;" onclick="btnAddtoAgencyClients_Click"/>
                        <asp:Button ID="btnRemoveFromAgencyClients" runat="server" Text="&lt;&lt;" onclick="btnRemoveFromAgencyClients_Click"/>
                        <asp:ListBox ID="lstAgencyClientsAdded" runat="server" CssClass="fancyLabel" Width="180px"></asp:ListBox>--%>
                        <asp:TextBox ID="txtAgencyClients" runat="server" CssClass="fancyLabel" Width="250px" placeholder="Agency 1, Agency 2"></asp:TextBox>
                    </td>
                   </tr>
                   </table>

    <table>
        <br />
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddCompany" runat="server" Text="Add Company" CssClass="silverButton" OnClick="btnAddCompany_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

