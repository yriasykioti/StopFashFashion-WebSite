<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.io.*" %>
<%@ page import="omadiki.User"%>
<%@ page import="omadiki.Purchaser"%>
<%@ page import="omadiki.DataBase"%>
<%@ page import="omadiki.UserNGO"%>
<%@ page import="omadiki.Message"%>
<!DOCTYPE html>
<html lang="el">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link href="../css/background.css" rel="stylesheet">
		<link href="../css/navbar.css" rel="stylesheet">
		<link href="../css/avatar.css" rel="stylesheet">
		<link href="../css/profile.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
		
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
				request.setAttribute("message", "Please login to buy clothes.") ;
			%>
			<jsp:forward page= "login.jsp"/>
		<% } else { 
				String username=user.getUsername();
				String usertype=user.getUsertype();
				if (usertype.equals("purchaser")){
					session.setAttribute("userlogin",user);
					%>
							
							<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container-fluid">
				    <div class="navbar-header">
				        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					    <span class="sr-only">Toggle navigation</span>
					    <span class="icon-bar"></span>
					    <span class="icon-bar"></span>
					    <span class="icon-bar"></span>
					    </button>
					    <a> <img src="../images/Logo.png" alt="StopFastFashion" height="67" width="206" class="d-inline-block align-top"></a>
				   </div>

				
					<div id="navbar" class="navbar-collapse collapse">		
						<ul class="nav navbar-nav">
							<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Home </a></li>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ProfilePurchaser.jsp"><i class="fa fa-user-circle-o"></i>Profile </a></li>			
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ProfilePurchaser.jsp"> Signed in as <%=username%></a></li>
			        	<li class="ex1"><a href="<%=request.getContextPath() %>/omadiki/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>	            
						</ul>		


					</div>
				</div>
			</nav>
				<%}else {
				session.setAttribute("userlogin",user);%>
				<jsp:forward page="profileNGO.jsp"/>
			<% } %>
		<%}%>
	
	
		<br><br><br><br><br><br><br><br>
		
				<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
						<%Purchaser us=new Purchaser();
						String username1=user.getUsername();%>
						<div class="panel-heading">
							<center><b><%=username1%></b></center>
						</div>
						
						<div class="profile-usermenu">
							<ul class="nav" >
								<div class="profile-userpic">
								<center>
									<img src="<%=user.getPhoto()%>" width="120" height="120" alt="">
									</center>
								</div>
								<ul class="nav" >
								<div class="profile-usertitle">
									<div class="profile-usertitle-name">
										<%=user.getName()%>	<%=user.getSurname()%>
									</div>
									<div class="profile-usertitle-job">
									Purchaser
									</div>
								</div>
								<div class="profile-usermenu">
									<ul class="nav">
										<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Messages.jsp">
										<i class="glyphicon glyphicon-envelope"></i>My messages </a></li>
										<li>
										<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Wishlist.jsp">
										<i class="glyphicon glyphicon-heart-empty"></i>My wishlist </a></li>
										<li>
										<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Aggelies.jsp">
										<i class="fa fa-id-card" style="font-size:16px"></i>My adds </a>
										</li>
									</ul>
								</div>
							</ul>
						</div>
					</div>
				</div>
			</div>		
		</div>
	
		<br><br><br><br><br>


<footer class="navbar-default navbar-fixed-bottom">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
<p class="text-center"><b>FIND US:</b> <a href="https://www.instagram.com/stopfastfashionfyx/"><i class="fa fa-instagram" style="font-size:22px"></i></a>
				<a href="https://www.facebook.com/stopfastfashion.fyx.1"><i class="fa fa-facebook" style="font-size:22px"></i></a></p>

					</div>
				</div>
			</div>
		</footer>
	
<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>	
		
	
</body>
</html>