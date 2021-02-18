<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.io.*" %>
<%@ page import="omadiki.User"%>
<%@ page import="omadiki.Purchaser"%>
<%@ page import="omadiki.DataBase"%>
<%@ page import="omadiki.UserNGO"%>
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
		<link href="../css/body.css" rel="stylesheet">
		
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- This CSS file (bootstrap-theme.min.css) is optional -->
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link rel = "stylesheet"  type = "text/css"  href = "myStyle.css" />

		<title>StopFastFashion</title>
						
	</head>

	
	<body>
	
	
		<% request.setCharacterEncoding("UTF-8"); %>
		
		<% User user=(User)session.getAttribute("userlogin");
			if (user==null){
			%>
			
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-right">
					<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>	
					<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterNGO.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up as NGO</a></li>
					<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterUser.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up as Purchaser</a></li>
				</ul>
			
				<ul class="nav navbar-nav navbar-left">
				<div class="navbar-header">
				<a> <img src="../images/Logo.png" alt="StopFastFashion" height="82" width="250"> </a>
				</div>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Home </a></li>
				</ul>
			</div>
		</nav>
		<% } else { 
				String username=user.getUsername();
				String usertype=user.getUsertype();
				%>
				<%if (usertype.equals("purchaser")){%>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-right">
						<li><p class="navbar-text">Signed in as <%=username%></p></li>
			        	<li><a href="<%=request.getContextPath() %>/omadiki/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>			            
			     </ul>		
			
				<ul class="nav navbar-nav navbar-left">
				<div class="navbar-header">
				<a> <img src="../images/Logo.png" alt="StopFastFashion" height="82" width="250"> </a>
				</div>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Home </a></li>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ProfilePurchaser.jsp"><i class="fa fa-user-circle-o"></i>Profile </a></li>
				</ul>
			</div>
		</nav>
				<%}else {%>
				<jsp:forward page="login.jsp"/>
			<% } %>
		<%}%>

		<br><br><br><br><br><br><br><br><br><br><br>

		<center>
		<button class="button button1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Buy.jsp"><b>Buy</b></a>  </button>   &emsp;  &emsp;
		
		<button class="button button1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Donate.jsp"><b>Donate</b></a></button> &emsp;  &emsp; 
		
		<button class="button button1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Sell.jsp"><b>Sell </b> </a> </button>  
		
		</center>
		
		
	
	
	
	
	
<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
	</body>
</html>


