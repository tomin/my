<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�|���M��</title>
</head>

<body>
<%
    String login=(String)session.getAttribute("login");
    String type=(String)session.getAttribute("type");

    if(login!=null && login.equals("ok")){
	    if(type.equals("�֦~���e"))response.sendRedirect("type/boy.jsp");
		else if(type.equals("�֤k���e"))response.sendRedirect("type/girl.jsp");
		else if(type.equals("�Z�L�p��"))response.sendRedirect("type/power.jsp");
		else if(type.equals("�����p��"))response.sendRedirect("type/art.jsp");
		else response.sendRedirect("type/default.jsp");
	}
    else{
	    out.print("<center><b>�n�J���~</b><br><br>");
		out.print("�z�|���n�J�|��<br><br>");
	    out.print("�����N�۰ʪ�^����</center>");		
		response.setHeader("Refresh","5;URL=index.jsp");
    }	 
%>

</body>
</html>
