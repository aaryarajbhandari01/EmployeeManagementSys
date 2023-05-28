<%@ Page Title="Job History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Job_History.aspx.cs" Inherits="WebApplication2.Job_History" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
        <div class="container" style="padding-top:10px;">
        
             <h2><%: Title %></h2>
        <h3>Job History Record</h3>
            <br />
<p class="text-right"> 
            Select Employee: <asp:DropDownList ID="DropDownList1" CssClass="btn btn-primary" runat="server" DataSourceID="SqlDataSourceEmpNameData" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDataSourceEmpNameData" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand='SELECT "EMPLOYEE_ID", "EMPLOYEE_NAME" FROM "EMPLOYEE"'></asp:SqlDataSource>
        </p>    
            <br />
           
            <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="CONTACT" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE NAME" SortExpression="EMPLOYEE_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" ReadOnly="True" SortExpression="CONTACT" />
                    <asp:BoundField DataField="ROLE_NAME" HeaderText="ROLE NAME" SortExpression="ROLE_NAME" />
                    <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="DEPARTMENT" SortExpression="DEPARTMENT_NAME" />
                    <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
                    <asp:BoundField DataField="JOB_NAME" HeaderText="JOB" SortExpression="JOB_NAME" />
                    <asp:BoundField DataField="JOB_DESC" HeaderText="JOB DESC" SortExpression="JOB_DESC" />
                    <asp:BoundField DataField="START_DATE" HeaderText="START-DATE" SortExpression="START_DATE"  DataFormatString="{0:dd-MMM-yyyy}"/>
                    <asp:BoundField DataField="END_DATE" HeaderText="END-DATE" SortExpression="END_DATE"  DataFormatString="{0:dd-MMM-yyyy}"></asp:BoundField>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ 
                ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand="SELECT e.employee_name, e.contact, r.role_name, d.department_name, r.salary,
       j.job_name, j.job_desc, h.start_date, h.end_date
FROM employee e
JOIN job_history h ON e.employee_id = h.employee_id
JOIN role r ON h.role_id = r.role_id
JOIN job_detail j ON r.job_id = j.job_id
JOIN department d ON h.department_id = d.department_id
where e.employee_id = :employee ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
