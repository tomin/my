<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>


<div align="center">
	�A�w�g�n�X
	<form name="form" method="get" action="../chat">
	  <input name="name" type="hidden" size="12" value="�t�μs��">
	  <input name="textfield" type="hidden" value="�u${sessionScope.name}�v���}�|ĳ">
	  <input type="submit" name="Submit" value="�����~��">
	</form>
</div>
<c:remove var="name" scope="session"/>