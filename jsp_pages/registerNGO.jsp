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
		
		
		<!--Register Form-->
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
						<div class="panel-heading">
							<center><b>Register as NGO</b></center>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" id="form1" name="form1" method="post" action="RegisterNGOController.jsp" enctype="multipart/form-data">
								
								<div class="form-group">
									<label for="inputnameofngo" class="col-sm-2 control-label">NGO</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="NGOname" id="exampleInputNGOname" placeholder="NGO name" required="">
									</div>
								</div>  
								
								<div class="form-group">
									<label for="inputName" class="col-sm-2 control-label">Name</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="name" id="exampleInputName" placeholder="Name" required="">
									</div>
								</div> 

								<div class="form-group">
									<label for="inputSurname" class="col-sm-2 control-label">Surname</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="surname" id="exampleInputSurname" placeholder="Surname" required="">
									</div>
								</div>  
  
								<div class="form-group">
									<label for="inputEmail" class="col-sm-2 control-label">Email</label>
									<div class="col-sm-9" style="float:right;">
										<input type="email" class="form-control" name="email" id="exampleInputEmail" placeholder="Email" required="">
									</div>
								</div>
  
								<div class="form-group">
									<label for="inputPhone" class="col-sm-2 control-label">Phone</label>
									<div class="col-sm-9" style="float:right;">
										<input type="tel" class="form-control" name="phone" id="exampleInputPhone" placeholder="Phone" required="">
									</div>
								</div>
				
								<div class="form-group">
									<label for="inputUsername" class="col-sm-2 control-label">Username</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="username" id="exampleInputUsername" placeholder="Username" required="">
									</div>
								</div>
				
								<div class="form-group">
									<label for="inputPhoto" class="col-sm-2 control-label">Photo</label>
									<div class="col-sm-9" style="float:right;">
										<input type="file" class="form-control" name="photo" id="exampleInputPhoto" required="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputLink" class="col-sm-2 control-label">Link</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="link" id="exampleInputLink" placeholder="Insert your link" required="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputLink" class="col-sm-2 control-label">Addres</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="address" id="exampleInputLink" placeholder="Insert your address" required="">
									</div>
								</div>
								
								
								<div class="form-group">
									<label for="inputVAT" class="col-sm-2 control-label">VAT</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="vat" id="exampleInputVAT" placeholder="Insert your VAT" required="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputDescription" class="col-sm-2 control-label">Description</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="description" id="exampleInputDescription" placeholder="Insert your Decription" required="">
									</div>
								</div>
																
				
								<div class="form-group">
									<label for="inputPassword" class="col-sm-2 control-label">Password</label>
									<div class="col-sm-9" style="float:right;">
										<input type="password" class="form-control" name="password" id="password" placeholder="Your password" required="">
									</div>
								</div>
				
								<div class="form-group">					
									<label for="inputPassword" class="col-sm-2 control-label">Confirm Password</label>
									<div class="col-sm-9" style="float:right;">
										<input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm password" required="">
									</div>
								</div>

								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm">Sign up</button>
										<button type="reset" class="btn btn-default btn-sm">Reset</button>
									</div>
								</div>
							</form>
						</div>
						<div class="panel-footer">
							Register as Purchaser?<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterUser.html">  Register here</a> 
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