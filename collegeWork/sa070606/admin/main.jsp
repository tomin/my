<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�޲z����</title>
<style type="text/css">
<!--
.style1 {
	font-size: xx-large;
	font-weight: bold;
	font-family: "�з���";
}
-->
</style>
</head>

<body>
<p>
  <%
    String admin=(String)session.getAttribute("admin");
    if(!admin.equals("ok")){
		response.sendRedirect("index.htm");
    }	 
%>
</p>
<p align="center" class="style1">�Q�s�|�޲z���� </p>
<table width="100%" border="1">
  <tr>
    <td>�U�Ⱥ޲z</td>
    <td>�q�l��</td>
    <td>�s�f�޲z</td>
  </tr>
  <tr>
    <td><a href="add.htm">�s�W</a></td>
    <td><a href="mail/single.htm">�ӧO�H�H</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="update.jsp">�ק�</a></td>
    <td><a href="mail/group.htm">�s�ձH�H</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="query.jsp">�d��</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="delete.htm">�R��</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<p><a href="logout.jsp">�n�X</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
