<%@ Page Title="Employee Address" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Emp_Address.aspx.cs" Inherits="WebApplication2.Emp_Address" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <h2><%: Title %></h2>
    <h3>Employee Addess Records</h3>

        <div>
               <asp:FormView class="table" ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID,EMPLOYEE_ID" DataSourceID="SqlDataSource1">
               
                <InsertItemTemplate>
                    <div class="container text-right">

                 <p>ADDRESS_ID:<asp:DropDownList  class="btn btn-default"  ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="STREET" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                    </asp:DropDownList>
                     </p>
                     <p>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
&nbsp;<br />EMPLOYEE_ID:<asp:DropDownList  class="btn btn-default"  ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" SelectedValue='<%# Bind("EMPLOYEE_ID") %>'>
                    </asp:DropDownList>
                     </p>   
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
&nbsp;<br />&nbsp;<asp:LinkButton runat="server" class="btn btn-primary" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" class="btn btn-danger"  Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
              </div>
                    </InsertItemTemplate>
                <ItemTemplate>
                    <p class="text-right">
                   
                    &nbsp;<asp:LinkButton class="btn btn-primary"  runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
              </p>  </ItemTemplate>
            </asp:FormView>

            <br />

            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID,EMPLOYEE_ID" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                    <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                    <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="False" ID="DropDownList3" runat="server" DataSourceID="AddCityData" DataTextField="CITY" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="AddCityData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;CITY&quot;, &quot;ADDRESS_ID&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="False" ID="DropDownList4" runat="server" DataSourceID="AddStreetData" DataTextField="STREET" DataValueField="ADDRESS_ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="AddStreetData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;STREET&quot;, &quot;ADDRESS_ID&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="False" ID="DropDownList5" runat="server" DataSourceID="AddCountryData" DataTextField="COUNTRY" DataValueField="ADDRESS_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="AddCountryData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;ADDRESS_ID&quot;, &quot;COUNTRY&quot; FROM &quot;ADDRESS&quot;"></asp:SqlDataSource>
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
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand='DELETE FROM "EMP_ADDRESS" WHERE "ADDRESS_ID" = :ADDRESS_ID AND "EMPLOYEE_ID" = :EMPLOYEE_ID' InsertCommand='INSERT INTO "EMP_ADDRESS" ("ADDRESS_ID", "EMPLOYEE_ID") VALUES (:ADDRESS_ID, :EMPLOYEE_ID)' ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand='SELECT * FROM "EMP_ADDRESS"'>
                <DeleteParameters>
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                    <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>

   
        </div>
</asp:Content>