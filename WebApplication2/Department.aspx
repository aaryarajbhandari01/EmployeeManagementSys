<%@ Page Title="Department" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Department.aspx.cs" Inherits="WebApplication2.Department" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <h2><%: Title %></h2>
    <h3>Department Records</h3>

        <div>

            <asp:FormView class="table" ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1">
               
                <InsertItemTemplate>
                    <div class="container text-right">
                    <p>
                    DEPARTMENT_NAME:
                    <asp:TextBox ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                    </p>

                    <br />

                    <p>
                    DEPARTMENT_ID:
                    <asp:TextBox ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                    </p>

                    <br />

                    <p>
                    LOCATION:
                    <asp:TextBox ID="LOCATIONTextBox" runat="server" Text='<%# Bind("LOCATION") %>' />
                    </p>

                    <br />
                    <asp:LinkButton class="btn btn-primary"  ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton class="btn btn-danger"  ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <p class="text-right">
                    &nbsp;<asp:LinkButton class="btn btn-primary"  ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </p>
                </ItemTemplate>
            </asp:FormView>

            <br />
            <asp:GridView CssClass="table"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME"></asp:BoundField>
                    <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" ReadOnly="True" SortExpression="DEPARTMENT_ID"></asp:BoundField>
                    <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION"></asp:BoundField>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' DeleteCommand='DELETE FROM "DEPARTMENT" WHERE "DEPARTMENT_ID" = :DEPARTMENT_ID' InsertCommand='INSERT INTO "DEPARTMENT" ("DEPARTMENT_NAME", "DEPARTMENT_ID", "LOCATION") VALUES (:DEPARTMENT_NAME, :DEPARTMENT_ID, :LOCATION)' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT "DEPARTMENT_NAME", "DEPARTMENT_ID", "LOCATION" FROM "DEPARTMENT"' UpdateCommand='UPDATE "DEPARTMENT" SET "DEPARTMENT_NAME" = :DEPARTMENT_NAME, "LOCATION" = :LOCATION WHERE "DEPARTMENT_ID" = :DEPARTMENT_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DEPARTMENT_NAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LOCATION" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DEPARTMENT_NAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LOCATION" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

          
        </div>
</asp:Content>