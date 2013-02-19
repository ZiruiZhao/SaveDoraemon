package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(RegisterServlet.class.getName());
   public static String result = "default";
   public static String pass1;
   public static String pass2;
   public static String userName;
   
   public static Key userGroupKey;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	String userName, password, repassword;
    	pass1=req.getParameter("password");
    	pass2=req.getParameter("repassword");
    	password = pass1;
    	userName = req.getParameter("userName");
    	if(pass1.equals(pass2)&&(pass1!=null)&&(pass2!=null)&&(!pass1.equals(""))){
    		userGroupKey =  KeyFactory.createKey("UserGroup","default");
    		Entity UserEntity = new Entity("UserGroup", userGroupKey);
    		UserEntity.setProperty("userName", userName);
    		UserEntity.setProperty("password", password);
    		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    		datastore.put(UserEntity);   		
    	    resp.sendRedirect("/pages/Login.jsp");
    	}
    	else
    	{    		
    		resp.sendRedirect("/pages/Register.jsp");
    	}
        
    }
}
