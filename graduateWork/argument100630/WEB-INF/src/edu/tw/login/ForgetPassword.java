package edu.tw.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;

import edu.tw.ajax.JSONWriter;
import edu.tw.mail.Mail;

public class ForgetPassword extends Action  {

	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
    	String sql = "";
		JSONWriter jsonWriter = new JSONWriter(response);
		JSONArray list = new JSONArray();    	
    	
    	String email = request.getParameter("email");
    	
        try{
        	sql = "SELECT id,password FROM user where email = ? limit 1";
			con = DriverManager.getConnection("proxool.argument");	
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();					
							
			if(rs.next()){
				    		
	    	    //�g�H
	    		String words = "�A���b���O�G" + rs.getString("id") + "\n"
	    					   + "�A���K�X�O�G" + rs.getString("password") + "\n\n\n"
	    					   + "--\n"
	    					   + "�ֺ����������ưȩ�\n"
	    					   + "http://npc.twbbs.org";
	    		
	    		Mail mail = new Mail();
	    		mail.SimpleMail(email, "[�ֺ����������ưȩ�] �A���b���M�K�X", words);
	    		
	    		list.add("ok");
			}else{
				list.add("none");				
			}
	
        } catch (SQLException e) {
        	list.add("sql");
		} finally{			
			//close sql
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(con!=null)con.close();				
			} catch (SQLException e) {
				e.printStackTrace();
			}  			
		}
    	
		jsonWriter.send(list);
		return null;
	}
}
