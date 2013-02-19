package com.ly.cloud;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;
import java.util.logging.Logger;
import java.io.IOException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class SaveDoraemonServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(SaveDoraemonServlet.class.getName());
	public static Key greKey;
	public static  int index = 8129;
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		ServletContext context = getServletContext();
		InputStream resourceContent = context.getResourceAsStream("/GREZ.txt");
		Scanner src = new Scanner(resourceContent);
	    src.useDelimiter(",");
       
	    if(!src.hasNext())
	    {
	    	resp.sendRedirect("/pages/Register.jsp");
	    
	    }
	    while (src.hasNext()) {     
	        index++; 
	        greKey =  KeyFactory.createKey("GRERepository","default");
    		Entity GREEntity = new Entity("GRERepository", greKey);
    		GREEntity.setProperty("Vocabulary", src.next());
    		GREEntity.setProperty("Number", index);
    		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    		datastore.put(GREEntity);
	    }
	    resp.sendRedirect("/pages/Login.jsp");
	    
	}
}
