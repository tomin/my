<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:update>
  INSERT INTO bookinfo
  VALUES ( ? , ? , ? , ? , ? , ?  , ? )  
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.textfield2}" />
  <sql:param value="${param.textfield3}" />
  <sql:param value="${param.textfield4}" /> 
  <sql:param value="${param.textfield5}" />    
  <sql:param value="${param.select}" /> 
</sql:update>

<sql:query var="result">
  SELECT * FROM bookinfo where ISBN = '${param.textfield4}'
</sql:query>

�s�W���\<br><br>
���y�򥻸�Ƴ��i��<hr>
<c:forEach items="${result.rowsByIndex}" var="row">
	�ѦW�G${row[0]}<br>
	�@�̡G${row[1]}<br>
	�X�����G${row[2]}<br>
	�X������G${row[3]}<br>	
	ISBN�G${row[4]}<br>
	���O�G${row[5]}<br>	
	�y���G${row[6]}<br>
</c:forEach>
