<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" 
import="java.text.*,java.util.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�d���Q��</title>
</head>

<body>
<%
	request.setCharacterEncoding("big5");	
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "select * from message_whole order by id asc";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	
	%>
	<table width="70%" border="1" align="center">
  	<tr bgcolor="#ffff99"><th colspan="6" ><font size="5" face="�з���">�Q�s�|</font></th></tr>
	<tr><th width="5%">�s��</th><th width="5%">����</th><th width="15%">���</th></th><th width="15%">�@��</th><th width="*">��@���@�С@�D</th></tr>
	<%while(rs.next()){
	
	%>
			<tr>
				<td align="right"><%=rs.getInt("id")%></td>
				<%if(rs.getInt("value")==0){%>
					<td></td>
				<%}else{%>
				<td align="right"><%=rs.getInt("value")%></td>
				<%}%>
		    	<td align="center"><%=rs.getDate("date")%></td>
				<td><%=rs.getString("author")%></td>
				<td><a href="message_single.jsp?id=<%=rs.getInt("id")%>">
				<%if(rs.getInt("isReply")==0){%>��
				<%}else{%>��
				<%}%>				
				<%=rs.getString("title")%></a></td>
			</tr>
<%}
	%></table>
	<p><center><a href="add.jsp">�o��s�峹</a></center></p>	
	<%
	rs.close();
    con.close();
%>
</body>
</html>
