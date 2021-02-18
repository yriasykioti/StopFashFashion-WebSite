
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="omadiki.User"%>
<%@ page import="omadiki.Purchaser"%>
<%@ page import="omadiki.DataBase"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>

 
<%
try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
String name = item.getFieldName();
String value = item.getString();
if(name.equals("file"))
{
ImageFile=value;
}
 
}
else
{
try
{
	 String name="mitsos";
				String surname="aggelopoylos";
				String email="mitsakos@gmail.com";
				String username="mitsaras";
				
				String password="123mitsos";
				String phone="6987898098";
				String age="76";
itemName = item.getName();
File savedFile = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\ismgroup38\\images\\"+itemName);
item.write(savedFile);

String photo=(new StringBuilder()).append("../images/").append(itemName).toString();  

}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}

}
}
catch (Exception e){
out.println(e.getMessage());
}
%>
