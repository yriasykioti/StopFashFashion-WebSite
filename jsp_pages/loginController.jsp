<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.io.*" %>
<%@ page import="omadiki.User"%>
<%@ page import="omadiki.Purchaser"%>
<%@ page import="omadiki.DataBase"%>
<%@ page import="omadiki.UserNGO"%>
<%@ page import="omadiki.Ad"%>
<%@ page import="omadiki.Message"%>
<%@ page import="omadiki.Request"%>

<!DOCTYPE html>
<html lang="el">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link href="../css/background.css" rel="stylesheet">
		<link href="../css/ButtonAO.css" rel="stylesheet">
		<link href="../css/navbar.css" rel="stylesheet">
		<link rel="icon" href="../images/images.jpg">

		
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- This CSS file (bootstrap-theme.min.css) is optional -->
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link rel = "stylesheet"  type = "text/css"  href = "myStyle.css" />

		<title>StopFastFashion</title>
						
	</head>
	
	<body>
	
	<% request.setCharacterEncoding("UTF-8"); %>
		
		<div class="container theme-showcase" role="main">
			
			<% String username=request.getParameter("username");
				String password=request.getParameter("password");
			
			
			User user = new User();
			
			try{
				User user1 = user.authenticate(username,password);
				
				session.setAttribute("userlogin",user1); 
				if(user1==null){
					throw new Exception("wrong.");
				}
				response.sendRedirect("ArxikiOthoni.jsp");
				
			%>
			
			
				
			<%}catch(Exception e){
				request.setAttribute("message", "Wrong username or password") ;
			%>
				<jsp:forward page="login.jsp"/>
			
			<%
			}
			%>
			
		</div>
	`<footer class="navbar-inverse">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<p class="text-center">&copy; Copyright 2019 by ismgroup38</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer -->

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script	src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
       
  </body>
</html>