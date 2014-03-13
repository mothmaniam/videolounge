<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="videolounge.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <table style="margin-left: 250px">
        <tr>
            <td>
                <asp:label id="lblReportsHeader" runat="server" text="Reports" forecolor="#4D6095" font-bold="true"></asp:label>
            </td>
            <td>
                <asp:label id="lblMessageHeader" runat="server" forecolor="Red" font-bold="true"></asp:label>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div runat="server" style="margin-left:-40px;">
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblRegion" runat="server" Text="Region" CssClass="fancyLabel3" ToolTip="Jobs by Region"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlRegions" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlRegions_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="fancyLabel3" ToolTip="Jobs by Country"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblChannel" runat="server" Text="Channel" CssClass="fancyLabel3" ToolTip="Jobs by Channel"></asp:Label>
                </td>
                <td>
                    <asp:RadioButton ID="radioAdAgency" runat="server" Text="Ad Agency" CssClass="fancyLabel" GroupName="channel" AutoPostBack="true" OnCheckedChanged="radioAdAgency_CheckedChanged"/>&nbsp;
                    <asp:RadioButton ID="radioCorporate" runat="server" Text="Corporate" CssClass="fancyLabel" GroupName="channel" AutoPostBack="true" OnCheckedChanged="radioCorporate_CheckedChanged"/>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblIndustry" runat="server" Text="Industry" CssClass="fancyLabel3" ToolTip="Jobs by Industry"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlIndustry_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblServices" runat="server" Text="Production Services" CssClass="fancyLabel3" ToolTip="Companies that offer these services"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlServices" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCompany" runat="server" Text="Company/Client" CssClass="fancyLabel3" ToolTip="Jobs by Company/Client"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCompanies" runat="server" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="ddlCompanies_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" CssClass="silverButton" onclick="btnGenerateReport_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
