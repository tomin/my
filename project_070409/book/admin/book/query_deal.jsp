<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�d�߲ŦX���--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo where ${param.select} = '${param.textfield0}'
</sql:query>

<c:choose>
	<c:when test="${bookinfo.rowCount=='0'}">
		�d�L���
	</c:when>

	<c:otherwise>
		<p>�d�ߦ��\</p>
		<p>���y�򥻸�Ƴ��i��</p>
		<hr>
		<p>�`�@�� ${bookinfo.rowCount} �����</p>
		<table border="1" cellspacing="0">
		<tr bgcolor="#CCCC99">
			<%--Title--%>
			<th>�ѦW</th><th>�@��</th><th>�X����</th><th>�X�����</th><th>ISBN</th><th>���O</th><th>�y��</th>
		</tr>
		<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr>
			<c:forEach begin="0" end="6" var="item">
	  			<td>${row[item]}</td>
	  		</c:forEach>			
			</tr>		
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>		