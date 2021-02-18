<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.io.*" %>
<%@ page import="omadiki.User"%>
<%@ page import="omadiki.Purchaser"%>
<%@ page import="omadiki.DataBase"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="1η Ατομική Άσκηση, Part B - dashboard">
	<meta name="author" content="sofos@aueb.gr">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>1η Ατομική Άσκηση, Part B - dashboard</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
	<!-- Custom styles for this template -->
	<link href="<%=request.getContextPath() %>/css/theme_8170125.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<style>
	.numberCircle {
    width: 60px;
    line-height: 60px;
    border-radius: 50%;
    text-align: center;
    font-size: 32px;
    border: 2px solid #666;
	}
	</style>
	</head>
	
	<body>
				
		
				


		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>2η Ατομική Άσκηση</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Welcome <code><%=name%> <%=surname%></code></h1>
			</div>
			<% UserDAO user=new UserDAO();
				List<User> users = new ArrayList<User>();
				users=user.getUsers();
				int numberOfUsers=users.size();
			%>
			<div class="page-header">
				<h1>Available Users <%=numberOfUsers%></h1>
			</div>
			
			<table style="width:100%">
				<tr background-color: #f1f1c1;>
					<th>A/A</th>
					<th>Username</th> 
					<th>Name</th> 
					<th>Surname</th>
					<th>Email</th>
				</tr>
				
				<% for (int i=0 ; i< users.size() ; i++){
					 User user1=users.get(i);
					%>
					<tr>
					<td> <%=i+1%> </td>
					<td> <a href="http://ism.dmst.aueb.gr/ismgroup38/template_8170125/profile_ex2_8170125.jsp?uname=<%=user1.getUsername()%>"/><%=user1.getUsername()%> </a> </td>
					</form>
					<td> <%=user1.getName()%> </td>
					<td> <%=user1.getSurname()%> </td>
					<td> <%=user1.getEmail() %> </td>
					</tr>
				<% } %>
				
			</table>
				
			
			
			
			
			
		</div>
		<!-- /container -->

		<!-- footer -->
		<footer class="navbar-inverse">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2019 by ismgroup38</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- End footer -->
		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	</body>
</html>