<%@ Page Title="Department Manager" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Department_Manager.aspx.cs" Inherits="WebApplication2.Department_Manager" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

      <h2><%: Title %></h2>
    <h3>Department Manager Records</h3>

        <div>

            <asp:FormView class="table" ID="FormView1" runat="server" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1">
              
                <InsertItemTemplate>
                    <div class="container text-right">
                       <p>
                    DEPARTMENT:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" SelectedValue='<%# Bind("DEPARTMENT_ID") %>'>
                    </asp:DropDownList>
                           </p>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_ID&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
&nbsp;<br /><p>Select Manager:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("MANAGER_ID") %>'>
                    </asp:DropDownList></p>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
&nbsp;<br />&nbsp;<asp:LinkButton runat="server"  class="btn btn-primary"  Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;
                        <asp:LinkButton  class="btn btn-danger" runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
              </div>
                        </InsertItemTemplate>
                <ItemTemplate>
                    <p class="text-right">

                    &nbsp;<asp:LinkButton runat="server"  class="btn btn-primary" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
               </p> </ItemTemplate>
            </asp:FormView>
            <br />

            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DEPARTMENT_ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT ID" ReadOnly="True" SortExpression="DEPARTMENT_ID"></asp:BoundField>
                    <asp:BoundField DataField="MANAGER_ID" HeaderText="MANAGER ID" SortExpression="MANAGER_ID"></asp:BoundField>
                    <asp:TemplateField HeaderText="Department Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="DepartmentNameData" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" SelectedValue='<%# Bind("DEPARTMENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DepartmentNameData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_ID&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manager Name">
                        <ItemTemplate>
                            <asp:DropDownList  Enabled="false" ID="DropDownList4" runat="server" DataSourceID="ManagerNameData" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("MANAGER_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ManagerNameData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' DeleteCommand='DELETE FROM "DEPARTMENT_MANAGER" WHERE "DEPARTMENT_ID" = :DEPARTMENT_ID' InsertCommand='INSERT INTO "DEPARTMENT_MANAGER" ("DEPARTMENT_ID", "MANAGER_ID") VALUES (:DEPARTMENT_ID, :MANAGER_ID)' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT "DEPARTMENT_ID", "MANAGER_ID" FROM "DEPARTMENT_MANAGER"' UpdateCommand='UPDATE "DEPARTMENT_MANAGER" SET "MANAGER_ID" = :MANAGER_ID WHERE "DEPARTMENT_ID" = :DEPARTMENT_ID'>
                <DeleteParameters>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="MANAGER_ID" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MANAGER_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
   </asp:Content>