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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<link href="../css/navbar.css" rel="stylesheet">
						<link href="../css/koumpi.css" rel="stylesheet">



		<link href="../css/navbar.css" rel="stylesheet">
		<link href='https://fonts.googleapis.com/css?family=Fredericka the Great' rel='stylesheet'>
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
		
		<% User user=(User)session.getAttribute("userlogin");
			if (user==null){
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

		<br><br><br><br><br><br>


		

		
<center>

			<div style="height: 170px; width: 700px;">
				<form style="background-color:rgba(255,255,255,0.75)">
					<div class="media">	
						<div class="media-left media-middle">
							<a href="#"><img class="media-object" src="../images/sell2.jpg" alt="Black" height="170" width="200"></a>
						</div>
						<div class="media-body">
							<h2 class="media-heading" ><b><br>Sell</b></h2><p><font size="4,8" color="black">On our site you can sell your old clothes and make money.</font></p>
							<div class="media-body"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Sell.jsp">
								<h4>See how simple it is</h4></a>
							</div>	
						</div>
					</div>
				</form>
			</div>
			
			<br>
			
			<div style="height: 170px; width: 700px;">
				<form style="background-color:rgba(255,255,255,0.8)">
					<div class="media">	
						<div class="media-left media-middle">
							<a href="#"><img class="media-object" src="../images/buy.jpg" alt="Black" height="170" width="200"></a>
						</div>
						<div class="media-body">
							<h2 class="media-heading" ><b><br>Buy</b></h2><p><font size="4,8" color="black">On our site you can find a wide variety of second-hand clothes</font></p>
							<div class="media-body"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Buy.jsp">
								<h4>See how simple it is</h4></a>
							</div>	
						</div>
					</div>
				</form>
			</div>
			
			<br>
			
			<div style="height: 170px; width: 700px;">
				<form style="background-color:rgba(255,255,255,0.8)">
					<div class="media">	
						<div class="media-left media-middle">
							<a href="#"><img class="media-object" src="../images/donate.jpg" alt="Black" height="170" width="200"></a>
						</div>
						<div class="media-body">
							<h2 class="media-heading" ><b><br>Donate</b></h2><p><font size="4,8" color="black">
							You can make many people happy by donating your old clothes.</font></p>
							<div class="media-body"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Donate.jsp">
								<h4>See how simple it is</h4></a>
							</div>	
						</div>
					</div>
				</form>
			</div>
			

<center>

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


