<%-- session �� include --%>
<%@ include file="session.jsp" %>
<%-- Cookie�n�Ϊ�import --%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�s�W�峹</title>
</head>
<STYLE>
<!--
@import URL(style.css);
-->
</STYLE>
<script language="javascript">
function checkdata() {
   	var a = document.form.textfield1.value;
   	var b = document.form.textfield2.value;
   	if(a=="" || b==""){
   		alert("�m�W�M���D�@�w�n��I");
		return false;
	}
	else if(a.length>12)
   		alert("�m�W�Ӫ��o�I");
	else if(b.length>90)
   		alert("���D�Ӫ��o�I");				
	else{
		return true;
	}			
}
</script>
<%
	String id="";
	String pass="";
	//���ocookie
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
		{
			if (URLDecoder.decode(rcookie[i].getName()).equals("�b��"))
				id=URLDecoder.decode(rcookie[i].getValue());
			if (URLDecoder.decode(rcookie[i].getName()).equals("�K�X"))
				pass=URLDecoder.decode(rcookie[i].getValue());			
		}
%>	
<body>
<form name="form" method="post" action="add_deal.jsp">
  <p align="center">�m�W�G
    <input type="text" name="textfield1" value="<%=id%>">
�K�X�G
    <input type="password" name="textfield3" value="<%=pass%>">
</p>
  <p align="center">���D�G
    <input name="textfield2" type="text" size="50">
</p>
  <p>
    <textarea name="textarea" cols="120" rows="20"></textarea>
</p>
  <p align="center">
    <input type="submit" name="Submit" value="�e�X" onclick="return checkdata()">
</p>
</form>
</body>
</html>
