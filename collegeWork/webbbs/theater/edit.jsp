<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<%-- Cookie�n�Ϊ�import --%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�s��峹</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<script language="javascript">
function checkdata() {
	var name = document.form.name.value;
	var title = document.form.title.value;
   	var oldpass = document.form.old_password.value;
	
   	if(name=="" || title==""){
   		window.alert("�m�W�M���D�@�w�n��I");
	}
	else if(oldpass==""){
   		window.alert("��l�K�X�@�w�n��I");
	}
	else{
		document.form.submit();
	}			
}
</script>
<body>
<%
	String id=(String)request.getParameter("id");//���oid
	String author=null;
	String subject=null;
	String article=null;

    String sql = "select * from message_whole where id="+id;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
	author=rs.getString("author");//���o�@��
 	subject=rs.getString("title");//���o���D
	article=rs.getString("article");//���o���e
	}
	//���ocookie
	String pass="";
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
			if (URLDecoder.decode(rcookie[i].getName()).equals("�K�X"))
				pass=URLDecoder.decode(rcookie[i].getValue());		
%>	
<form name="form" method="post" action="edit_deal.jsp">
  <p align="center">�m�W�G
      <input type="text" name="name" value="<%=author%>">
      �K�X�G
      <input type="password" name="new_password" value="<%=pass%>">
  </p>
  <p align="center">���D�G
      <input type="text" name="title" value="<%=subject%>" size="50">
</p>
  <p>
    <textarea name="article" cols="120" rows="20"><%=article%></textarea>
</p>
  <p align="center">�п�J��l�K�X�G
    <input type="password" name="old_password" value="<%=pass%>">
	<input name="id" type="hidden" value="<%=id%>">
    <input type="button" name="Submit" value="�T�w�ק�" onclick="javascript:checkdata()">
  </p>
</form>
</body>
</html>
