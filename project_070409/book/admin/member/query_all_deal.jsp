<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<sql:query var="HER">
    <c:choose>
		<c:when test="${param.textfield0!=''}">
			SELECT * FROM HER where Stu_ID = ${param.textfield0}
		</c:when>
		
		<c:otherwise>			
		  	SELECT * FROM HER where Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )
					ORDER BY Stu_ID ASC
		</c:otherwise>				
	</c:choose>
</sql:query>

<c:choose>

	<c:when test="${HER.rowCount=='0'}">
		�d�L���
	</c:when>
		
	<c:otherwise>		
		<p>�d�ߦ��\</p>
		<p>���˸�Ƴ��i��</p>
		<p>�`�@�� ${HER.rowCount} �W�ǥͪ����˸��</p>		
		<table>
		<c:forEach items="${HER.rowsByIndex}" var="HER_put">
			<tr>
				<td colspan="8">
					<hr>
					���˰O���s���G${HER_put[0]}<br>
					�Ǹ��G${HER_put[1]}<br>	
					�ˬd����G${HER_put[2]}	
				</td>			
			</tr>			
			
			<tr>
				<th>�s��</th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th>�ˬd���G</th><th>�O�_���`</th>
			</tr>
				<sql:query sql="SELECT * FROM exam natural join item where HER_ID = ${HER_put[0]}" var="exam" />
				<c:forEach items="${exam.rowsByIndex}" var="exam_put">
					<tr align="center">
						<td>${exam_put[1]}</td>
						<td>${exam_put[8]}</td>
						<c:forEach begin="4" end="7" var="item">
							<td>${exam_put[item]}</td>
						</c:forEach>
						<td>${exam_put[2]}</td>
						<td>
							<c:choose>
								<c:when test="${exam_put[3]=='1'}">���`</c:when>
								<c:otherwise><font color="red">���`</font></c:otherwise>
							</c:choose>
						</td>						
					</tr>
				</c:forEach>  
		</c:forEach>
		</table>
	</c:otherwise>
					
</c:choose>		