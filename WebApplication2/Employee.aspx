<%@ Page Title="Employee" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Employee.aspx.cs" Inherits="WebApplication2.Employee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>
    <h3>Employee Records</h3>

        <div >

            <asp:FormView class="table"  ID="FormView1" runat="server" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    EMPLOYEE ID:
                    <asp:Label ID="EMPLOYEE_IDLabel1" runat="server" Text='<%# Eval("EMPLOYEE_ID") %>' />
                    <br />
                    EMPLOYEE NAME:
                    <asp:TextBox ID="EMPLOYEE_NAMETextBox" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
                    <br />
                    DATE OF BIRTH:
                    <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                    <br />
                    CONTACT:
                    <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                    <br />
                    ROLE:
                    <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' />
                    <br />
                    DEPARTMENT:
                    <asp:TextBox ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
                    <br />
                    MANAGER_ID:
                    <asp:TextBox ID="MANAGER_IDTextBox" runat="server" Text='<%# Bind("MANAGER_ID") %>' />
                    <br />
                    <asp:LinkButton class="btn btn-primary"   ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton class="btn btn-danger"   ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>

                <InsertItemTemplate>
                    <div class="container text-right">
                    <p>
                    EMPLOYEE ID:
                    <asp:TextBox ID="EMPLOYEE_IDTextBox" runat="server" Text='<%# Bind("EMPLOYEE_ID") %>' />
                    </p>
                    <br />

                    <p>
                    EMPLOYEE NAME:
                    <asp:TextBox ID="EMPLOYEE_NAMETextBox" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
                    </p>
                    <br />

                    <p>
                    DATE OF BIRTH:
                    <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                    </p>
                    <br />

                    <p>
                    CONTACT:
                    <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                    </p>
                    <br />

                    <p>
                    ROLE:

                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourcerole" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                    </asp:DropDownList>
                    </p>
                    <asp:SqlDataSource ID="SqlDataSourcerole" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
                    <br />
                    <p>
                    DEPARTMENT:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceDept" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" SelectedValue='<%# Bind("DEPARTMENT_ID") %>'>
                    </asp:DropDownList>
                    </p>
                    <p>
                    <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_ID&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
&nbsp;<br />MANAGER_ID:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceMngr" DataTextField="MANAGER_ID" DataValueField="MANAGER_ID" SelectedValue='<%# Bind("MANAGER_ID") %>'>
                    </asp:DropDownList>
                        </p>
                    <br />

                    <asp:SqlDataSource ID="SqlDataSourceMngr" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;MANAGER_ID&quot; FROM &quot;DEPARTMENT_MANAGER&quot;"></asp:SqlDataSource>
&nbsp;<br />&nbsp;<asp:LinkButton class="btn btn-primary"   ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton class="btn btn-danger"   ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
              </div>
                 </InsertItemTemplate>
                <ItemTemplate>
                    
                                       <p class="text-right">

                    &nbsp;<asp:LinkButton class="btn btn-primary"   ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
          </p>      </ItemTemplate>
            </asp:FormView>

            <br />

            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                    <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE NAME" SortExpression="EMPLOYEE_NAME" />
                    <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE OF BIRTH" SortExpression="DATE_OF_BIRTH" DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="MANAGER_ID" HeaderText="MANAGER_ID" SortExpression="MANAGER_ID" />
                    <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT" SortExpression="DEPARTMENT_ID" />
                    <asp:TemplateField HeaderText="Department Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceDeptName" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" SelectedValue='<%# Bind("DEPARTMENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDeptName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_ID&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE ID" SortExpression="ROLE_ID" />
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="SqlDataSourceRoleName" DataTextField="ROLE_NAME" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceRoleName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE_NAME&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;EMPLOYEE&quot; WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID" InsertCommand="INSERT INTO &quot;EMPLOYEE&quot; (&quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;CONTACT&quot;, &quot;ROLE_ID&quot;, &quot;DEPARTMENT_ID&quot;, &quot;MANAGER_ID&quot;) VALUES (:EMPLOYEE_ID, :EMPLOYEE_NAME, :DATE_OF_BIRTH, :CONTACT, :ROLE_ID, :DEPARTMENT_ID, :MANAGER_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DATE_OF_BIRTH&quot;, &quot;CONTACT&quot;, &quot;ROLE_ID&quot;, &quot;DEPARTMENT_ID&quot;, &quot;MANAGER_ID&quot; FROM &quot;EMPLOYEE&quot;" UpdateCommand="UPDATE &quot;EMPLOYEE&quot; SET &quot;EMPLOYEE_NAME&quot; = :EMPLOYEE_NAME, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH, &quot;CONTACT&quot; = :CONTACT, &quot;ROLE_ID&quot; = :ROLE_ID, &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID, &quot;MANAGER_ID&quot; = :MANAGER_ID WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
                    <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
                    <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                    <asp:Parameter Name="CONTACT" Type="String" />
                    <asp:Parameter Name="ROLE_ID" Type="String" />
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                    <asp:Parameter Name="MANAGER_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
                    <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                    <asp:Parameter Name="CONTACT" Type="String" />
                    <asp:Parameter Name="ROLE_ID" Type="String" />
                    <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
                    <asp:Parameter Name="MANAGER_ID" Type="String" />
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
       
</asp:Content>

