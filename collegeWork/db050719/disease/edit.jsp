<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<%--�m���}�l--%>
<div align="center">
	<c:if test="${param.id==null}">
		<p>�ק�S��e�f�O��</p>
		<form name="form" method="post" action="edit.jsp">
			�Ǹ��G<input name="id" type="text"><input type="submit" name="Submit" value="�ק�"> 
		</form>
	</c:if>
	<c:if test="${param.id!=null}">
		<%--�Ǹ��O�_�ť�--%>
		<c:choose>
			<%--�Ǹ��ť�--%>
			<c:when test="${param.id==''}">
				�Ǹ�����ť�
			</c:when>
			
			<%--�Ǹ�����J--%>
			<c:otherwise>
				<%@ include file="../include/mysql.jsp" %>				
				
				<%--�d���B�v���--%>
				<sql:query sql="SELECT * FROM REGISTER WHERE HER_ID = ANY ( SELECT HER_ID FROM HER WHERE STU_ID = ${param.id} )" var="register"/>
				
				<%--�O�_���B�v��ƶ}�l--%>
				<c:choose>
				
					<%--�S���B�v���--%>
					<c:when test="${register.rowCount=='0'}">
						�S���Ǹ� ${param.id} ���B�v���
					</c:when>
					
					<%--���B�v��ƶ}�l--%>
					<c:otherwise>									
						�ק�S��e�f�O��
						<p>�Ǹ� <c:out value="${param.id}"/></p>
						<form name="form" method="post" action="edit_deal.jsp">
							<table>
								<tr>
									<th>�s��</th><th>�S��e�f�W��</th><th>�n�����</th><th>�S��e�f����</th>
								</tr>
								
								<c:forEach items="${register.rowsByIndex}" var="register_put">
									<tr align="center">
										<sql:query sql="SELECT * FROM disease WHERE Disease_ID = ${register_put[1]}" var="disease"/>										  
										<c:forEach items="${disease.rowsByIndex}" var="disease_put">
											<td>${disease_put[0]}</td>
											<td>${disease_put[1]}</td>											
										</c:forEach>
										<td><input type="text" name="day${register_put[1]}" value="${register_put[2]}" size="10"></td>
										<td><input type="text" name="text${register_put[1]}" value="${register_put[3]}" size="50"></td>
									</tr>
									<c:set value="${register_put[0]}" var="her_id"/>
								</c:forEach>
							</table>
							<input type="hidden" name="stu_id" value="${param.id}">
							<input type="hidden" name="her_id" value="${her_id}">																		  
							<p><input type="submit" name="Submit" value="�e�X"></p>
						</form>
					</c:otherwise>
					<%--���B�v��Ƶ���--%>
				</c:choose>
				<%--�O�_���B�v��Ƶ���--%>							
			</c:otherwise>				
		</c:choose>
	</c:if>
	</div>
<%--�m������--%>