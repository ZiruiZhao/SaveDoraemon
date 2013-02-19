<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.ly.cloud.LoginServlet" %>
<%@ page import="com.ly.cloud.testServlet" %>
<%@ page import="com.ly.cloud.logoutServlet" %>

<% logoutServlet servlet = new logoutServlet(); %>
<% LoginServlet ls = new LoginServlet(); %>
<% testServlet tt = new testServlet();
   
%>

<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<html>
  <head>
    <!-- <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" /> -->
    

<style type="text/css">
    
	body {background-image:url(http://img.mi9.com/anime/5043/doremon-doraemon-wallpaper_1600x1200_95202.jpg);filter:alpha(opacity=50)}

	p.serif{font-family:Georgia,Serif}
	
	p.font{
	font-size: 150%;
	font-weight: noramal;
	font-family:"Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(256,256,256)
	}

	p.font3{
	font-size: 100%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(65,105,225)
	}
</style>


  </head>
  
  <body>
</br></br></br></br></br></br></br></br>
</br></br></br></br></br></br></br></br>
</br></br></br></br></br></br></br></br>
  <%if(session.getAttribute("loginName").toString() != null) {%>
  <p class = "font" align = "center">Bye, <b><%=session.getAttribute("loginName").toString() %></b>, Doraemon will miss you! </p>
  <%} %>
  <% session.invalidate(); %>
  <p class = "font" align = "center"> You can come back at any time!</p>
  
  <p class = "font" align = "center">
  <a href=<%=basePath+"/pages/Login.jsp" %>>
  <img border="0" src="https://thatfreething.com/v2/vendor/images/login_button.png" />
  </a>
  </p>
  
    
    
    
    
  </body>
</html>