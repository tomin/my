package gis.taiwan.mail;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;



/**
 * 
 * @author tomin
 *
 */
public class Mail extends Action {

	private static final String MAIL_CONFIG_BUNDLE_NAME = "mailconfig.mail";
	
	/**
	 * @param args
	 * @throws MessagingException 
	 * @throws AddressException 
	 * @throws IOException 
	 * @throws SQLException 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException, SQLException {

		
				return null;
	}

	

	
	public void SimpleMail(String to, String subject, String messageText) throws AddressException, MessagingException, IOException, SQLException {

		
		// �qmail.properties�ɤ����o�]�w
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle(MAIL_CONFIG_BUNDLE_NAME);
	    String mailserver = bundle.getString("mailserver");	
		String From         = bundle.getString("From");
		String loginid      = bundle.getString("loginid");
		String loginpw      = bundle.getString("loginpw");
		
		InternetAddress[] address = null;	
		
		//********************************* SMTP���n���]�w  **********************// 
	    boolean sessionDebug = false;

	    // �]�w�ҭn�Ϊ�Mail ���A���M�ҨϥΪ��ǰe��w
        java.util.Properties props = System.getProperties();
	    props.put("mail.host",mailserver);
		props.put("mail.transport.protocol","smtp");
		//�ĥ�SSL
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");    
		props.put("mail.smtp.auth","true");
 
		// ���ͷs��Session �A��
		javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(props,null);
		mailSession.setDebug(sessionDebug);
		
		Message msg = new MimeMessage(mailSession);

		// �]�w�ǰe�l�󪺵o�H�H
		msg.setFrom(new InternetAddress(From));
		  
		// �]�w�ǰe�l��ܦ��H�H���H�c
		address = InternetAddress.parse(to,false);
		msg.setRecipients(Message.RecipientType.TO, address);
			  
		// �]�w�H�����D�D
		String subject2 = javax.mail.internet.MimeUtility.encodeText(subject,"UTF-8", null);
		msg.setSubject(subject2);
		
		// �]�w�e�H���ɶ�
		msg.setSentDate(new Date());
		
		//�]�w�ǰe�H��MIME Type		
        Multipart mp = new MimeMultipart();
	    MimeBodyPart mbp = new MimeBodyPart();
	    
	    //�]�w�l�󤺮e�����A
	    msg.setHeader("Content-Transfer-Encoding","utf-8");
	    mbp.setContent(messageText,"text/plain;charset=UTF-8");//�]�w�l�󤺮e�����A�� text/plain			

	    
	    mp.addBodyPart(mbp);
	    msg.setContent(mp);

	    // �e�H(���Q�H�N��o��mark���N�n�F)
		Transport transport = mailSession.getTransport("smtp");
		transport.connect(mailserver, loginid, loginpw);		
		transport.sendMessage(msg, msg.getAllRecipients());
		transport.close();
		
	}
	
	
	
	
	
}	