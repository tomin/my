<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<center>
<br><br>
<br><br>
<c:choose>

	<c:when test="${param.textfield1==''}">
		�b������ť�
	</c:when>

	<c:when test="${param.textfield2==''}">
		�K�X����ť�
	</c:when>	
	
	<c:otherwise>
		<sql:query sql="SELECT * FROM user where id = '${param.textfield1}' AND password = '${param.textfield2}'" var="user"/>
		
		<c:choose>
		
			<c:when test="${user.rowCount=='0'}">
				�b���B�K�X����
			</c:when>
			
			<%--���\�n�J--%>		
			<c:otherwise>
				<c:forEach items="${user.rows}" var="user_put" >
					<%--�]�wsession--%>
					<c:set var="id" value="${user_put.id}" scope="session"/>
				</c:forEach>
				<c:redirect url="../index.jsp"/>
			</c:otherwise>
			
		</c:choose>	
		
	</c:otherwise>	
				
</c:choose>
</center>