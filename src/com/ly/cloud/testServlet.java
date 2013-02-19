package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
import com.ly.cloud.LoginServlet;
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
import javax.servlet.http.HttpSession;

import java.util.Random;

public class testServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(testServlet.class.getName());
    public static LoginServlet loginServlet = new LoginServlet();
   public static String result = "default";
   public static int totalNumber = 0;
   public static List<Entity> queryGREWordEntities;
   public static List<Entity> queryDataEntities;
   public static Key GREWordKey;
   public static String generatedGREWord = "BEE";
   public static int number=1;
  public static String userName;
  public static String credit, correctnum, totalnum;
  public static Key userDataKey;
  public static Key userDataQueryKey;
  public static int creditN = loginServlet.creditN, correctnumN =loginServlet.correctnumN, totalnumN = loginServlet.totalnumN;
  public static int count =0;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	HttpSession session=req.getSession();
    	int num1,num2,num3,num4,number = 0;
    	Random rand= new Random();
    	num1 = rand.nextInt(8);
    	num2 = rand.nextInt(10);
    	num3 = rand.nextInt(10);
    	num4 = rand.nextInt(10);
    	number = num1 * 1000 + num2 * 100 + num3 * 10 + num4;
    	if(number ==0)
    	{
    		number = 1;
    	}
    	GREWordKey =  KeyFactory.createKey("GRERepository","default");
    	Query query = new Query("GRERepository", GREWordKey);
    	query.addFilter("Number", Query.FilterOperator.EQUAL, number);   	 
    	DatastoreService datastore =DatastoreServiceFactory.getDatastoreService();
    	PreparedQuery preQuery = datastore.prepare(query);
    	queryGREWordEntities = datastore.prepare(query).asList(FetchOptions.Builder.withChunkSize(10000));
    	totalNumber = queryGREWordEntities.size();    
    	if(totalNumber >0){
    		for(Entity result : preQuery.asIterable()){
    			generatedGREWord = (String) result.getProperty("Vocabulary");
    			generatedGREWord = generatedGREWord.substring(2,generatedGREWord.length()-1);
    			
    		}
    	}
    	credit = req.getParameter("creditval");
    	correctnum = req.getParameter("correctnum");
    	totalnum = req.getParameter("totalnum");
    	userName = req.getParameter("playerName");
    	creditN = Integer.parseInt(credit);
    	correctnumN = Integer.parseInt(correctnum);
    	totalnumN = Integer.parseInt(totalnum);
    	/*
    	userDataKey =  KeyFactory.createKey("UserData","default");
		Entity UserDataEntity = new Entity("UserData", userDataKey);
		UserDataEntity.setProperty("userName", userName);
		UserDataEntity.setProperty("credit", Integer.parseInt(credit));
		UserDataEntity.setProperty("correctnum", Integer.parseInt(correctnum));
		UserDataEntity.setProperty("totalnum", Integer.parseInt(totalnum));
		Date date = new Date();
		UserDataEntity.setProperty("date", date);
		DatastoreService datastoreN = DatastoreServiceFactory.getDatastoreService();
		datastoreN.put(UserDataEntity); 
		
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
    	session.setAttribute("credit", creditN);
    	session.setAttribute("correctnum", correctnumN);
    	session.setAttribute("totalnum", totalnumN);
    	resp.sendRedirect("/pages/Home.jsp");
    	
    }
}
