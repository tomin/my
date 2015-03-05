<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�d�߲ŦX���--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo where name like '%${param.textfield}%' 
							OR author like '%${param.textfield}%'
							OR publisher like '%${param.textfield}%'
							OR date like '%${param.textfield}%'
							OR ISBN like '%${param.textfield}%'
							OR type like '%${param.textfield}%'
							OR language like '%${param.textfield}%'
</sql:query>


<sql:query var="tag">
	SELECT * FROM tag natural join bookinfo where tname like '%${param.textfield}%' ORDER BY tcount desc
</sql:query>



<c:choose>
	<c:when test="${bookinfo.rowCount=='0'}">
		<c:if test="${tag.rowCount=='0'}">
		�d�L���
		</c:if>

		<c:if test="${tag.rowCount>'0'}">
		<p>�d�ߦ��\</p>
		<p>���y�򥻸�Ƴ��i��</p>
		<hr>
		<p>�`�@�� ${tag.rowCount} �����</p>
		<table border="1" cellspacing="0" width="70%">
		<th>�ʭ�</th><th>�򥻸��</th><th>���ҦW��</th><th>������</th>
		<c:forEach items="${tag.rowsByIndex}" var="row">
			<tr>
				<td><a href="detail.jsp?isbn=${row[0]}"><img src="images/${row[0]}.jpg" border="0"></a></td>
				<td>
					�ѦW�G${row[3]}<br>
					�@�̡G${row[4]}<br>
					�X�����G${row[5]}<br>
					�X������G${row[6]}<br>						
				</td>
				<td align="center">
					${row[1]}
				</td>
				<td align="center">
					${row[2]}
				</td>

			</tr>	
		</c:forEach>
		</table>
		</c:if>

	</c:when>

	<c:otherwise>
		<p>�d�ߦ��\</p>
		<p>���y�򥻸�Ƴ��i��</p>
		<hr>
		<p>�`�@�� ${bookinfo.rowCount} �����</p>
		<table border="1" cellspacing="0">
		<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr>
				<td><a href="detail.jsp?isbn=${row[4]}"><img src="images/${row[4]}.jpg" border="0"></a></td>
				<td>
					�ѦW�G${row[0]}<br>
					�@�̡G${row[1]}<br>
					�X�����G${row[2]}<br>
					�X������G${row[3]}<br>	
					ISBN�G${row[4]}<br>
					���O�G${row[5]}<br>	
					�y���G${row[6]}							
				</td>

			</tr>	
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>