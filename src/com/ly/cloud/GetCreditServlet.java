package com.ly.cloud;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


import java.io.IOException;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GetCreditServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(GetCreditServlet.class.getName());

    public static int cloudCredit=50;
    public static int cntCorrect=0;
    public static int cntWord=0;
   
   
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		Key searchKey = KeyFactory.createKey("user", user.getNickname());
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query("userdata", searchKey).addSort("date", Query.SortDirection.DESCENDING);
		List<Entity> results = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(5));
    	if (results.isEmpty()) {
    		cloudCredit=50;
    		cntCorrect=0;
    		cntWord=0;
    	} else {
    		Entity result = results.get(0);
    		cloudCredit=Integer.parseInt(result.getProperty("credit").toString());
    		cntCorrect=Integer.parseInt(result.getProperty("correctnum").toString());
    		cntWord=Integer.parseInt(result.getProperty("totalnum").toString());
    	}       	    
    	    resp.sendRedirect("/pages/Home.jsp");
    	
    }
}
