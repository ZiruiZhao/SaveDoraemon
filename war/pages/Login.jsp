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
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<html>
  <head>
    <!-- <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" /> -->
	
	<style type="text/css">

	body {background-image:url(http://img.mi9.com/anime/5023/doraemon-doraemon-wallpaper_1600x1200_94131.jpg);filter:alpha(opacity=100)}

	p.serif{font-family:Georgia,Serif}
	
	p.font{
	font-size: 150%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)
	}

	p.font3{
	font-size: 100%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)
	}


	p.fonth{
	font-size: 300%;
	font-weight: bold;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)
	}
	

	</style>

  </head>

  <body>
  
<% LoginServlet ls = new LoginServlet(); %>


<br/>
<br/>
<p class = "fonth" align = "center">Welcome to Vocab-Cloud!</p>
<p class = "fonth" align = "center">Remember Words and Have Fun!</p>



    <form action="/Login" method="post">
    

	<p class="font" align = "center">
          <label>Username:
             <input type="text" length=10 name="userName" />
        </p>


          <p class="font" align="center">
              <label>Password:
              <input type="password" length=10 name="password" />
              </label>
          </p>
          



<p align = "center">

<input type="submit" value="" style="background-image:url('https://thatfreething.com/v2/vendor/images/login_button.png');width: 80; height: 25;border: none; cursor: pointer;" ">

<input type="reset" value="" style="background-image:url('https://lh3.googleusercontent.com/-vfc9ELsj2YA/T7CyvYsVIZI/AAAAAAAAAHo/6IaZB34XABw/s80/reset.jpg');width: 80; height: 25;border: none; cursor: pointer;" ">

</p>

 
    </form>

        <p class = "font3" align = "center">
	Don't have an Account?
	</p>

       <p class = "font3" align = "center">
       <a href=<%=basePath+"/pages/Register.jsp" %>>Click to Register!</a>
       </p>




  </body>
</html>