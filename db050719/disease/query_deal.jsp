<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%--�d�߯S��e�f�O�����--%>
<sql:query var="register">
    <c:choose>
		
		<%--�Ǹ�--%>
		<c:when test="${param.textfield0!=''}">
		  	SELECT * FROM REGISTER NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.STU_ID = ${param.textfield0}
		</c:when>
		
		<%--�Z��--%>
		<c:otherwise>			
		  	SELECT * FROM REGISTER NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.CLASS_ID = ${param.select0} 
		</c:otherwise>
		
	</c:choose>
</sql:query>


<%--�m���}�l--%>
<div align="center">
	<%--�S��e�f�O���O�_�s�b--%>
	<c:choose>
	
		<%--���s�b--%>
		<c:when test="${register.rowCount=='0'}">
			�d�L���
		</c:when>
			
		<%--�s�b--%>
		<c:otherwise>
			<p>�d�ߦ��\</p>
			<p>�S��e�f�O�����i��</p>
			<hr>
			<p>�`�@�� ${register.rowCount} �����</p>		
			<table border="1" cellspacing="0">
				<tr bgcolor="#CCCC99">
					<th>�Ǹ�</th><th>�S��e�f�W��</th><th>�n�����</th><th>�S��e�f����</th>
				</tr>

				<c:forEach items="${register.rowsByIndex}" var="register_put">
					<tr align="center" bgcolor="#ccccee">
						<td>${register_put[4]}</td>
						<sql:query var="disease">
						  SELECT * FROM disease where Disease_ID = ${register_put[1]}
						</sql:query>
						<c:forEach items="${disease.rowsByIndex}" var="disease_put">
							<td>${disease_put[1]}</td>
						</c:forEach>
						<td>${register_put[2]}</td>						
						<td>${register_put[3]}</td>						
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
		<%--�s�b--%>
	</c:choose>
	<%--�S��e�f�O���O�_�s�b--%>						
</div>
<%--�m������--%>