<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<%-- session �� include --%>
<%@ include file="session.jsp" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>��ذ�</title>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
</head>

<%
    String sql = "select * from message_whole where type='good' order by id asc ";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	
	%>
	<table width="95%" border="0" align="center" cellspacing="0">
		<tr bgcolor="#3366cc">
			<td align="center" colspan="6"><a href="message.jsp" style="color:white">��^�峹�C��</font></a></td>
  		</tr>		
		<tr><th width="4%">�s��</th><th width="4%">���</th><th width="4%">����</th><th width="10%">���</th></th><th width="15%">�@��</th><th width="*">��@���@�С@�D</th></tr>
	<%while(rs.next()){
	
	%>
			<tr>
				<td align="right"><%=rs.getInt("id")%></td>
				
				<%if(rs.getString("type").equals("good")){//�B�z�����ܶ}�l%>
					<td align="center">m</td>
				<%}else{%>
					<td></td>
				<%}//�B�z�����ܵ���%>	
					
				<%if(rs.getInt("value")==0){//�B�z������ܶ}�l%>
					<td></td>
				<%}else if(rs.getInt("value")>0){//�p�G����Ȥj��0%>
					<td align="center">
					<%if(rs.getInt("value")>9){//�p�G����Ȥj��9%>
						<font color="red">�z</font>
					<%}else{%>
						<font color="yellow"><%=rs.getInt("value")%></font>
					<%}%>
					</td>
				<%}else{//�p�G����Ȥp��0%>
					<td align="center">
					<%if(rs.getInt("value")<-9){//�p�G����Ȥp��-9%>
						<font color="#666666">�N</font>
					<%}else{%>
						<font color="#00FF00"><%=-rs.getInt("value")%></font>
					<%}%>
					</td>
				<%}//�B�z������ܵ���%>
				
		    	<td align="center"><%=rs.getDate("date")%></td>
				<td><%=rs.getString("author")%></td>
				<td><a href="message_single.jsp?id=<%=rs.getInt("id")%>">
				<%if(rs.getInt("isReply")==0){%>��
				<%}else{%>��
				<%}%>				
				<%=rs.getString("title")%></a></td>
			</tr>
<%}
	rs.close();
    con.close();
	%></table>
</body>
</html>
