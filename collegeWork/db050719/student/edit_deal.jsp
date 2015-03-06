<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:update>
  UPDATE student
  SET Stu_ID = ? , Class_ID = ? , Name = ? , Sex = ? , Bdate = ? , IDCard = ? ,  Address = ? , Phone = ? , Cellphone = ? , Email = ? , Trans = ? , Studying = ? , ECP_Name = ? , ECP_Relation = ? , ECP_Phone = ? , ECP_Cellphone = ?
  WHERE stu_id = ${param.textfield0}
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.select0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.sex}" />
  
  <sql:param value="${param.date}" />
  <sql:param value="${param.textfield2}" />
  <sql:param value="${param.textfield3}" />
  <sql:param value="${param.textfield4}" />  

  <sql:param value="${param.textfield5}" />
  <sql:param value="${param.textfield6}" />  
  <sql:param value="${param.trans}" />  
  <sql:param value="${param.studying}" />

  <sql:param value="${param.textfield9}" />  
  <sql:param value="${param.textfield10}" />
  <sql:param value="${param.textfield11}" />
  <sql:param value="${param.textfield12}" />  
</sql:update>

<sql:query var="result">
  SELECT * FROM student where Stu_ID = ${param.textfield0}
</sql:query>

�ק令�\<br><br>
�ǥͰ򥻸�Ƴ��i��<hr>
<c:forEach items="${result.rowsByIndex}" var="row">
	�Ǹ��G${row[0]}<br>
	�t�šG${row[1]}<br>
	�m�W�G${row[2]}<br>
	�ʧO�G${row[3]}<br>
	
	�X�ͤ���G${row[4]}<br>
	�����Ҧr���G${row[5]}<br>
	�a�}�G${row[6]}<br>
	�q�ܡG${row[7]}<br>
	
	����G${row[8]}<br>
	e-mail�G${row[9]}<br>
	�O�_����ǥ͡G<c:if test="${row[10]=='false'}">�_</c:if><c:if test="${row[10]=='true'}">�O</c:if><br>
	�N�Ǫ��A�G${row[11]}<br>
	
	����p���H�m�W�G${row[12]}<br>
	�P�p���H���Y�G${row[13]}<br>
	�p���H�q�ܡG${row[14]}<br>
	�p���H����G${row[15]}<hr>
</c:forEach>