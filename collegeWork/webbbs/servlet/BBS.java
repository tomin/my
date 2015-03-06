import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.*;

public class BBS extends HttpServlet
{
  public void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{
			 response.setContentType("text/html;charset=Big5");
			 PrintWriter out = response.getWriter();

			//�w�q�ܼ�
			String text=null;
			String edit=null;
			String edit_word=null;
			String del=null;
			String sql=null;
			//���o�s�W�ƶ�
			if(request.getParameter("textfield")!=null)
				text = encoding(request.getParameter("textfield"));
			//���o�ק�ID
			edit = request.getParameter("edit_id");
			//���o�ק�ƶ�
			if(request.getParameter("edit_word")!=null)
				edit_word = encoding(request.getParameter("edit_word"));
			//���o�R��ID
			del = request.getParameter("del_id");

			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://tomin.twbbs.org/hems?user=db&password=db&useUnicode=true&characterEncoding=utf-8");

				if(text!=null){//�s�W
					//���o���
					Date cdate = new Date();
					SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
					String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
					sql="insert into bbs(date,word) values('"+date+"','"+text+"')";
				}

				if(edit!=null){//�즸�ק�

					if(edit_word!=null){//�T�w�ק�
						sql="update bbs set word = '" + edit_word + "' where id = " + edit;
					}

					else{//�ק虜��
					String word =  encoding(request.getParameter("word"));
					out.print("<form name=\"form1\" method=\"get\" action=\"./BBS\">");
					out.print("�ק�ƶ��G<input name=\"edit_word\" type=\"text\" size=\"90\" value=\""+word+"\"><input name=\"edit_id\" type=\"hidden\" value=\""+edit+"\"><input type=\"submit\" name=\"Submit\" value=\"�e�X\">");
					out.print("</form>");
					return;
					}

				}


				if(del!=null){//�R��
					sql="delete from bbs where id = " + del;
				}

			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			response.sendRedirect("frame/demoFramesetRightFrame.jsp");

			 } catch (ClassNotFoundException e) {
					 throw new UnavailableException("������J�X�ʵ{��");
				 }catch (SQLException e){
					   throw new UnavailableException("��Ʈw�s�u����");
				 }catch (Exception e) {
					  System.out.println("�o�ͤF" + e + "�ҥ~");
			}

	}


  private String encoding(String str) {
		  try {
				   str = new String(str.getBytes("ISO-8859-1"), "MS950");
		   }
		   catch (UnsupportedEncodingException uee) {
			  System.out.println("UnsupportedEncodingException�G" + uee.getMessage());
		   }

		   return str;
	}
}
