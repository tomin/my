<!--�B�z�ɶ��n�Ϊ�import-->
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�s�W�峹�B�z</title>
</head>

<body>
<%
	request.setCharacterEncoding("big5");
	String author=(String)request.getParameter("textfield1");
	String title=(String)request.getParameter("textfield2");
	
	if(!author.equals("") && !title.equals("")){
		int isReply=0;//���O�^���峹
		String textarea=(String)request.getParameter("textarea");		
		String IP=(String)request.getRemoteAddr();	
		//���o���
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//���o�ɶ�
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));

	
    	Class.forName("com.mysql.jdbc.Driver"); 
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
		//���o�ثe�峹�s��		
		int id=0;
		String search="select id from message_whole";
		Statement query = con.createStatement();
		ResultSet rs = query.executeQuery(search);
		rs.last();//while(rs.next())
			id=rs.getInt("id")+1;//�̤j���s���A�[�@
		rs.close();
		query.close();
		//�N�d���g�J��Ʈw	
		String up="insert into message_whole(author,title,date,time,IP,id,article,isReply) values('"+author+"','"+title+"','"+date+"','"+time+"','"+IP+"','"+id+"','"+textarea+"','"+isReply+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
		stmt.close();
		con.close();
		response.sendRedirect("message.jsp");
	}
%>
</body>
</html>
