<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�޲z����</title>
<STYLE>
<!--
@import URL(style.css);
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
<div align="center">
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	�޲z����
	<br><br>
	<form name="form" method="post" action="admin_login_deal.jsp">
		�b���G<input type="text" name="textfield1"><p></p>
		�K�X�G<input type="password" name="textfield2">
		<p></p>
		<input type="submit" name="Submit" value="�e�X">
	</form>

	<p>&nbsp;</p>
	<p><a href="message.jsp">�^��峹�C��</a></p>
</div>
</body>
</html>
