<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<!--Cookie�n�Ϊ�import-->
<%@ page import="java.net.*" %>
<!--�B�z�ɶ��n�Ϊ�import-->
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�B�z����</title>
</head>
<body>
<%
	String name=(String)request.getParameter("textfield1");
	String word=(String)request.getParameter("textfield2");
	String value=(String)request.getParameter("radiobutton");
	String article_id=(String)request.getParameter("article_id");
	String IP;//���o�Ȥ��IP	
		if(request.getHeader("X-FORWARDED-FOR") == null){//�p�G�S���ϥ�Proxy
			IP = request.getRemoteAddr();//�������o�Ȥ��IP
		}
		else{////�p�G�ϥ�Proxy
			IP = request.getHeader("X-FORWARDED-FOR");//�qProxy�h���oIP
		}
	
	if(!name.equals("") && !word.equals("")){
		//�]�wcookie
		Cookie cookie = new Cookie(URLEncoder.encode("�b��"),URLEncoder.encode(name));
		response.addCookie(cookie);
		//���o���
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//���o�ɶ�
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));
			
		String up="insert into message_single(push_name,push_word,value,date,time,IP,article_id) values('"+name+"','"+word+"','"+value+"','"+date+"','"+time+"','"+IP+"','"+article_id+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
	}
	response.sendRedirect("message_single.jsp?id="+article_id);
%>
</body>
</html>
