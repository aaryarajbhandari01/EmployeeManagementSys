<%@ Page Language="C#" Title="Employee of the month" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee_of_the_month.aspx.cs" Inherits="WebApplication2.Employee_of_the_month" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

          <h3><%: Title %></h3>
    

        <div class="container" style="padding-top:10px;">
            <p class="text-right"> 
Select Month:
            <asp:DropDownList class="btn btn-primary"   ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="VOTING_MONTH" DataValueField="VOTING_MONTH">
            </asp:DropDownList>
                &nbsp;
                &nbsp;
            Select Year:
            <asp:DropDownList class="btn btn-primary"   ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="VOTING_YEAR" DataValueField="VOTING_YEAR">
            </asp:DropDownList>
            </p>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM (
SELECT e.employee_id, e.employee_name, v.voting_month, v.voting_year, COUNT(v.candidate_id) AS vote_count
FROM employee e
JOIN candidate_vote v ON e.employee_id = v.candidate_id
WHERE v.voting_month = :month and v.voting_year = :year
GROUP BY e.employee_id, e.employee_name, v.voting_month, v.voting_year
ORDER BY vote_count DESC )
where rownum &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;VOTING_MONTH&quot; FROM &quot;CANDIDATE_VOTE&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;VOTING_YEAR&quot; FROM &quot;CANDIDATE_VOTE&quot;"></asp:SqlDataSource>
</asp:Content>