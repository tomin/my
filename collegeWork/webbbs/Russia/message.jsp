<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<%-- session �� include --%>
<%@ include file="session.jsp" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�Xù������</title>
<STYLE>
<!--
@import URL(style.css);
body {
	background-image:url(images/message.jpg);
}
-->
</STYLE>
</head>

<%
    String sql = "select * from message_whole order by top desc,id asc";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>
	<table width="95%" border="0" align="center" cellspacing="0">
	  <tr bgcolor="#3366cc" style="color:white">
			<td width="23%" colspan="4">�i<a href="javascript:window.external.AddFavorite('http://tomin.twbbs.org/russia', '�Xù������')" style="color:white">�ڪ��̷R</a>�j�@</td>
			<td width="*" align="center" colspan="2"><a href="good.jsp"><font color="Yellow">�Xù������</font></a></td>
  	  		<td width="23%" align="right">�i<a href="admin.jsp" style="color:white">���D</a>�G�g�ʡj</td>
	  </tr>
      <tr>
        <th width="4%">�s��</th>
        <th width="4%">���</th>
        <th width="4%">����</th>
        <th width="10%">���</th>
        <th width="14%">�@��</th>
        <th width="*">��@���@�С@�D</th>
		<td width="8%" align="right" style="color:#444444">�i<a href="logout.jsp" style="color:#444444">�n�X</a>�j</td>
      </tr>
<%
	int max_id=0;
	while(rs.next()){//Ū���峹�C��}�l	
		max_id++;
		if(max_id-rs.getInt("id")<=17 || rs.getInt("top")==1){//�̤j��ܼƶq�}�l(17��+�m��)
%>
      <tr onMouseOver=this.bgColor='#999999'; onMouseOut=this.bgColor='#000000';>
        <%if(rs.getInt("top")==1){//�B�z�m����ܶ}�l%>
        <td align="center">�m��</td>
        <%}else{%>
        <td align="right"><%=rs.getInt("id")%></td>
        <%}//�B�z�m����ܵ���%>
		
		<%--�B�z�����ܶ}�l--%>
		<%if(rs.getInt("stop")==1){//�p�G�T�����%>
			<td align="center">!</td>		
        <%}else{
			if(rs.getString("type").equals("good")){//�p�G�O��ؤ峹%>
        		<td align="center">m</td>
			<%}else{%>
        		<td></td>
			<%}%>
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
        <td colspan="2"><a href="message_single.jsp?id=<%=rs.getInt("id")%>">
          <%if(rs.getInt("isReply")==0){%>
          ��
          <%}else{%>
          Re
          <%}%>
          <%=rs.getString("title")%></a></td>
      </tr>
      <%
		}////�̤j��ܼƶq����
	}//Ū���峹�C����
	rs.close();
    con.close();
	%>
</table>
	<center>
	  <p><a href="add.jsp">�o��s�峹</a></p>
    </center>
</body>
</html>
