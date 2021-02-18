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
							<li class="ex1"><a  href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Home </a></li>				
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>	
							<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/registerNGO.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up as NGO</a></li>
							<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterUser.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up as Purchaser</a></li>	            
						</ul>		


					</div>
				</div>
			</nav>
			
			<br><br><br><br><br><br>
		
		
			
		
		
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<% if(request.getAttribute("message") != null && !request.getAttribute("message").equals("Please login")) { %>		
			<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<% } %>
		
		<% if(request.getAttribute("message") != null && request.getAttribute("message").equals("Please login")) { %>		
			<div class="alert alert-success" role="alert">
				Registration done! Please login.
			</div>
		<% } %>
					<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
						<div class="panel-heading">
							<center><b>Login</b></center>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" method="post" action="/ismgroup38/omadiki/loginController.jsp">
								
								<div class="form-group">
									<label for="inputUsername" class="col-sm-2 control-label">Username</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" style="float:right;" class="form-control" name="username" id="username" placeholder="Username" required="">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword"  class="col-sm-2 control-label" >Password</label>
									<div class="col-sm-9" style="float:right;">
										<input type="password"  class="form-control" name="password" id="inputPassword3" placeholder="Password" required="">
									</div>
								</div>
																<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm">Sign in</a></button>
										<button type="reset" class="btn btn-default btn-sm">Reset</button>
									</div>
								</div>
							</form>
						</div>
						<div class="panel-footer">
							Not Registered?  <a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterUser.jsp">Register here as Purchaser</a><br> &emsp;  &emsp; &emsp; &emsp;  &emsp; &emsp;<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/registerNGO.jsp"> or Register here as NGO</a> 
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
