<%--Cookie�n�Ϊ�import--%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�Xù������</title>
</head>
<STYLE>
<!--
@import URL(style.css);
body{
	background-image:url(images/index.jpg);
}
-->
</STYLE>
<script language="javascript">
function setfocus(){
        document.form.textfield1.focus();
        return;
}
</script>
<body>
<body onLoad="setfocus()">
<%	
	String id="";
	String password="";
	//���ocookie

	Cookie rcookie[] = request.getCookies();
	if (rcookie != null){//Ū�o��cookie
		for (int i = 0; i < rcookie.length; i++)
		{
			if (URLDecoder.decode(rcookie[i].getName()).equals("id"))
				id=URLDecoder.decode(rcookie[i].getValue());
			if (URLDecoder.decode(rcookie[i].getName()).equals("password"))
				password=URLDecoder.decode(rcookie[i].getValue());			
		}
	}
%>
<br>
<br><br>
<br><br>
<br><br>

<center>
	�Xù������<p></p>
	<form name="form" method="post" action="login.jsp">
	�b���G<input type="text" name="textfield1" value=<%=id%>><p></p>
	�K�X�G<input type="password" name="textfield2" value=<%=password%>><p></p>
	<input name="checkbox" type="checkbox" value="true" checked>�O�бb���K�X<p></p>
	<input type="submit" name="Submit" value="�n�J">    
	</form>
	<br><br>
</center>
			
</body>
</html>
