<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�d���Q��</title>
</head>

<body>
<%
	int push_value=0;
	//�n���e�����string��integer����k..
	int id=Integer.parseInt(request.getParameter("id"));
	
	
	request.setCharacterEncoding("big5");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");

	//�d�ߤ峹�s��	
    String query0 = "select id from message_whole";
    Statement stmt0 = con.createStatement();
    ResultSet rs0 = stmt0.executeQuery(query0);
	
	rs0.first();//���o�峹�s���̤p��
	int min_id=rs0.getInt("id");
	rs0.last();//���o�峹�s���̤j��
	int max_id=rs0.getInt("id");
		
	//�d�ߦ��g�峹���Ҧ���T
    String query1 = "select * from message_whole where id="+id;
    Statement stmt1 = con.createStatement();
    ResultSet rs1 = stmt1.executeQuery(query1);
			
	//�C�X��g�峹
	while(rs1.next()){
		//�r���_��B�z
		String msg = rs1.getString("article");
		String article = msg.replaceAll("\r\n","<br>");
%>
	<table border="1" width="50%" align="center">
		<tr align="center">
			<td>
			<%if(min_id<id){%>
				<a href="message_single.jsp?id=<%=id-1%>">�W�@�g�峹</a>
			<%}else%>�W�@�g�峹
			</td>
			<td><a href="reply.jsp?id=<%=id%>">�^���o�g�峹</a></td>
			<td>
			<%if(id<max_id){%>
				<a href="message_single.jsp?id=<%=id+1%>">�U�@�g�峹</a>
			<%}else%>�U�@�g�峹
			</td>
			</td>	
		</tr>
	</table>		
		�@�̡G<%=rs1.getString("author")%><br>
		���D�G<%=rs1.getString("title")%><br>
		�ɶ��G<%=rs1.getString("date")%> <%=rs1.getString("time")%><br>		
		<hr><br>
		<%=article%>
		<br><br>
		--<br>
  		�� �o�H��: �Q�s�|��~�{<br>
  		�� From: <%=rs1.getString("IP")%>
<%	
	}
	//�d�ߦ��g�峹������
    String query2 = "select * from message_single where article_id="+id;
	Statement stmt2 = con.createStatement();
    ResultSet rs2 = stmt2.executeQuery(query2);
%>	
	<table border=0 width="100%">
	<%while(rs2.next()){//�C�X����%>	
			<tr>
				<td width="20">
				<%if(rs2.getInt("value")==0){
					push_value--;%>
					<font color="#999999">�N</font></td>					
				<%}
				if(rs2.getInt("value")==1){
					push_value++;%>					
					��</td>
				<%}%>		
		    	<td><%=rs2.getString("push_name")%>:<%=rs2.getString("push_word")%></td>
			</tr>
	<%}%>
	</table>
<%
	
	//�N����Ʃ�J��Ʈw��
	String update_push = "update message_whole set value="+push_value+" where id="+id;
	Statement stmt = con.createStatement();
	stmt.executeUpdate(update_push);
	
	rs0.close();
	rs1.close();
	rs2.close();
	stmt0.close();
	stmt1.close();
	stmt2.close();		
    con.close();

%>

<form name="form1" method="post" action="push_deal.jsp">
  �m�W�G
  <input name="textfield1" type="text" size="13" maxlength="12"> 
  ���e�G
  <input name="textfield2" type="text" size="70"> 
  <input type="submit" name="Submit" value="�e�X">
  ��
  <input name="radiobutton" type="radio" value="1" checked> 
  �N
  <input name="radiobutton" type="radio" value="0">
  <input name="article_id" type="hidden" value=<%=id%>>
</form>
<br>
	<table border="0" width="40%" align="center">
		<tr>
			<td>�D<a href="message.jsp">�ק�o�g�峹</a></td>
			<td>�D<a href="message.jsp">�^��峹�C��</a></td>
			<td>�D<a href="message.jsp">�R���o�g�峹</a></td>
		</tr>
	</table>
</body>
</html>
