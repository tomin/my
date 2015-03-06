<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query var="student">
	<c:choose>
		<%--�ƧǤ��O�ŭ�--%>
		<c:when test="${param.sort!=null}">
			SELECT * FROM student where class_id = ${param.class_id} order by ${param.sort} asc
		</c:when>
		
		<%--�Ǹ����O�ŭ�--%>
		<c:when test="${param.textfield0!=''}">
			SELECT * FROM student where Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--�d�߯Z��--%>
		<c:otherwise>						
			SELECT * FROM student where class_id = ${param.class_id}						
		</c:otherwise>				
	</c:choose>
</sql:query>

<c:choose>
	<c:when test="${student.rowCount=='0'}">
		�d�L���
	</c:when>

	<c:otherwise>
		<p>�d�ߦ��\</p>
		<p>�ǥͰ򥻸�Ƴ��i��</p>
		<hr>
		<p>�`�@�� ${student.rowCount} �����</p>
		<table width="1600" border="1" cellspacing="0">
		<tr bgcolor="#CCCC99">
			<%--�Z��--%>
			<c:if test="${student.rowCount>'1'}">
				<th><a href="query_deal.jsp?class_id=${param.class_id}&sort=1">�Ǹ�</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=2">�t��</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=3">�m�W</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=4">�ʧO</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=5">�X�ͤ��</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=6">�����Ҧr��</a></a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=7">�a�}</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=8">�q��</a></th>
				<th><a href="query_deal.jsp?class_id=${param.class_id}&sort=9">���</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=10">e-mail</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=11">�O�_����ǥ�</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=12">�N�Ǫ��A</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=13">����p���H�m�W</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=14">�P�p���H���Y</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=15">�p���H�q��</a></th><th><a href="query_deal.jsp?class_id=${param.class_id}&sort=16">�p���H���</a></th>						
			</c:if>
			<%--�ӤH--%>
			<c:if test="${student.rowCount=='1'}">
				<th>�Ǹ�</th><th>�t��</th><th>�m�W</th><th>�ʧO</th><th>�X�ͤ��</th><th>�����Ҧr��</th><th>�a�}</th><th>�q��</th>
				<th>���</th><th>e-mail</th><th>�O�_����ǥ�</th><th>�N�Ǫ��A</th><th>����p���H�m�W</th><th>�P�p���H���Y</th><th>�p���H�q��</th><th>�p���H���</th>						
			</c:if>			
		</tr>
		<c:forEach items="${student.rowsByIndex}" var="row">		
			<c:if test="${row[3]=='�k'}">
				<tr align="center" bgcolor="#eecccc">
			</c:if>
			<c:if test="${row[3]=='�k'}">		
				<tr align="center" bgcolor="#ccccee">
			</c:if>	
			<c:forEach begin="0" end="9" var="item">
	  			<td>${row[item]}</td>
	  		</c:forEach>
			<td>
			<c:if test="${row[10]=='false'}">
				�_
			</c:if>
			<c:if test="${row[10]=='true'}">		
				�O
			</c:if>
			</td>
			<c:forEach begin="11" end="15" var="item">
	  			<td>${row[item]}</td>
	  		</c:forEach> 			 			
			</tr>		
		</c:forEach>
	</table>
	</c:otherwise>
</c:choose>		