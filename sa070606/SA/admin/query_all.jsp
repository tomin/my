<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�޲z����</title>
</head>
<form name="form1" method="post" action="">
  <div align="center">�ƧǡG
    <select name="select">
      <option value="0" selected>�w�]</option>
            </select>
    <input name="radiobutton" type="radio" value="radiobutton" checked>
    �L    
 <input name="radiobutton" type="radio" value="radiobutton">
    �ɾ�
    <input name="radiobutton" type="radio" value="radiobutton"> 
    ����
</div>
</form>
<body>
  <%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root");
    String sql = "select * from customer";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
	
	out.print("<table border=1 width=\"100%\">");
	out.print("<th>�m�W</th><th>�ͤ�</th><th>��}</th><th>�q��</th><th>�H�c</th><th>�q�l���H�c</th><th>�O�_��VIP</th><th>�b��</th><th>����</th>");
	  while(rs.next()){
	    out.print("<tr>");
	    for(int i=1;i<=8; i++)
	      out.print("<td>" + rs.getString(i)+ "</td>");
		out.print("<td>" + rs.getString("type")+ "</td>");
	    out.print("</tr>");
	  }
	out.print("</table>");
	out.print("<center><br><a href=\"main.jsp\">�^�޲z����</center>");	
	rs.close();
    con.close();
%>
</body>
</html>
