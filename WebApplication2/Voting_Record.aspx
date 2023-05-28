<%@ Page Title="Voting Record" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Voting_Record.aspx.cs" Inherits="WebApplication2.Voting_Record" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

             <h3><%: Title %></h3>
    
        <div class="container" style="padding-top:10px;">
            <p class="text-right"> Select Voter: 
            <asp:DropDownList class="btn btn-primary"   ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
            </asp:DropDownList></p>

            <asp:GridView cssClass="table" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                SelectCommand="SELECT e.employee_id as id, e.employee_name as employee, e.contact, r.role_name as role, d.department_name as department,
                   v.voting_month, v.voting_year, c.employee_name as candidate_name, c.contact, cr.role_name as candidate_role, d2.department_name as candidate_dept
                 FROM employee e
                 INNER JOIN candidate_vote v ON e.employee_id = v.voter_id
                 INNER JOIN employee c ON v.candidate_id = c.employee_id
                 INNER JOIN role r ON e.role_id= r.role_id
                INNER JOIN role cr ON c.role_id= cr.role_id
                INNER JOIN department d ON d.department_id= e.department_id
                INNER JOIN department d2 ON d2.department_id= c.department_id
                WHERE e.employee_id = :employee">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
        </div>

</asp:Content>