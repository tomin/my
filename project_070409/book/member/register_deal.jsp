<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:update>
  INSERT INTO member
  VALUES ( ? , ? , ? )  
  <sql:param value="${param.textfield0}" />
  <sql:param value="${param.textfield1}" />
  <sql:param value="${param.textfield3}" />

</sql:update>


<div align="center">
	<br><br>
	���H�A<br><br>
	�b�� ${param.textfield0} �w�g�إ�<br><br>
	�A�ߧY�i�H�n�J
</div>