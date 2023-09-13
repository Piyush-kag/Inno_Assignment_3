<%@ page import="service.employeeService" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script>
    function confirmDelete(empId) {
        var confirmation = confirm("Are you sure you want to delete this employee?");

        if (confirmation) {
            window.location.href = "EmpDelCtl?EmpId=" + empId;
        } else {
            // User clicked "Cancel" in the confirmation dialog
            // Do nothing or provide feedback to the user
        }
    }
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Employees</title>
</head>
<body>
<%! Employee emp; 
%>
<% emp = (Employee)session.getAttribute("emp");

employeeService es = new employeeService();
List<Employee> list = es.getEmployee();
%>
<%
if(emp.isAdmin()){
%>
	<div class="container">
  <h2>Employee Table</h2>
  <p>All Employee Data</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Salary</th>
        <th>Is Admin</th>
      </tr>
    </thead>
    <% for(int i = 0; i < list.size(); i++) {%>
      <tr>
      <td ><%= list.get(i).getEmpId() %></td>
        <td ><%= list.get(i).getFirstName() %></td>
        <td ><%= list.get(i).getLastName() %></td>
       	<td ><%= list.get(i).getSalary() %></td>
       	<td><%= list.get(i).isAdmin() %></td>
       	<td><a class="btn btn-default" href="updateEmp.jsp?EmpId=<%= list.get(i).getEmpId() %>">Update Employee Details</a></td>
  <%if(!list.get(i).isAdmin()){ %>
  <td>
    <a class="btn btn-default" href="javascript:void(0);" onclick="confirmDelete(<%= list.get(i).getEmpId() %>)">Delete</a>
</td>

<%} %>
        </tr>
        <%} %>
  </table>
  <center>
  	<button  type="submit" style="align-content: center;" class="btn btn-default" name="operation" value="addEmp" ><a href="addEmp.jsp">Add Employee</a></button>
  </center>
  </div>

<% } else { response.sendRedirect("user.jsp");}
%>
<center>
<button><a href="login.jsp">LogOut</a></button>
</center>
</body>
</html>