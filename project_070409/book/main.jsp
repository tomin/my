<%@ page contentType="text/html; charset=ms950" %>
<%@ include file="include/mysql.jsp" %>
<%@ include file="include/head.jsp" %>

<%--�d�߽s�����������O�W��--%>
<sql:query sql="SELECT * FROM typeno WHERE no = ${param.no}" var="typeno"/>
<c:forEach items="${typeno.rows}" var="typeno_put">
	<c:set value="${typeno_put.type}" var="type" scope="session" />
</c:forEach>
<%@ include file="check/session/count.jsp" %>

<%--�d�߲ŦX���--%>
<sql:query var="bookinfo"> SELECT * FROM bookinfo where type = '${type}' </sql:query> 
<c:choose> <c:when test="${bookinfo.rowCount=='0'}"> �d�L��� </c:when> <c:otherwise> 
<p><u>${type}</u> �`�@�� ${bookinfo.rowCount} �����</p>
		<hr>
		<table border="0" cellspacing="0">
		<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr>
				<td><a href="detail.jsp?isbn=${row[4]}"><img src="images/${row[4]}.jpg" border="0"></a></td>
				<td>
					�ѦW�G${row[0]}<br>
					�@�̡G${row[1]}<br>
					�X�����G${row[2]}
				</td>			
			</tr>		
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>		