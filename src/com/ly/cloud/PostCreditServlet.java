package com.ly.cloud;

import com.google.appengine.api.datastore.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

public class PostCreditServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(PostCreditServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	 String credit = req.getParameter("creditval");
    	 String correctnum = req.getParameter("correctnum");
    	 String totalnum = req.getParameter("totalnum");
    	 //resp.setContentType("text/html");
			//PrintWriter out = resp.getWriter();
			//out.println(credit);
		    UserService userService = UserServiceFactory.getUserService();
			User user = userService.getCurrentUser();
			Key searchKey = KeyFactory.createKey("user", user.getNickname());
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			Query query = new Query("userdata", searchKey).addSort("date", Query.SortDirection.DESCENDING);;
			List<Entity> results = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(5));
			Entity UserData = new Entity("userdata", searchKey);
			UserData.setProperty("credit", credit);
			UserData.setProperty("correctnum", correctnum);
			UserData.setProperty("totalnum", totalnum);
			Date date = new Date();
			UserData.setProperty("date", date);
			if (results.isEmpty()) {
				datastore.put(UserData);
			} else {
				datastore.delete(searchKey);
				datastore.put(UserData);
			}
			GetCreditServlet.cloudCredit=Integer.parseInt(credit);
			GetCreditServlet.cntCorrect=Integer.parseInt(correctnum);
			GetCreditServlet.cntWord=Integer.parseInt(totalnum);
			 resp.sendRedirect("/pages/Home.jsp");
    }
}
