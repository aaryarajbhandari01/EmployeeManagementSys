<%@ Page Title="Email" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Email.aspx.cs" Inherits="WebApplication2.Email" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

      <h2><%: Title %></h2>
    <h3>Employee Email Records</h3>

        <div>
            <asp:FormView CssClass="table" ID="FormView1" runat="server" DataKeyNames="EMAIL" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="container text-right">
<p>
                    EMAIL:
                    <asp:TextBox Text='<%# Bind("EMAIL") %>' runat="server" ID="EMAILTextBox" />
     <br />
    <asp:RequiredFieldValidator CssClass="input-error" class="text-danger" ID="RequiredFieldValidator1" ControlToValidate="EMAILTextBox" runat="server" ErrorMessage="Provide appropriate email."></asp:RequiredFieldValidator>
    <br /></p>
                   <p>EMPLOYEE:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("EMPLOYEE_ID") %>'>
                    </asp:DropDownList>
                    </p> 
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
                    &nbsp;<br />&nbsp;<asp:LinkButton runat="server" class="btn btn-primary" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                    &nbsp;<asp:LinkButton runat="server" class="btn btn-danger" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <p class="text-right">

                    &nbsp;<asp:LinkButton runat="server" class="btn btn-primary" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
             </p>
                        </ItemTemplate>
            </asp:FormView>

            <br />

            <asp:GridView CssClass="table " ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EMAIL" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" ReadOnly="True" SortExpression="EMAIL"></asp:BoundField>
                    <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE ID" SortExpression="EMPLOYEE_ID"></asp:BoundField>
                    <asp:TemplateField HeaderText="EMPLOYEE NAME">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="EmployeeNameData" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("EMPLOYEE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="EmployeeNameData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
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
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT "EMAIL", "EMPLOYEE_ID" FROM "EMAIL"' DeleteCommand='DELETE FROM "EMAIL" WHERE "EMAIL" = :EMAIL' InsertCommand='INSERT INTO "EMAIL" ("EMAIL", "EMPLOYEE_ID") VALUES (:EMAIL, :EMPLOYEE_ID)' UpdateCommand='UPDATE "EMAIL" SET "EMPLOYEE_ID" = :EMPLOYEE_ID WHERE "EMAIL" = :EMAIL'>
                <DeleteParameters>
                    <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

          
        </div>
</asp:Content>

