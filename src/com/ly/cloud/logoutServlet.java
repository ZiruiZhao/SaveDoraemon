package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
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

public class logoutServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(logoutServlet.class.getName());
   public static String result = "default";
   public static int totalNumber = 0;
   
   public static List<Entity> queryDataEntities;
  public static String userName;
  public static String credit, correctnum, totalnum;
  public static Key userDataKey;
  public static Key userDataQueryKey;
  public static int creditN, correctnumN, totalnumN = 0;
  public static int count =0;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	userName = req.getParameter("playerName");
    	credit = req.getParameter("creditval");
    	correctnum = req.getParameter("correctnum");
    	totalnum = req.getParameter("totalnum");
    	creditN = Integer.parseInt(credit);
    	correctnumN = Integer.parseInt(correctnum);
    	totalnumN = Integer.parseInt(totalnum);
   	
    	userDataKey =  KeyFactory.createKey("UserDataInfo","default");
		Entity UserDataEntity = new Entity("UserDataInfo", userDataKey);
		UserDataEntity.setProperty("userName", userName);
		UserDataEntity.setProperty("credit", creditN);
		UserDataEntity.setProperty("correctnum", correctnumN);
		UserDataEntity.setProperty("totalnum", totalnumN);
		Date date = new Date();
		UserDataEntity.setProperty("date", date);
		DatastoreService datastoreN = DatastoreServiceFactory.getDatastoreService();
		datastoreN.put(UserDataEntity); 
		/*
		userDataQueryKey =  KeyFactory.createKey("UserData","default");
    	Query queryData = new Query("UserData", userDataQueryKey);
    	queryData.addFilter("userName", Query.FilterOperator.EQUAL, userName);   	 
    	DatastoreService datastoreM = DatastoreServiceFactory.getDatastoreService();
    	//PreparedQuery preQuery = datastore.prepare(query);
    	queryDataEntities = datastoreM.prepare(queryData).asList(FetchOptions.Builder.withChunkSize(10000));
    	count = queryDataEntities.size();
    	
    	for(Entity result: queryDataEntities){
        		//creditN = Integer.parseInt(result.getProperty("credit").toString());
        		//correctnumN = Integer.parseInt(result.getProperty("correctnum").toString());
        		//totalnumN = Integer.parseInt(result.getProperty("totalnum").toString());
        	}
        	*/
    	resp.sendRedirect("/pages/Logout.jsp");
    	
    }
}
