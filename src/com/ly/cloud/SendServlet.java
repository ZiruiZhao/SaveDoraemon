package com.ly.cloud;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.ly.cloud.ViewServlet;

public class SendServlet  extends HttpServlet {
	private static final Logger log = Logger.getLogger(SendServlet.class.getName());
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
		Properties props = new Properties();
		ViewServlet sgs = new ViewServlet();
		
        Session session = Session.getDefaultInstance(props, null);
        String address = "dana511@126.com";
        if(req.getParameter("address")!=null)
        {
        	address = req.getParameter("address");
        }
        		
        String msgBody = "";
       
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("yanglingyan2010@gmail.com", "Lingyan"));
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(address, sgs.userName));
            msg.setSubject("Your Collected Words");
            if(sgs.queryCollectedGREWordEntities!= null)
            {
            for (Entity queryResultEntity : sgs.queryCollectedGREWordEntities){
            	msgBody = msgBody + " Word: "+ queryResultEntity.getProperty("word");
            	
            	msgBody = msgBody + "\n";
            }
            }
           
            
            msg.setText(msgBody);
            Transport.send(msg);
            resp.sendRedirect("/pages/view.jsp");
        } catch (AddressException e) {
           
        } catch (MessagingException e) {
            
        }
	}
}

