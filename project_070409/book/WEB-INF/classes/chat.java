import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
import java.util.*;
import java.text.*;

public class chat extends HttpServlet
{
  public void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{
			 response.setContentType("text/html;charset=Big5");
			 PrintWriter out = response.getWriter();

			//�w�q�ܼ�
			String name=null;
			String text=null;
			String sql=null;
			
			//���o�o���H�W�r
			if(request.getParameter("name")!=null)
				name = encoding(request.getParameter("name"));
			
			//���o�s�W�ƶ�
			if(request.getParameter("textfield")!=null)
				text = encoding(request.getParameter("textfield"));

			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://140.119.75.216/book?user=admin&password=1234&useUnicode=true&characterEncoding=utf-8");

				if(text!=null){//�s�W
					//���o���
					Date cdate = new Date();
					SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.US);
					String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
					sql="insert into chat(date, name, word) values( '"+date+"', '"+name+"', '"+text+"')";
				}


			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			con.close();
			response.sendRedirect("frame/chat.jsp");

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
