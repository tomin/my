<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�ק�</title>
</head>
<%
	request.setCharacterEncoding("big5");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sa?user=root&password=root&password=root&useUnicode=true&characterEncoding=utf-8");
    String sql = "select * from customer";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);	
%>
<body>
<center>
  <br>
  <form name="form1" method="post" action="update_put.jsp">
    <p>
      <select name="select">
          <option selected>�п�ܭק��H</option>
          <%while(rs.next()){%>
          <option value="<%=rs.getString(1)%>">===<%=rs.getString(1)%>===</option>
          <%}%>
      </select>
    </p>
    <hr>
    <br>
    <table width="35%" border="0">
      <tr>
        <td width="33%"><input name="checkbox0" type="checkbox" value="checkbox">
          �m�W</td>
        <td width="67%"><input type="text" name="textfield0"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox1" value="checkbox">
          �ͤ�</td>
        <td><input name="textfield1" type="text"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox2" value="checkbox">
          ��}</td>
        <td><input type="text" name="textfield2"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox3" value="checkbox">
          �q��</td>
        <td><input type="text" name="textfield3"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox4" value="checkbox">
          �H�c</td>
        <td><input type="text" name="textfield4"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox5" value="checkbox">
          �q�l���H�c</td>
        <td><input type="text" name="textfield5"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox6" value="checkbox">
          �O�_��VIP</td>
        <td><select name="VIP">
          <option value="0" selected>�_</option>
          <option value="1">�O</option>
        </select></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox7" value="checkbox">
          �b��</td>
        <td><input name="textfield6" type="text" id="textfield6"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox8" value="checkbox">
          �K�X</td>
        <td><input name="textfield7" type="text" id="textfield7"></td>
      </tr>
      <tr>
        <td><input type="checkbox" name="checkbox9" value="checkbox">
          ����</td>
        <td><select name="type">
          <option value="�|���w�q" selected>�|���w�q</option>
          <option value="�֦~���e">�֦~���e</option>
          <option value="�֤k���e<">�֤k���e</option>
          <option value="�Z�L�p��">�Z�L�p��</option>
          <option value="�����p��">�����p��</option>
                        </select></td>
      </tr>
    </table>
    <p>���ܡG�Цۦ�Ŀ�n�ק諸�ﶵ�C</p>
    <p>
      <input type="submit" name="Submit" value="�T�w�ק�">
    </p>
  </form>
</center>
</body>
</html>
