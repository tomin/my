<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>


<div align="center">
	��Ƥw�x�s
	<form name="form" method="get" action="../chat">
	  <input name="name" type="hidden" size="12" value="�t�μs��">
	  <input name="textfield" type="hidden" value="�u${sessionScope.name}�v��W���u${param.textfield}�v">
	  <input type="submit" name="Submit" value="�����~��">
	</form>
</div>
<c:set var="name" value="${param.textfield}" scope="session"/>