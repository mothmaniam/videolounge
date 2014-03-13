<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCompanyContacts.aspx.cs"
    Inherits="videolounge.ViewCompanyContacts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/light/login-light.css" rel="stylesheet" type="text/css" />
    <link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    <script type="text/javascript">

        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({ message: '<img src="images/loadingAnim.gif" />', css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB'
                    }
                });
            });

            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        }

        $(document).ready(function () {
            BlockUI("dvGrid");
            $.blockUI.defaults.css = {};
        });
    </script>
</head>
<body>
    <form id="frmContacts" runat="server" style="background-color: #E48383">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gridContactPersons" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" AutoGenerateColumns="False" AllowPaging="True" ShowFooter="True"
                    OnPageIndexChanging="OnPaging" OnRowEditing="EditCustomer" OnRowUpdating="UpdateCustomer"
                    OnRowCancelingEdit="CancelEdit" EmptyDataText="No results..." CssClass="fancyLabel2">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Contact Person ID" Visible="false"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblContactPersonID" runat="server" Text='<%# Eval("Contact_Person_ID")%>' CssClass="fancyLabel"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtContactPersonID" Width="40px" runat="server" CssClass="fancyLabel"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="30px" />
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("Name")%>' CssClass="fancyLabel"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContactName" runat="server" Text='<%# Eval("Name")%>' CssClass="fancyLabel"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtContactName" runat="server" CssClass="fancyLabel"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="150px" HeaderText="Position" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("Position")%>' CssClass="fancyLabel"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContactPosition" runat="server" Text='<%# Eval("Position")%>' CssClass="fancyLabel"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtContactPosition" runat="server" CssClass="fancyLabel"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Cell" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblContactCell" runat="server" Text='<%# Eval("Cell")%>' CssClass="fancyLabel"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContactCell" runat="server" Text='<%# Eval("Cell")%>' CssClass="fancyLabel"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtContactCell" runat="server" CssClass="fancyLabel"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Email" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblContactEmail" runat="server" Text='<%# Eval("Email")%>' CssClass="fancyLabel"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContactEmail" runat="server" Text='<%# Eval("Email")%>' CssClass="fancyLabel"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtContactEmail" runat="server" CssClass="fancyLabel"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRemove" runat="server" CommandArgument='<%# Eval("Contact_Person_ID")%>'
                                    OnClientClick="return confirm('Are you sure you want to delete this contact?')"
                                    Text="Delete" OnClick="DeleteCustomer"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddNewCustomer" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#E48383" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="gridContactPersons" />
            </Triggers>
        </asp:UpdatePanel>
        
        <div id="divShowContacts" runat="server" style="margin-left:300px;">
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="silverButton" onclick="btnClose_Click"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>