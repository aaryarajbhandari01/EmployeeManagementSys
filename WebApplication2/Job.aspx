<%@ Page Title="Job" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Job.aspx.cs" Inherits="WebApplication2.Job" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
      <h2><%: Title %></h2>
    <h3>Company Job Records</h3>

        <div>
            <asp:FormView CssClass="table" ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="JOB_ID">

                <EditItemTemplate>
                    JOB_ID:
                     <asp:Label ID="JOB_IDLabel1" runat="server" Text='<%# Eval("JOB_ID") %>' />
                    <br />
                    JOB_NAME:
                     <asp:TextBox ID="JOB_NAMETextBox" runat="server" Text='<%# Bind("JOB_NAME") %>' />
                    <br />
                    JOB_DESC:
                     <asp:TextBox ID="JOB_DESCTextBox" runat="server" Text='<%# Bind("JOB_DESC") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>

                <InsertItemTemplate>
                    <div class="container text-right">
                        <p>
                    JOB_ID:
                    <asp:TextBox Text='<%# Bind("JOB_ID") %>' runat="server" ID="JOB_IDTextBox" /><br /></p>
                        <p>
                    JOB_NAME:
                    <asp:TextBox Text='<%# Bind("JOB_NAME") %>' runat="server" ID="JOB_NAMETextBox" /><br /></p>
                        <p>
                    JOB_DESC:
                    <asp:TextBox Text='<%# Bind("JOB_DESC") %>' runat="server" ID="JOB_DESCTextBox" /><br /></p>
      
                        <asp:LinkButton class="btn btn-primary" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;
                        <asp:LinkButton class="btn btn-danger" runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
              
                        </InsertItemTemplate>

                <ItemTemplate>
                    <p class="text-right">
                    &nbsp;<asp:LinkButton class="btn btn-primary" runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                    </p>
                </ItemTemplate>
            </asp:FormView>

            <br />

            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="JOB_ID">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"  />
                    <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" SortExpression="JOB_ID" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="JOB_NAME" HeaderText="JOB_NAME" SortExpression="JOB_NAME"></asp:BoundField>
                    <asp:BoundField DataField="JOB_DESC" HeaderText="JOB_DESC" SortExpression="JOB_DESC"></asp:BoundField>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT * FROM "JOB_DETAIL"' DeleteCommand='DELETE FROM "JOB_DETAIL" WHERE "JOB_ID" = :JOB_ID' InsertCommand='INSERT INTO "JOB_DETAIL" ("JOB_ID", "JOB_NAME", "JOB_DESC") VALUES (:JOB_ID, :JOB_NAME, :JOB_DESC)' UpdateCommand='UPDATE "JOB_DETAIL" SET "JOB_NAME" = :JOB_NAME, "JOB_DESC" = :JOB_DESC WHERE "JOB_ID" = :JOB_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="JOB_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="JOB_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="JOB_NAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="JOB_DESC" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="JOB_NAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="JOB_DESC" Type="String"></asp:Parameter>
                    <asp:Parameter Name="JOB_ID" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

           

        </div>
</asp:Content>