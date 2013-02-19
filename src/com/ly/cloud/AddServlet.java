package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
import com.ly.cloud.testServlet;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.datastore.PreparedQuery;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

public class AddServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(AddServlet.class.getName());
    public static String userName;
    public static String word;
    public static Key wordListKey;
    public static String credit;
    public static String correctnum;
    public static String totalnum;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
    	userName = req.getParameter("playerName");
    	word = req.getParameter("word");
    	
    	credit = req.getParameter("creditval");
    	correctnum = req.getParameter("correctnum");
    	totalnum = req.getParameter("totalnum");
    	testServlet ts = new testServlet();
    	ts.creditN = Integer.parseInt(credit);
    	ts.totalnumN = Integer.parseInt(totalnum);
    	ts.correctnumN = Integer.parseInt(correctnum);
    	
    	wordListKey =  KeyFactory.createKey("CollectedWordList","default");
		Entity WordEntity = new Entity("CollectedWordList", wordListKey);
		WordEntity.setProperty("word", word);
		WordEntity.setProperty("userName", userName);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		datastore.put(WordEntity);
    		    
    	    resp.sendRedirect("/pages/Home.jsp");
    	
    }
}
