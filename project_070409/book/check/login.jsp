<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
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
		<sql:query sql="SELECT * FROM member where id = '${param.textfield1}' AND password = '${param.textfield2}'" var="member"/>
		
		<c:choose>
		
			<c:when test="${member.rowCount=='0'}">
				�b���B�K�X����
			</c:when>
			
			<%--���\�n�J--%>		
			<c:otherwise>
				<c:forEach items="${member.rows}" var="member_put" >
s					<c:set var="id" value="${member_put.id}" scope="session"/>
				</c:forEach>
				<c:redirect url="../member/welcome.jsp"/>
			</c:otherwise>
			
		</c:choose>	
		
	</c:otherwise>	
				
</c:choose>
</center>