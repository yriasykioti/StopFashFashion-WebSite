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
	<% request.setCharacterEncoding("UTF-8"); %>
		
		<% User user=(User)session.getAttribute("userlogin");
			if (user==null){
				request.setAttribute("message", "Please login to sell your clothes.") ;
			%>
			<jsp:forward page= "login.jsp"/>
		
		<% } else { 
				String username=user.getUsername();
				String usertype=user.getUsertype();
				%>
				<%if (usertype.equals("purchaser")){%>
				<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-right">
						<li class="ex1"><a>Signed in as <%=username%></a></li>
			        	<li class="ex1"><a href="<%=request.getContextPath() %>/omadiki/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>			            
			     </ul>		
			
				<ul class="nav navbar-nav navbar-left">
				<div class="navbar-header">
				<a> <img src="../images/Logo.png" alt="StopFastFashion" height="67" width="206" class="d-inline-block align-top"> </a>
				</div>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Home </a></li>
				<li class="ex1"><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ProfilePurchaser.jsp"><i class="fa fa-user-circle-o"></i>Profile </a></li>
				</ul>
			</div>
		</nav>
				
			<% } %>
		<%}%>

		<br><br><br><br><br><br><br>


		
				
				<%request.setCharacterEncoding("UTF-8"); %>
		<%	
		List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			 String description=null;
			 String producttype=null;
			 String ngousername=null;
			 
				for(FileItem item : multiparts){

				 if(item.isFormField()){ 
					 
					 if ("gender".equals(item.getFieldName())){
						producttype = item.getString();
					 }
					 if ("description".equals(item.getFieldName())){
						description = item.getString();
					 }
					 if ("ngousername".equals(item.getFieldName())){
						ngousername= item.getString();
					 }
					
				} 	
				
				}
				
%>
			  
			   
			   <% 
				if (user==null){
					request.setAttribute("message", "Please login to donate your clothes.") ;%>
					<jsp:forward page= "login.jsp"/>
				<%}else {
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
				description=new String(description.getBytes("ISO-8859-1"),"UTF-8");
				producttype=new String(producttype.getBytes("ISO-8859-1"),"UTF-8");
				ngousername=new String(ngousername.getBytes("ISO-8859-1"),"UTF-8");
				Request reque=new Request();
				Request req1=new Request(url,producttype,description);
				String username=user.getUsername();
				Purchaser pur=new Purchaser();
				int purid=pur.purchaserid(user.getUsername());
				UserNGO ngous=new UserNGO();
				int usngo=ngous.ngoid(ngousername);
				reque.addRequest(req1,purid,usngo,ngousername);
            } 
         }
      }catch(Exception ex) {
         out.println(ex);
      }
   }
				
				
				
				}%>
				
				
				

<div class="col-md-4 col-md-offset-4">
				<div class="alert alert-success text-center" role="alert">Your donation has been successfully submitted  <br> <center><a class="active" href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/ArxikiOthoni.jsp">Back</a> </center></div>
				
				<center>
				<a> <img src="../images/thanks.png" alt="Thank you for donating" width="355"> </a>
<center>

</div>
			
			
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
	</body>
</html>
			