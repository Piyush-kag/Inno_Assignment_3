<%@ page import="service.employeeService" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>All Employees</title>
</head>
<body>
<form action="userUpdateCtl" method="post">
        <% Employee emp = (Employee) session.getAttribute("emp");
           if (emp != null && !emp.isAdmin()) { %>
<div class="container">
  <h2>User</h2>            
  <table class="table">
   <tbody>
    <thead>
      <tr>
      	<th><label for="empId">Employee ID: <%= emp.getEmpId() %></label></th>
        <th><label for="username">UserName: <%= emp.getUserName() %></label></th>
        <th><label for="firstname">First Name: <%= emp.getFirstName() %></label></th>
		<th><label for="lastname">Last Name: <%= emp.getLastName() %></label></th>
      </tr>
 	 </thead>
 	 <thead>
      <tr> 
      	<td>                <input type="hidden" name="empId" value="<%= emp.getEmpId() %>">
      	</td>
        <td><label for="username">New UserName:</label>
                <input type="text" name="username" value="<%= emp.getUserName() %>"></td>
        <td><label for="firstname">New First Name:</label>
                <input type="text" name="firstname" value="<%= emp.getFirstName() %>"></td>
       	<td><label for="lastname">New Last Name:</label>
                <input type="text" name="lastname" value="<%= emp.getLastName() %>"></td>
       	<td><input type="submit" value="Update"></td>
       	<button><a href="login.jsp">LogOut</a></button>
        </tr>
   	</thead>
   </tbody>
  </table>
</div>
<% }
%>
</form>
</body>
</html>