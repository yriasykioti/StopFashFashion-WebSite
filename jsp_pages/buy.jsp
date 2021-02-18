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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

		<link href="../css/background.css" rel="stylesheet">
		<link href="../css/ButtonAO.css" rel="stylesheet">
		<link href="../css/navbar.css" rel="stylesheet">
		<link href="../css/avatar.css" rel="stylesheet">
		<link href="../css/profile.css" rel="stylesheet">
		<link href="../css/123.css" rel="stylesheet">

		<link rel="icon" href="../images/images.jpg">


		<link rel = "stylesheet"  type = "text/css"  href = "myStyle.css" />

<style>
#A {width: 55%;}
</style>

					
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
				<ul class="nav navbar-nav navbar-right">
						<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ProfilePurchaser.jsp">Signed in as <%=username%></a></li>
			        	<li class="ex1"><a href="<%=request.getContextPath() %>/omadiki/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>			            
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
				<%}else {
				session.setAttribute("userlogin",user);%>
				<jsp:forward page="profileNGO.jsp"/>
			<% } %>
		<%}%>


			<%  Ad ad=new Ad();
			List<Integer> purchaserid=new ArrayList<Integer>();
			List<Ad> ads=new ArrayList<Ad>();
			ads=ad.getAds();
			purchaserid=ad.getPurchaserid();
			%>	
			<div class="container">
			<div class="w3-row-padding">
				<div class="w3-third">
			<div class="panel panel-default text-center" >
				<div class="panel-heading">
				<center><h4>Choose from the following<h4></center>
				</div>
				<br>
				<div class="panel panel-default">
					<form class="form-horizontal" id="form1" name="form1" method="post" action="BuyController.jsp">
						<div class="form-group">
							<label for="inputTypeOfClothes" class="col-sm-offset-0 col-sm-2 control-label">Gender categories</label>
								<div class="col-sm-9" style="float:center;">
									<label class="checkbox-inline"><input type="radio" name="gender" value="ladies">Women</label>
									<label class="checkbox-inline"><input type="radio" name="gender" value="men">Men</label>
									<label class="checkbox-inline"><input type="radio" name="gender" value="children">Children</label>
								 </div>
								 <button type="submit" class="btn btn-info btn-sm">Search</button>

							 </label>
						</div>
					</form>
				</div>
			</div>


			<%	int purid;
			Purchaser purch=new Purchaser();
			int purchid=purch.purchaserid(user.getUsername());
			for (int i=0; i<ads.size() ; i++){
			Ad ad1=ads.get(i);
			purid=purchaserid.get(i);
			%>



			<div class="item  col-xs-6 col-lg-3">
				<div class="thumbnail">
		<a target="_blank" href="<%=ad1.getPhoto()%>">
  <img src="<%=ad1.getPhoto()%>" alt="Forest" style="width:150px;height:200px">
</a>					<div class="caption">
						<h4 class="group inner list-group-item-heading text-center"><%=ad1.getProductDescription() %></h4>
						<div class="row">
							<div class="col-xs-12">
								<p class="lead text-center">
								<strong>Price: </strong><%=ad1.getPrice()%>
 
								&euro;
								</p>
							</div>
							<div class="col-xs-12 text-center">	
								<form class="form-horizontal" id="form1" name="form1" method="post" action="SendMessage.jsp">
									<input type="hidden" id="custId" name="purchaserid" value="<%=ad1.getPurchaser_id()%>">
									<input type="hidden" id="custId" name="photo" value="<%=ad1.getPhoto()%>">
									<button type="submit" id="A" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-info-sign"></span>Ask for info</button>
								</form>
								<form class="form-horizontal" id="form1" name="form1" method="post" action="AddtoWishlistController.jsp">
									<input type="hidden" id="custId" name="purchaserid" value="<%=purchid%>">
									<input type="hidden" id="custId" name="adid" value="<%=ad1.getAd_id()%>">
									<button type="submit" id="A" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-heart"></span>Add to wishlist</button>
								</form>
							</div> <!-- /col-xs-12 -->
						</div> <!-- /row -->
					</div> <!-- /caption -->
				</div> <!-- /thumbnail -->
			</div> <!-- /item -->
			<%}%>
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