<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<%-- Cookie�n�Ϊ�import --%>
<%@ page import="java.net.*" %>
<%-- �B�z�ɶ��n�Ϊ�import --%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�^���峹�B�z</title>
</head>

<body>
<%
	String author=(String)request.getParameter("textfield1");
	String title=(String)request.getParameter("textfield2");
	String password=(String)request.getParameter("textfield3");	
		
	if(!author.equals("") && !title.equals("")){
		//�]�wcookie
		Cookie cookie1 = new Cookie(URLEncoder.encode("�b��"),URLEncoder.encode(author));
		Cookie cookie2 = new Cookie(URLEncoder.encode("�K�X"),URLEncoder.encode(password));		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
			
		int isReply=1;//�O�^���峹
		String textarea=(String)request.getParameter("textarea");		
		String IP;//���o�Ȥ��IP	
			if (request.getHeader("X-FORWARDED-FOR") == null) {
				IP = request.getRemoteAddr();
			}
			else {
				IP = request.getHeader("X-FORWARDED-FOR");
			}	
		//���o���
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//���o�ɶ�
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));

		//���o�ثe�峹�s��		
		int id=0;
		String search="select id from message_whole";
		Statement query = con.createStatement();
		ResultSet rs = query.executeQuery(search);
		rs.last();
			id=rs.getInt("id")+1;//�̤j���s���A�[�@
		rs.close();
		query.close();
		//�N�d���g�J��Ʈw	
		String up="insert into message_whole(author,title,date,time,IP,id,article,isReply,password) values('"+author+"','"+title+"','"+date+"','"+time+"','"+IP+"','"+id+"','"+textarea+"','"+isReply+"','"+password+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
		stmt.close();
		con.close();
		response.sendRedirect("message.jsp");
	}
%>
</body>
</html>
