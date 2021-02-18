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
		<%	
		List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String ngo_name=null;
				String name=null;
				String surname=null;
				String email=null;
				String username=null;
				String password=null;
				String confirm=null;
				String phone=null;
				String link=null;
				String description=null;
				String vat=null;
				String address=null;
				
				for(FileItem item : multiparts){

				 if(item.isFormField()){ 
					 
					 if ("NGOname".equals(item.getFieldName())){
						ngo_name = item.getString();
					 }
					 if ("name".equals(item.getFieldName())){
						name = item.getString();
					 }
					 if ("surname".equals(item.getFieldName())){
						surname= item.getString();
					 }
					 if ("email".equals(item.getFieldName())){
						email = item.getString();
					 }
					 if ("username".equals(item.getFieldName())){
						username= item.getString();
					 }
					 if ("phone".equals(item.getFieldName())){
						phone= item.getString();
					 }
					  if ("password".equals(item.getFieldName())){
						password= item.getString();
					 }
					  if ("confirm".equals(item.getFieldName())){
						confirm= item.getString();
					 }
					  if ("description".equals(item.getFieldName())){
						description= item.getString();
					 }
					 if ("link".equals(item.getFieldName())){
						link= item.getString();
					 }
					  if ("vat".equals(item.getFieldName())){
						vat= item.getString();
					 }
					  if ("address".equals(item.getFieldName())){
						address= item.getString();
					 }
						

				} 
				
					
				
				}
				%>
				
				<%if (ngo_name.length() >=1 && name.length() >= 3 && surname.length() >= 3 && username.length() >= 5 && password.length() >= 5 && phone.length()==10 && confirm.equals(password) && vat.length()==9){
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
				String usertype="ngo";
				ngo_name=new String(ngo_name.getBytes("ISO-8859-1"),"UTF-8");
				name=new String(name.getBytes("ISO-8859-1"),"UTF-8");
				surname=new String(surname.getBytes("ISO-8859-1"),"UTF-8");
				email=new String(email.getBytes("ISO-8859-1"),"UTF-8");
				username=new String(username.getBytes("ISO-8859-1"),"UTF-8");
				password=new String(password.getBytes("ISO-8859-1"),"UTF-8");
				description=new String(description.getBytes("ISO-8859-1"),"UTF-8");
				address=new String(address.getBytes("ISO-8859-1"),"UTF-8");
				UserNGO ngo=new UserNGO();
				UserNGO ngo1=new UserNGO(name,surname,email,phone,username,password,url,usertype,ngo_name,address,description,vat,link);
				ngo.registerUser(ngo_name,name,surname,email,phone,username,password,url,usertype,ngo1);
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
			<div class="page-header">
			<h1>Registration form has errors</h1>
			</div>
			<div class="alert alert-danger" role="alert">
			<ol>
			<% if (ngo_name.length() < 1){
			%> 
				<li>Name must have at least 1 character.</li>
			<% }if (name.length() < 3){
			%> 
				<li>Name must have at least 3 characters.</li>
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
			<%}if ( vat.length()!=9){
			%> 
				<li>Vat must have 9 characters.</li>
			<%}
			%>
			</div>
			</ol>
			<a href="http://ism.dmst.aueb.gr/ismgroup38/omadiki/registerNGO.jsp" class="btn btn-info">
			<span class="glyphicon glyphicon-chevron-left"></span> Back to the form
			</a>
			<%} %>
			
		
			
			
			
			
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
	</body>
</html>
			