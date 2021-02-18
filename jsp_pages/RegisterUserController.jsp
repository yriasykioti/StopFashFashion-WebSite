<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.io.*" %>
<%@ page import="omadiki.User"%>
<%@ page import="omadiki.Purchaser"%>
<%@ page import="omadiki.DataBase"%>
<%@ page import="omadiki.UserNGO"%>
<%@ page import="omadiki.Ad"%>
<%@ page import="omadiki.Message"%>
<%@ page import="omadiki.Request"%>

<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>



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

		
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- This CSS file (bootstrap-theme.min.css) is optional -->
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link rel = "stylesheet"  type = "text/css"  href = "myStyle.css" />

		<title>StopFastFashion</title>
						
	</head>
	
	<body>

		 <%request.setCharacterEncoding("UTF-8"); %>

!--Topnav-->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-right">
					
					<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/registerNGO.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up as NGO</a></li>
					<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterUser.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up as Purchaser</a></li>
					<li class="ex1"><a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			
				<ul class="nav navbar-nav navbar-left">
				<div class="navbar-header" >
				<a> <img src="../images/Logo.png" alt="StopFastFashion" height="67" width="206" class="d-inline-block align-top"> </a>
				</div>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Home </a></li>
				</ul>
			</div>
		</nav>
		
		<br><br><br><br><br><br><br>
		 


		<%	
		List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String name1=null;
				String surname=null;
				String email=null;
				String username=null;
				String password=null;
				String confirm=null;
				String phone=null;
				String age=null;
				String filepath=null;
				
				for(FileItem item : multiparts){

				 if(item.isFormField()){ 
					 
					 if ("name".equals(item.getFieldName())){
						name1 = item.getString();
					 }
					 if ("surname".equals(item.getFieldName())){
						surname = item.getString();
					 }
					 if ("email".equals(item.getFieldName())){
						email= item.getString();
					 }
					 if ("phone".equals(item.getFieldName())){
						phone = item.getString();
					 }
					 if ("username".equals(item.getFieldName())){
						username= item.getString();
					 }
					 if ("age".equals(item.getFieldName())){
						age= item.getString();
					 }
					  if ("password".equals(item.getFieldName())){
						password= item.getString();
					 }
					  if ("confirm".equals(item.getFieldName())){
						confirm= item.getString();
					 }
						

				} 
				
					
				
				}
				%>
				
				<%if (name1.length() >= 2 && surname.length() >= 3 && username.length() >= 5 && password.length() >= 5 && phone.length()==10 && confirm.equals(password)){
				
				request.setAttribute("message", "Please login") ;
				int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   
    Date now = new Date();
	long timeMilli = now.getTime();
   
   
   

   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\ismgroup38\\images\\"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      try{ 
         for(FileItem item: multiparts){  
            if ( !item.isFormField () )  {
                String fieldName = item.getFieldName();
                String fileName = item.getName();
				String filePath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\ismgroup38\\images\\" +timeMilli + fileName ;
                boolean isInMemory = item.isInMemory();
                long sizeInBytes = item.getSize();
                File file = new File( filePath) ;
                item.write( file ) ;
				File afile=new File("../images/"+fileName);
				String url="../images/"+timeMilli+fileName;
				String usertype="purchaser";
				name1=new String(name1.getBytes("ISO-8859-1"),"UTF-8");
				surname=new String(surname.getBytes("ISO-8859-1"),"UTF-8");
				email=new String(email.getBytes("ISO-8859-1"),"UTF-8");
				username=new String(username.getBytes("ISO-8859-1"),"UTF-8");
				password=new String(password.getBytes("ISO-8859-1"),"UTF-8");
				
				Purchaser purchaser=new Purchaser();
				Purchaser pur=new Purchaser(name1,surname,email,phone,username, password,url,usertype,age);
				purchaser.registerUser(name1,surname,email,phone,username, password,url,usertype,pur);
            } 
         }
      }catch(Exception ex) {
         out.println(ex);
      }
   }
				
%>
<jsp:forward page="login.jsp"/>
			<%} else {
			%>
			<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
<div class="panel panel-default" style="max-width:420px;margin-left:auto;margin-right:auto;">
						<div class="panel-heading">
			<h4><b>Registration form has errors</b></h4>
			</div>
<div class="panel-body">
			<div class="alert alert-danger" role="alert">
			<ol>
			<% if (name1.length() < 2){
			%> 
				<li>Name must have at least 2 characters.</li>
			<%} if (surname.length() <3) {
			%> 
				<li>Surname must have at least 3 characters.</li>
			<%} if (username.length() <5) {
			%> 	
				<li>Username must have at least 5 characters.</li>
			<%} if (password.length() <5){
			%> 
				<li>Password must have at least 5 characters.</li>
			<%} if (! password.equals(confirm)){
			%> 
				<li>Password and confirm do not match.</li>
			<%}if (phone.length() != 10){
			%> 
				<li>Phone number must have 10 characters.</li>
			<%}%>
			</div>
			</ol>
			<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/RegisterUser.jsp" class="btn btn-info">
			<span class="glyphicon glyphicon-chevron-left"></span> Back to the form
			</a>
</div>
</div>
</div>
</div>
</div>

			<%} %>
			
			
			
			
			
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
		
		
		


	</body>
</html>
			