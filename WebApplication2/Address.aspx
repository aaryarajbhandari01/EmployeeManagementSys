<%@ Page Title="Address" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Address.aspx.cs" Inherits="WebApplication2.Address" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <h2><%: Title %></h2>
    <h3>Manage Address Records</h3>

        <div>
            <asp:FormView class="table" ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="container text-right">
                        <p>
                    ADDRESS_ID:
                    <asp:TextBox Text='<%# Bind("ADDRESS_ID") %>' runat="server" ID="ADDRESS_IDTextBox" /><br />
                      </p>
                   <p> CITY:
                    <asp:TextBox Text='<%# Bind("CITY") %>' runat="server" ID="CITYTextBox" /><br /></p>
                   <p> COUNTRY:
                    <asp:TextBox Text='<%# Bind("COUNTRY") %>' runat="server" ID="COUNTRYTextBox" /><br /></p>
                   <p> STREET:
                    <asp:TextBox Text='<%# Bind("STREET") %>' runat="server" ID="STREETTextBox" /><br /></p>
                    <asp:LinkButton class="btn btn-primary" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" class="btn btn-primary" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
               </div>
                        </InsertItemTemplate>
                <ItemTemplate>
                    <p class="text-right">

                    &nbsp;<asp:LinkButton class="btn btn-primary" runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
               </p>
                        </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>

                    <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID"></asp:BoundField>
                    <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY"></asp:BoundField>
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY"></asp:BoundField>
                    <asp:BoundField DataField="STREET" HeaderText="STREET" SortExpression="STREET"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#999999"></EditRowStyle>

                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' DeleteCommand='DELETE FROM "ADDRESS" WHERE "ADDRESS_ID" = :ADDRESS_ID' InsertCommand='INSERT INTO "ADDRESS" ("ADDRESS_ID", "CITY", "COUNTRY", "STREET") VALUES (:ADDRESS_ID, :CITY, :COUNTRY, :STREET)' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT "ADDRESS_ID", "CITY", "COUNTRY", "STREET" FROM "ADDRESS"' UpdateCommand='UPDATE "ADDRESS" SET "CITY" = :CITY, "COUNTRY" = :COUNTRY, "STREET" = :STREET WHERE "ADDRESS_ID" = :ADDRESS_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="ADDRESS_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ADDRESS_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="CITY" Type="String"></asp:Parameter>
                    <asp:Parameter Name="COUNTRY" Type="String"></asp:Parameter>
                    <asp:Parameter Name="STREET" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CITY" Type="String"></asp:Parameter>
                    <asp:Parameter Name="COUNTRY" Type="String"></asp:Parameter>
                    <asp:Parameter Name="STREET" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ADDRESS_ID" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
          
        </div>
</asp:Content>