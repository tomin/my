import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class user extends HttpServlet
{
  public void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{
			HttpSession session = request.getSession();

			//session.setAttribute("rank","abcdefg");
			//String rank=(String)session.getAttribute("rank");

			 response.setContentType("text/html;charset=Big5");
			 PrintWriter out = response.getWriter();

			if(session==null){
					response.sendRedirect("../index.jsp");
			}


			//�w�q�ܼ�
			String select=null;
			String id=null;
			String password=null;
			String radio=null;
			String del=null;
			String sql=null;

			//���o�s�W�ϥΪ�
			if(request.getParameter("id")!=null){
				select = request.getParameter("select");
				id = request.getParameter("id");
				password = request.getParameter("password");
				sql="insert into user(id,password,rank) values('"+id+"','"+password+"','"+select+"')";
			}
			//���o�ק�ϥΪ�
			if(request.getParameter("radiobutton")!=null){//���Q�֨�
				radio = request.getParameter("radiobutton");//��b��
				select = request.getParameter("select2");//�s����
				if(radio.equals("admin") && !select.equals("9")){
					out.print("admin��������Q���");
					return;
				}
				sql="update user set rank = '" + select + "'";

				if(!request.getParameter("id2").equals("")){//�s�b��
					id = request.getParameter("id2");
					sql = sql + "  , id = '" + id + "'";
				}
				if(!request.getParameter("password2").equals("")){//�s�K�X
					password = request.getParameter("password2");
					sql = sql + "  , password = '" + password + "'";
				}
 					sql = sql + " where id = '" + radio + "'";
			}
			//���o�R��ID
			del = request.getParameter("del");
			if(del!=null){
				if(del.equals("admin")){
					out.print("admin�b������Q�R��");
					return;
				}else{
					sql="delete from user where id = '"+del+"'";
				}
			}


			try{

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con = DriverManager.getConnection("jdbc:mysql://140.119.75.216/book?user=admin&password=1234");

				Statement stmt = con.createStatement();
				stmt.executeUpdate(sql);
				stmt.close();
				con.close();
				response.sendRedirect("./system/user.jsp");

			}catch (ClassNotFoundException e) {
					 throw new UnavailableException("������J�X�ʵ{��");
			}catch (SQLException e) {
					   throw new UnavailableException("��Ʈw�s�u����");
			}catch (Exception e) {
					  System.out.println("�o�ͤF" + e + "�ҥ~");
			}

	}

}
