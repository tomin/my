<%@ page contentType="text/html; charset=big5" errorPage="true" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<br><br><br><br>
	<c:if test="${sessionScope.id!=null}">
		<p>�v������</p>
	</c:if>
	<c:if test="${sessionScope.rank==null}">	
		<p>�z�|���n�J�ζ��m�L�[</p>
	</c:if>	
	<p><a href="../index.jsp" target="_top">�Ы����n�J</a></p>
</div>