<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>���|�ƹq�l�ѭ��R</title>
<STYLE>
<!--
@import URL(include/style.css);
-->
</STYLE>
</head>
<script language="javascript">
function setfocus(){
        document.form.textfield1.focus();
        return;
}
</script>
<body>
<body onLoad="setfocus()">
<br><br>
<br><br>
<br><br>

<center>
	���|�ƹq�l�ѭ��R<br><br>
	<form name="form" method="post" action="check/login.jsp">
	�b���G<input type="text" name="textfield1"><p></p>
	�K�X�G<input type="password" name="textfield2"><p></p>
	<input type="submit" name="Submit" value="�n�J">    
	</form>
	<br><br>
</center>
			
</body>
</html>
