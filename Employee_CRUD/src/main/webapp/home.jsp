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
<title>Insert title here</title>
</head>
<body>
<%! Employee emp; 
%>
<% emp = (Employee)session.getAttribute("emp");
employeeService es = new employeeService();

List<Employee> list = es.getEmployee();
if(emp.isAdmin()){
%>
	<div class="container">
  <h2>Basic Table</h2>
  <p>All Employee Data</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Salary</th>
      </tr>
    </thead>
    <tbody>
    <% for(int i = 0; i < list.size(); i++) {%>
      <tr>
      <td><%= list.get(i).getEmpId() %></td>
        <td><%= list.get(i).getFirstName() %></td>
        <td><%= list.get(i).getLastName() %></td>
       	<td><%= list.get(i).getSalary() %></td>
        </tr>
        <%} %>
    </tbody>
  </table>
</div>


<% } else {
%>

<div class="container">
  <h2>Basic Table</h2>
  <p>All Employee Data</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Salary</th>
      </tr>
 	 </thead>
      <% for(int i = 0; i < list.size(); i++) {%>
      <tr><% if(!list.get(i).isAdmin()){ %>
      <td><%= list.get(i).getEmpId() %></td>
        <td><%= list.get(i).getFirstName() %></td>
        <td><%= list.get(i).getLastName() %></td>
       	<td><%= list.get(i).getSalary() %></td>
        </tr>
        <%} %>
    </thead>
    </tbody>
  </table>
</div>
<% }
      }%>
</body>
</html>