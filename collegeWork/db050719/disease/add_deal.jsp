<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT HER_ID FROM HER WHERE STU_ID = ${param.stu_id}" var="HER"/>
<c:forEach items="${HER.rows}" var="HER_put">
	<c:set value="${HER_put.HER_ID}" var="HER_ID"/>
</c:forEach>

<%--�m���}�l--%>
<div align="center">
	<%--�O�_�����˸�ƶ}�l--%>
	<c:choose>
		<%--�S�����˸��--%>
		<c:when test="${HER.rowCount=='0'}">
			<br><br>�S���Ǹ� ${param.stu_id} �����˸��
		</c:when>
		
		<%--�����˸�ƶ}�l--%>
		<c:otherwise>
			<%--Ū��add.jsp�ǹL�Ӫ��ˬd���G--%>
			<c:forEach begin="1" end="12" var="item" varStatus="s">
				<% 
					int i = ((Integer) pageContext.getAttribute("item")).intValue();
					pageContext.setAttribute("text", "text"+i);		
				%>
				<%--�p�G���ˬd--%>
				<c:if test="${param[text]!=''}">
					<sql:update>
					
						INSERT INTO Register
						VALUES ( ? , ? , ? , ? )
						
						<sql:param value="${HER_ID}"/>			
						<sql:param value="${item}"/>
						<sql:param value="${param.select1}+${param.select2}+${param.select3}"/>
						<sql:param value="${param[text]}"/>
						
					</sql:update>					
				</c:if>
			</c:forEach>  
			
			
			<sql:query var="register">
			  SELECT * FROM register where HER_ID = ${HER_ID}
			</sql:query>		
	
			<p>�s�W���\</p>
			�S��e�f�O�����i��
			<hr>
			<p>�H�U�O�Ǹ� ${param.stu_id} �Ҧ����S��e�f�O��</p>
			<table border="1">
				<tr>
					<th>�s��</th><th>�S��e�f�W��</th><th>�n�����</th><th>�S��e�f����</th>
				</tr>
				<c:forEach items="${register.rowsByIndex}" var="register_put">
					<tr align="center">
						<td>${register_put[0]}</td>
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
		<%--�����˸�Ƶ���--%>
	</c:choose>
	<%--�O�_�����˸�Ƶ���--%>						
</div>
<%--�m������--%>