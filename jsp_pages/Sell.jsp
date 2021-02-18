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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
		

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
				<% if(request.getAttribute("message") != null) { %>		
			<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<% } %>


					<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
						<div class="panel-heading">
						<center><b>Sell</b></center>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" id="form1" name="form1" method="post" action="SellController.jsp" enctype="multipart/form-data" >
								<div class="form-group">
									<label for="inputPhoto" class="col-sm-2 control-label">Photo</label>
									<div class="col-sm-9" style="float:right;">
										<input type="file"  name="photo" class="form-control" id="exampleInputPhoto" multiple required="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputDescription" class="col-sm-2 control-label">Product Description</label>
									<div class="col-sm-9" style="float:right;">
										<textarea rows="2" cols="24" maxlength="27" name="pd" placeholder="Describe the items you want to sell" required=""></textarea>
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputTotalItems" class="col-sm-offset-0 col-sm-2 control-label">Price</label>
										<div class="col-sm-9" style="float:right;">
											<input type="text" name="price" class="form-control" id="exampleInputSurname" required="" placeholder="Enter the price->for example: 12">
										</div>
								</div>  
								
								
								<div class="form-group">
									<p><div class="col-sm-9" style="float:right;">Choose your product's category</div></p>
								</div> 
								<div class="form-group">
									<label for="inputLadies" class="col-sm-2 control-label">Ladies</label>
									<div class="col-sm-9" style="float:right;">
										<select name="ladies"  >
											<option value="nothing">--</option>
											<option value="T-shirt">T-Shirt</option>
											<option value="Bottoms">Bottoms</option>	
											<option value="Jackets&Coats">Jackets & Coats</option>
											<option value="Skirts">Skirts</option>
											<option value="Dresses">Dresses</option>
											<option value="Shorts">Shorts</option>
											<option value="Bags">Bags</option>
											<option value="Footwear">Footwear</option>
											<option value="Sportswear">Sportswear</option>
											<option value="Underwear">Underwear</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputMens" class="col-sm-2 control-label">Mens</label>
									<div class="col-sm-9" style="float:right;">
										<select name="men">
											<option value="nothing">--</option>
											<option value="T-shirt">T-Shirt</option>
											<option value="Bottoms">Bottoms</option>
											<option value="Jackets&Coats">Jackets & Coats</option>
											<option value="Shirts">Shirts</option>
											<option value="Shorts">Shorts</option>
											<option value="Footwear">Footwear</option>
											<option value="Sportswear">Sportswear</option>
											<option value="Underwear">Underwear</option>
										</select>
									</div>
								</div>
				
								<div class="form-group">
									<label for="inputChildren" class="col-sm-2 control-label">Children</label>
									<div class="col-sm-9" style="float:right;">
										<select name="children">
											<option value="nothing">--</option>
											<option value="T-shirt">T-Shirt</option>
											<option value="Jackets&Coats">Jackets & Coats</option>
											<option value="Skirts">Skirts</option>
											<option value="Dresses">Dresses</option>
											<option value="Bottoms">Bottoms</option>
											<option value="Shorts">Shorts</option>
											<option value="Bags">Bags</option>
											<option value="Footwear">Footwear</option>
											<option value="Sportswear">Sportswear</option>
											<option value="Underwear">Underwear</option>
										</select>
									</div>
								</div> 										
								
								<br><br>
								
								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm">Sell</button>
										<button type="reset" class="btn btn-default btn-sm">Reset</button>
									</div>
								</div>
							</form>
						</div>
						<div class="panel-footer">
							Changed your mind?<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Click here</a> 
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