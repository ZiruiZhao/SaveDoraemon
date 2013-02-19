package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
import com.ly.cloud.testServlet;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;


import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;

public class ViewServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(ViewServlet.class.getName());
    public static String userName;
    public static Key ViewWordKey;
    public static int totalNumber = 0;
    public static List<Entity> queryCollectedGREWordEntities;
    public static Key GREWordKey;
    public static String credit;
    public static String correctnum;
    public static String totalnum;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	userName = req.getParameter("playerName");
    	
    	credit = req.getParameter("creditval");
    	correctnum = req.getParameter("correctnum");
    	totalnum = req.getParameter("totalnum");
    	testServlet ts = new testServlet();
    	ts.creditN = Integer.parseInt(credit);
    	ts.totalnumN = Integer.parseInt(totalnum);
    	ts.correctnumN = Integer.parseInt(correctnum);
    	
    	
    	GREWordKey =  KeyFactory.createKey("CollectedWordList","default");
    	Query query = new Query("CollectedWordList", GREWordKey);
    	query.addFilter("userName", Query.FilterOperator.EQUAL, userName);   	 
    	DatastoreService datastore =DatastoreServiceFactory.getDatastoreService();
    	//PreparedQuery preQuery = datastore.prepare(query);
    	queryCollectedGREWordEntities = datastore.prepare(query).asList(FetchOptions.Builder.withChunkSize(10000));
    	totalNumber = queryCollectedGREWordEntities.size();
    	resp.sendRedirect("/pages/view.jsp");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    }
}
