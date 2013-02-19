<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.ly.cloud.ViewServlet" %>

<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<html>
  <title> Save Doraemon </title>

  <bgsound id="sound">
  
  
  
  
  <style type="text/css">

	p.serif{font-family:Georgia,Serif}
	
	p.font{
	font-size: 150%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)
	}
	
	
	.sendMe{
	position:absolute
	x:560
	
	}

	p.font3{
	font-size: 120%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(0,0,0)
	}


	p.fonth{
	font-size: 300%;
	font-weight: bold;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)
	}


body {background-image:url(http://img.mi9.com/anime/5023/doraemon-doraemon-wallpaper_1600x1200_94131.jpg);filter:alpha(opacity=100)}

.baseBoard{
align:left;

height:300;

	font-size: 150%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)
}		


.img{
position: absolute;
top: -60;
    left: 30;
	font-size: 150%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)

}
 

.main{
width: 972px;
height: 900px;
position: absolute;
top: 50;
left: 0;
	font-size: 150%;
	font-weight: noramal;
	font-family:"BankGothic Lt BT","Comic Sans MS", Calibri,Verdana,Sans-serif;
	color:rgb(30,144,225)

}

</style> 

<% ViewServlet servlet = new ViewServlet(); %>
<div class=baseBoard>   

<div id=content class=main">
<%if(servlet.userName!=null){ %>
  
  <table border = none width="600">
   <tr><td align = "center">
<p class = "font3" align = "center">Hi, <b><%=servlet.userName %></b>!</p>

<p class = "font3" align = "center">These are the words you have collected!</p></td></tr>
   </table>
   <table border = "0" width="600">
   <tr><td align = center>
   <p class = "font3" align = "center"><b>WORD LIST</b></p></td></tr>
   
   <br>
   <%
        for (Entity queryResultEntity : servlet.queryCollectedGREWordEntities) {            
                %>
        <tr><td align = "center"><%= queryResultEntity.getProperty("word") %></td></tr>
   <%} %>
   
   
   </table>
   
   <table border = "0" width="600">
   <form action="/send" method="post">
     <tr><td>
	<textarea name="address" rows="2" cols="81"></textarea>
<br/>

<input align = "right" type="submit" value="" style="background-image:url('https://lh6.googleusercontent.com/-WCBQJABnC_M/T7FONXuryDI/AAAAAAAAAIM/1VN25RPX3Eg/s80/SendMe.jpg');width: 80; height: 25;border: none; cursor: pointer;" ">

	</td></tr>
     <tr><td align = "center"><a href=<%=basePath+"/pages/Home.jsp" %>>BACK TO GAME!</a></td></tr>
   </form>
   </table>
   <%}else {%>
   <table border = "0" width="600"><tr><td align = center>
   <br><br>
   <p class = "font3" align = "center">You are not logged in!</p>
   <p class = "font3" align = "center">Please log in first! </p>
<p>
<a href=<%=basePath +"/pages/Login.jsp" %> <img border="0" src="https://thatfreething.com/v2/vendor/images/login_button.png"/> </a>
</p>
</td></tr></table>
   <%} %>
     </div></div>
  </body>
</html>