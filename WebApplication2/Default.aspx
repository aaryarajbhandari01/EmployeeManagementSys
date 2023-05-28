<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <h2>Dashboard</h2>
    <br />

    <div class="card"   >

        <h4>Report Overview</h4>
       
        <div style="display:flex; justify-content:center;""> 
       
        <div style="margin:10px;">
            <h6>No of Employees in the Department</h6>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceChartDeptEmp" Width="400px">
            <Series>
                <asp:Series Name="Series1" XValueMember="DEPARTMENT_NAME" YValueMembers="COUNT(E.EMPLOYEE_ID)"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
            
        </div>

        <div style="margin:10px;">
        <asp:SqlDataSource runat="server" ID="SqlDataSourceChartDeptEmp" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ 
            ConnectionStrings:ConnectionString2.ProviderName %>'
            SelectCommand="SELECT  d.department_name, COUNT(e.employee_id)
from employee e
JOIN department d ON e.department_id = d.department_id
group by department_name">
        </asp:SqlDataSource>
               <h6>No of Employees in a Role</h6>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2RoleEmp" Height="295px" Width="405px">
            <Series>
                <asp:Series Name="Series1" ChartType="Point" XValueMember="ROLE_NAME" YValueMembers="NO_OF_EMPLOYEES"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>

         </div>

            </div>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2RoleEmp" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' SelectCommand="select r.role_name,count(e.role_id) as no_of_employees from role r join employee e on r.role_id = e.role_id group by r.role_name"></asp:SqlDataSource>
    </div>

    

      <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

    <br />
    <br />


      <div class="row " style="display:flex; justify-content:center; align-items:center;"> 


         <div class="card bg-primary text-white  col-md-3 " style="margin: 20px;" >
            <div class="card-body" style="padding:10px; margin:10px;  height:30%;">
            <h3>Job History</h3>

     
            
            <p>
                <a class="btn btn-default" href="/Job_History">Learn more &raquo;</a>
            </p>
            </div>
        </div>

         <div class="card bg-success text-white  col-md-3 " style="margin: 20px;" >
            <div class="card-body" style="padding:17px; margin:10px; height:30%;">
            <h4>Employee of the month</h4>
          
            <p>
                <a class="btn btn-default" href="/Employee_Of_The_Month">Learn more &raquo;</a>
            </p>
            </div>
        </div>

        <div class="card bg-info text-white  col-md-3 " style="margin: 20px;" >
            <div class="card-body" style="padding:10px; margin:10px;">
            <h3>Voting Record</h3>
         
            <p>
                <a class="btn btn-default" href="/Voting_Record">Learn more &raquo;</a>
            </p>
            </div>
        </div>
   </div>
        
      <div class="row " style="display:flex; justify-content:center; align-items:center;"> 

        <div class="card bg-warning text-white  col-md-3 "  style="margin: 20px;">
            <div class="card-body" style="padding:10px; margin:10px;">

            <div style="display:flex; justify-content: space-between;">
            <h3>Employee </h3>

               <h5  style="border:black; background-color:white; border-radius:50%; margin:10px; padding:10px;"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString2 %>' ProviderName='<%$ ConnectionStrings:ConnectionString2.ProviderName %>' 
                    SelectCommand="Select COUNT(employee_id) as Total_Employees 
From employee"></asp:SqlDataSource></h5>  
                </div>

            <p>
                <a class="btn btn-default" href="/Employee">Learn more &raquo;</a>
            </p>
            </div>
        </div>

        <div class="card bg-danger text-white  col-md-3 " style="margin: 20px;" >
            <div class="card-body" style="padding:10px; margin:10px;">


            <h3>Job</h3>

            

            <p>
                <a class="btn btn-default" href="/Job">Learn more &raquo;</a>
            </p>
            </div>
        </div>

        <div class="card bg-primary text-white  col-md-3 " style="margin: 20px;">
            <div class="card-body" style="padding:10px; margin:10px;">
            <h3>Role</h3>
           
            <p>
                <a class="btn btn-default" href="/Role">Learn more &raquo;</a>
            </p>
            </div>
        </div>
       
        </div>


      <div class="row " style="display:flex; justify-content:center; align-items:center;"> 
        <div class="card bg-info text-white  col-md-3 " style="margin: 20px;" >
            <div class="card-body" style="padding:10px; margin:10px;">

            <h3>Email</h3>
            
            <p>
                <a class="btn btn-default" href="/Email">Learn more &raquo;</a>
            </p>
             </div>
        </div>

        <div class=" card bg-warning text-white col-md-3" style="margin: 20px;">
            <div class="card-body" style="padding:10px; margin:10px;">
            <h3>Employee Address</h3>
          
            <p>
                <a class="btn btn-default" href="/Emp_Address">Learn more &raquo;</a>
            </p>
               </div>
        </div>

        <div class="card bg-success text-black  col-md-3 " style="margin: 20px;" >
            <div class="card-body" style="padding:10px; margin:10px;">
            <h3>Department</h3>
           
            <p>
                <a class="btn btn-default" href="/Department">Learn more &raquo;</a>
            </p>
               </div>
        </div>
    </div>

   



</asp:Content>
