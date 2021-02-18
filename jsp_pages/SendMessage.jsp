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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">		
		<meta charset="utf-8">		
		<title>StopFastFashion</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!-- Bootstrap theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>		
		<!-- Custom js for this template -->
		<script src="js/main.js"></script>		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link href="../css/background.css" rel="stylesheet">
		<link href="../css/ButtonAO.css" rel="stylesheet">
		<link href="../css/navbar.css" rel="stylesheet">
		<link href="../css/avatar.css" rel="stylesheet">
		<link href="../css/profile.css" rel="stylesheet">
		<link href="../css/123.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

		<link rel="icon" href="../images/images.jpg">


		<link rel = "stylesheet"  type = "text/css"  href = "myStyle.css" />


					
	</head>

	
<body>
	
	
		<% request.setCharacterEncoding("UTF-8"); %>
		
		<% User user=(User)session.getAttribute("userlogin");
			if (user==null){
				request.setAttribute("message", "Please login to sell your clothes.") ;
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

		
		
		<% request.setCharacterEncoding("UTF-8"); %>
		 <% 
			String purid=request.getParameter("purchaserid");
			int purchaserid= Integer.parseInt(purid);
			Purchaser pur=new Purchaser();
			String username=pur.purchaserusername(purchaserid);
			String photo=request.getParameter("photo");
		 %> 
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
						<div class="panel-heading">
							<center><b>Send Message</b></center>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" id="form1" name="form1" method="post" action="SendMessageController.jsp">
								
								<div class="form-group">
									<label for="inputnameofngo" class="col-sm-2 control-label">From:</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="sender" id="exampleInputNGOname" placeholder="NGO name" value="<%=user.getUsername()%>">
									</div>
								</div>  
								
								<div class="form-group">
									<label for="inputName" class="col-sm-2 control-label">To:</label>
									<div class="col-sm-9" style="float:right;">
										<input type="text" class="form-control" name="receiver" id="exampleInputName" placeholder="Name" value="<%=username%>">
									</div>
								</div> 

								<div class="form-group">
									<label for="inputDescription" class="col-sm-2 control-label">Message: </label>
										<div class="col-sm-9" style="float:right;">
											<textarea rows="5" cols="24" required=""  name="description" placeholder=""></textarea>
										</div>
								</div>

								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<input type="hidden" id="custId" name="photo" value="<%=photo%>">
										<button type="submit" class="btn btn-success btn-sm">Send Message</button>
										<button type="reset" class="btn btn-default btn-sm">Reset</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/Buy.jsp" class="btn btn-info">
			<span class="glyphicon glyphicon-chevron-left"></span> Back
		</a>
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