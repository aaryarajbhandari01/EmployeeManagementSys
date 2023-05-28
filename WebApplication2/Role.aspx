<%@ Page Title="Role" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Role.aspx.cs" Inherits="WebApplication2.Role" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <h2><%: Title %></h2>
    <h3>Company Job Role Records</h3>

        <div >
            <asp:FormView CssClass="table" ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="container text-right">
                    <p>
                    ROLE_ID:
                    <asp:TextBox Text='<%# Bind("ROLE_ID") %>' runat="server" ID="ROLE_IDTextBox" /></p><br />
                    
                     <p>
                     JOB_ID:
                    <asp:DropDownList class="btn" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>' OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                         </p>
                    <br />
                    <p>
                    ROLE_NAME:
                    <asp:TextBox Text='<%# Bind("ROLE_NAME") %>' runat="server" ID="ROLE_NAMETextBox" /></p><br />

                    <p>
                    ROLE_DESC:
                    <asp:TextBox Text='<%# Bind("ROLE_DESC") %>' runat="server" ID="ROLE_DESCTextBox" /></p><br />

                    <p>
                    SALARY:
                    <asp:TextBox Text='<%# Bind("SALARY") %>' runat="server" ID="SALARYTextBox" />
                       </p><br />

                    <asp:LinkButton class="btn btn-primary" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                        &nbsp;<asp:LinkButton class="btn btn-danger" runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                        </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_NAME&quot;, &quot;JOB_ID&quot; FROM &quot;JOB_DETAIL&quot;"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>

                    <p class="text-right">

                    &nbsp;<asp:LinkButton class="btn btn-primary"  runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                        </p>
                </ItemTemplate>
            </asp:FormView>

            <br />

            <asp:GridView ID="GridView1"  CssClass="table"  runat="server" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE ID" ReadOnly="True" SortExpression="ROLE_ID"></asp:BoundField>
                    <asp:BoundField DataField="JOB_ID" HeaderText="JOB ID" SortExpression="JOB_ID"></asp:BoundField>
                    <asp:BoundField DataField="ROLE_NAME" HeaderText="ROLE NAME" SortExpression="ROLE_NAME"></asp:BoundField>
                    <asp:BoundField DataField="ROLE_DESC" HeaderText="ROLE DESCRIPTION" SortExpression="ROLE_DESC"></asp:BoundField>
                    <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY"></asp:BoundField>
                    <asp:TemplateField HeaderText="JOB TITLE">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="False" ID="DropDownList2" runat="server" DataSourceID="JobTitleData" DataTextField="JOB_NAME" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="JobTitleData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB_NAME&quot; FROM &quot;JOB_DETAIL&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' DeleteCommand='DELETE FROM "ROLE" WHERE "ROLE_ID" = :ROLE_ID' InsertCommand='INSERT INTO "ROLE" ("ROLE_ID", "JOB_ID", "ROLE_NAME", "ROLE_DESC", "SALARY") VALUES (:ROLE_ID, :JOB_ID, :ROLE_NAME, :ROLE_DESC, :SALARY)' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT "ROLE_ID", "JOB_ID", "ROLE_NAME", "ROLE_DESC", "SALARY" FROM "ROLE"' UpdateCommand='UPDATE "ROLE" SET "JOB_ID" = :JOB_ID, "ROLE_NAME" = :ROLE_NAME, "ROLE_DESC" = :ROLE_DESC, "SALARY" = :SALARY WHERE "ROLE_ID" = :ROLE_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="ROLE_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ROLE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="JOB_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ROLE_NAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ROLE_DESC" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SALARY" Type="Decimal"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="JOB_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ROLE_NAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ROLE_DESC" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SALARY" Type="Decimal"></asp:Parameter>
                    <asp:Parameter Name="ROLE_ID" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

         
        </div>
</asp:Content>