<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�޲z����</title>
<%
    String admin=(String)session.getAttribute("admin");

    if(admin==null || !admin.equals("ok"))
		response.sendRedirect("admin_login.jsp");
%>
<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
</head>

<%
    String sql = "select * from message_whole order by top desc,id asc";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
	<table width="95%" border="0" align="center" bgcolor="#3366CC">
  		<tr>
			<td><a href="admin_logout.jsp">�n�X</a></td>
  		</tr>
	</table>
	<form name="form" method="post" action="admin_deal.jsp">
	<table width="95%" border="1" align="center">	
		<tr><th width="4%">�ﶵ</th><th width="4%">�s��</th><th width="4%">���</th><th width="4%">����</th><th width="10%">���</th></th><th width="15%">�@��</th><th width="*">��@���@�С@�D</th></tr>
	<%while(rs.next()){
	
	%>
			<tr>
				<td align="center"><input name="id" type="radio" value="<%=rs.getInt("id")%>">
				<%if(rs.getInt("top")==1){//�B�z�m����ܶ}�l%>
			  <td align="center">�m��</td>
				<%}else{%>
					<td align="right"><%=rs.getInt("id")%></td>
				<%}//�B�z�m����ܵ���%>		
				
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

	  
	    <p align="center">
	      <input name="radiobutton" type="radio" value="good" checked> 
	      ���
	      <input name="radiobutton" type="radio" value="top"> 
	      �m��
	      <input name="radiobutton" type="radio" value="allow_push">
		  ���\����	      
		  <input name="radiobutton" type="radio" value="cancel_good"> 
	      �������	      
		  <input name="radiobutton" type="radio" value="cancel_top"> 
	      �����m��
	      <input name="radiobutton" type="radio" value="stop_push">
		  �T�����
		  <input name="radiobutton" type="radio" value="cancel">
	      �R��
		  <br><br>
          <input type="submit" name="Submit" value="�e�X">
      </p>
</form>

</body>
</html>
