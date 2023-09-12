<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%! String msg; %>
<% msg = (String)request.getAttribute("msg"); 
if(msg != null){
%>
<div><%= msg %></div>
<%} %>
<div class="container">
  <h2>Vertical (basic) form</h2>
  <form action="LoginCtl" method="post">
    <div class="form-group">
      <label for="userName">User Name</label>
      <input type="text" class="form-control" id="userName" placeholder="Enter userName" name="username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
    </div>
    <button type="submit" class="btn btn-default" name="operation" value="login">Login</button>
  </form>
</div>
</body>
</html>