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
		<link href="../css/avatar.css" rel="stylesheet">
		<link href="../css/profile.css" rel="stylesheet">
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
		
		<% User user=(User)session.getAttribute("userlogin");
			if (user==null){
			%>
			
		<jsp:forward page="ArxikiOthoni.jsp"/>
		<% } else { 
		String username=user.getUsername();
		String usertype =user.getUsertype();%>
		
		
		<% if (usertype.equals("ngo")){
							session.setAttribute("userlogin",user);
					%>
		
		{
				
		
		
		
		
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
					<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Profile </a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="ex1"><a>Signed in as <%=username%></a></li>
			        	<li class="ex1"><a href="<%=request.getContextPath() %>/omadiki/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>	            
						</ul>		


					</div>
				</div>
			</nav>
		
		
		
		
		
		
		
		
		
		<%
		}
		
		else{
						session.setAttribute("userlogin",user);%>

				<jsp:forward page="ProfilePurchaser.jsp"/>

		}
		<% } %>
		<%}%>
		

		<br><br><br><br><br><br><br>	
						
			

		<div class="container">
    			<div class="row profile">
				<div class="col-md-3" >
					<div class="panel panel-default" style="max-width:200px;margin-left:auto;margin-right:auto;">
						<%UserNGO us=new UserNGO();
						String username2=user.getUsername();%>	
						<div class="panel-heading">
							<center><b><%=username2%></b></center>
						</div>
						<div class="profile-userpics"><br>
						<center>
							<img src=<%=user.getPhoto()%> width="120" height="120" alt="">
							</center>
						</div>
						<div class="profile-usertitle">
							<div class="profile-usertitle-name">
								<%
						String username=user.getUsername();
						String usertype=user.getUsertype();
						String email= user.getEmail();
						String name=user.getName();
						String phone=user.getPhone();	
						String password=user.getPassword();
						String surname=user.getSurname();
						String description=us.getDescription();
						String adress=us.getAddress();
						String link=us.getLink(); %>								
		



								<%=name%> <%=surname%>
							</div>
							<div class="profile-usertitle-job">
							<%=usertype%>
							</div>
						</div>
						<div class="profile-usermenu">
							<ul class="nav">
								<li>
								<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">
								<i class="glyphicon glyphicon-user"></i>
								Account Settings </a>
								</li>
								<li>
								<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RequestsNGO.jsp">
								<i class="glyphicon glyphicon-envelope"></i>
								Requests </a>
								</li>
								<li>
							</ul>
						</div>
					</div>
				</div>




				<div class="container">
					<div class="row">
						<div class="col-xs-10 col-md-6">
							<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
								<div class="panel-heading">
								<center><b>Profile Editing</b></center>
								</div>
								<div class="panel-body">
									<form class="form-horizontal" method="post" action="/ismgroup38/omadiki/ProfileEditingController.jsp">					
										<div class="form-group">
											<label for="inputDescription" class="col-sm-2 control-label">Description</label>
											<div class="col-sm-9" style="float:right;">
												<input type="text" style="float:right;" class="form-control" name="Description" id="Description" value="<%=description%>">
											</div>
										</div>
								
										<div class="form-group">
											<label for="inputLink" class="col-sm-2 control-label">Link</label>
											<div class="col-sm-9" style="float:right;">
												<input type="text" style="float:right;" class="form-control" name="Link" id="Link" value="<%=link%>">
											</div>
										</div>

<div class="form-group">
											<label for="inputPhone" class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-9" style="float:right;">
												<input type="text" style="float:right;" class="form-control" name="Phone" id="Phone" value="<%=phone%>">
											</div>
										</div>

										<div class="form-group">
											<label for="inputEmail" class="col-sm-2 control-label">Email</label>
											<div class="col-sm-9" style="float:right;">
												<input type="text" style="float:right;" class="form-control" name="Email" id="Email" value="<%=email%>">
											</div>
										</div>


								
										<div class="form-group">
											<label for="inputAdress" class="col-sm-2 control-label">Address</label>
											<div class="col-sm-9" style="float:right;">
												<input type="text" style="float:right;" class="form-control" name="adress" id="adress" value="<%=adress%>">
											</div>
										</div>
										

										<div class="form-group">
											<label for="inputUsername" class="col-sm-2 control-label">Username</label>
											<div class="col-sm-9" style="float:right;">
												<input type="text" style="float:right;" class="form-control" name="Username" id="Username" value="<%=username%>">
											</div>
										</div>

								
									
										<div class="form-group">
											<label for="inputPassword" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-9" style="float:right;">
												<input class="form-control" type="password" value="<%=password%>">
											</div>
										</div>
								
										<div class="form-group">
											<label for="inputConfirmPassword" class="col-sm-2 control-label">Confirm password</label>
											<div class="col-sm-9" style="float:right;">
												<input class="form-control" type="password" value="<%=password%>">
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputPhoto" class="col-sm-2 control-label">Photo</label>
											<div class="col-sm-9" style="float:right;">
												<input type="file" style="float:center;" class="form-control" name="photo" id="photo">
											</div>
										</div>
																
										<div class="form-group last">
											<div class="col-sm-offset-3 col-sm-9">
												<button type="submit" class="btn btn-success btn-sm">Save changes</a></button>
												<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ProfileNGO.jsp"><input type="button" class="btn btn-dangerous" value="Back"></a>
											</div>
										</div>
									</form>
								</div>	
							</div>
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



