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
		<sql:query sql="SELECT * FROM user where id = '${param.textfield1}' AND password = '${param.textfield2}'" var="user"/>
		
		<c:choose>
		
			<c:when test="${user.rowCount=='0'}">
				�b���B�K�X����
			</c:when>
			
			<%--���\�n�J--%>		
			<c:otherwise>
				<c:forEach items="${user.rows}" var="user_put" >
					<%--�]�wsession--%>
					<c:set var="rank" value="${user_put.rank}" scope="session"/>
				</c:forEach>
				<c:redirect url="../frame/demoFrameset.jsp"/>
			</c:otherwise>
			
		</c:choose>	
		
	</c:otherwise>	
				
</c:choose>
</center>