<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<c:set var="name" value="${param.textfield}" scope="session"/>
<div align="center">
	��Ƥw�x�s
	<form name="form" method="get" action="../chat">
	  <input name="name" type="hidden" size="12" value="�t�μs��">
	  <input name="textfield" type="hidden" value="�u${sessionScope.name}�v�i�J�|ĳ">
	  <input type="submit" name="Submit" value="�����~��">
	</form>
</div>