<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�ק�S��e�f�O��--%>
<c:forEach begin="1" end="12" var="item" varStatus="s">
	<% 
		int i = ((Integer) pageContext.getAttribute("item")).intValue();
		pageContext.setAttribute("dayStr", "day"+i); 		
		pageContext.setAttribute("textStr", "text"+i);
	%>
	<%--�p�G���O��--%>
	<c:if test="${param[dayStr]!=''}">
		<c:if test="${param[textStr]!=''}">
			<sql:update>
				UPDATE REGISTER SET Reg_Date = ?, Description = ?
					WHERE HER_ID = ${param.her_id} AND Disease_ID = ${item}

				<sql:param value="${param[dayStr]}"/>
				<sql:param value="${param[textStr]}"/>				
        
			</sql:update>					
		</c:if>
	</c:if>
</c:forEach>  


<sql:query sql="SELECT * FROM REGISTER WHERE HER_ID = ${param.her_id}" var="register" />

<div align="center">
	�ק令�\<br><br>
	�S��e�f�O�����i��
	<hr>
	<p>�Ǹ� ${param.stu_id}</p>
	<table border="1" width="70%">
		<tr>
			<th>�s��</th><th>�S��e�f�W��</th><th>�n�����</th><th>�S��e�f����</th>
		</tr>
		<c:forEach items="${register.rowsByIndex}" var="register_put">
			<tr align="center">
				<sql:query var="disease">
				  SELECT * FROM disease where Disease_ID = ${register_put[1]}
				</sql:query>
				<c:forEach items="${disease.rowsByIndex}" var="disease_put">
					<td>${disease_put[0]}</td>
					<td>${disease_put[1]}</td>
				</c:forEach>
				<td>${register_put[2]}</td>
				<td>${register_put[3]}</td>
			</tr>
		</c:forEach>
	</table>
</div>