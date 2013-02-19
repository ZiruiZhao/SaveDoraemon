package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
import com.ly.cloud.testServlet;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.ly.cloud.RegisterServlet;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    private static final Logger log =
            Logger.getLogger(LoginServlet.class.getName());
    RegisterServlet rs = new RegisterServlet();
    testServlet ts = new testServlet();
    public static List<Entity> queryResultEntities;
    public static List<Entity> queryDataEntities;
    public static String userName;
    public static String password;
    public static int totalNumber;
    public static String name;
    public static String pass;
    public static Key userDataQueryKey;
    public static int creditN=50;
    public static int correctnumN=0;
    public static int totalnumN=0;
    public static String queryName;
    public static int count =0;
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	HttpSession session=req.getSession();
    	
    	userName = req.getParameter("userName");
    	password = req.getParameter("password");
    	Key userGroupKey =  KeyFactory.createKey("UserGroup","default");
    	Query query = new Query("UserGroup", userGroupKey);
    	DatastoreService datastore =DatastoreServiceFactory.getDatastoreService();
    	queryResultEntities = datastore.prepare(query).asList(FetchOptions.Builder.withChunkSize(10000));
    	totalNumber = queryResultEntities.size();
    	
    	for (Entity queryResultEntity : queryResultEntities){
    	    if(userName.equals(queryResultEntity.getProperty("userName").toString())&&password.equals(queryResultEntity.getProperty("password").toString())&&(userName!=null)){       	    		
    	         session.setAttribute("loginName", userName);
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
    	         userDataQueryKey =  KeyFactory.createKey("UserDataInfo","default");
    	         Query queryData = new Query("UserDataInfo", userDataQueryKey);
    	         
    	         queryData.addFilter("userName", Query.FilterOperator.EQUAL, userName); 
    	         
    	         DatastoreService datastoreM = DatastoreServiceFactory.getDatastoreService();
    	         queryDataEntities = datastoreM.prepare(queryData).asList(FetchOptions.Builder.withChunkSize(10000));
    	         
    	         count = queryDataEntities.size();
    	         if(count !=0){
    	         for(Entity result: queryDataEntities){
 	         		creditN = Integer.parseInt(result.getProperty("credit").toString());
 	         		correctnumN = Integer.parseInt(result.getProperty("correctnum").toString());
 	         		totalnumN = Integer.parseInt(result.getProperty("totalnum").toString());
 	         		queryName = result.getProperty("userName").toString();
 	         	}
    	        /*DatastoreService datastoreN = DatastoreServiceFactory.getDatastoreService();
    Query q = new Query("QueryResultNew");
    List<Entity> outs = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(100));
    for(Entity e: outs){
    	datastoreN.delete(e.getKey());
    }*/          DatastoreService datastoreN = DatastoreServiceFactory.getDatastoreService();
    	         Query q = new Query("UserDataInfo", userDataQueryKey);
    	         q.addFilter("userName", Query.FilterOperator.EQUAL, userName);
    	         List<Entity> outs = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(100));
    	         for(Entity e: outs){
    	         	datastoreN.delete(e.getKey());
    	         }
    	         
    	         }else{
 	         		creditN = 50;
 	         		correctnumN = 0;
 	         		totalnumN = 0;
 	         		
 	         	}
    	         ts.creditN = creditN;
    	         ts.totalnumN = totalnumN;
    	         ts.correctnumN = correctnumN;
    	    	resp.sendRedirect("/pages/Home.jsp");
    	    }
     	   //name = queryResultEntity.getProperty("userName").toString();
     	}
    	resp.sendRedirect("/pages/Login.jsp");
    	
        
    }
}
