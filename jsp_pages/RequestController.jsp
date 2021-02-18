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
	
	
	

	<% request.setCharacterEncoding("UTF-8"); %>
			<% String accept=request.getParameter("accept");
			 String decline = request.getParameter("decline");
			 String purid1=request.getParameter("purid");
			 String requestid1=request.getParameter("reqid");
			 String photo=request.getParameter("photo");
			 int purid = Integer.parseInt(purid1);
			 int requestid=Integer.parseInt(requestid1);
			 %>
			 
			 <% request.setCharacterEncoding("UTF-8"); 
			  User user=(User)session.getAttribute("userlogin");
			  String username=user.getUsername();
			  Message mes=new Message();
				if (decline!=null){
				String description="Your donation has been declined";
				 UserNGO usngo=new UserNGO();
				 int sender=usngo.ngoid(username);
				 int receiver=purid;
				 Message message=new Message(sender,receiver,description,photo);
				 mes.addMessage(sender,receiver,description,photo);
				}
				if (accept!=null){
				 String description="Your donation has been accepted";
				 UserNGO usngo=new UserNGO();
				 int sender=usngo.ngoid(username);
				 int receiver=purid;
				 Message message=new Message(sender,receiver,description,photo);
				 mes.addMessage(sender,receiver,description,photo);
				}
				Request req=new Request();
				req.deleteRequest(requestid);
				
				 %>
				 
				 <jsp:forward page= "RequestsNGO.jsp"/>
				 
				 
				
				
				
				
				
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
			