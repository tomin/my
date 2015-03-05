<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�d���B�v���--%>
<sql:query var="TR">
    <c:choose>
	
		<%--�Ƨ�--%>
		<c:when test="${param.sort!=null}">
		  	SELECT * FROM TR NATURAL JOIN TREAT NATURAL JOIN ITEM where Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )
					ORDER BY ${param.sort} ASC
		</c:when>	
		
		<%--�Ǹ�--%>
		<c:when test="${param.textfield0!=''}">
			SELECT * FROM TR NATURAL JOIN TREAT NATURAL JOIN ITEM where Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--�Z��--%>
		<c:otherwise>			
		  	SELECT * FROM TR NATURAL JOIN TREAT NATURAL JOIN ITEM where Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )
					
			<%--���ئ����--%>
			<c:if test="${param.select1!=''}">
				AND TREAT.ITEM_ID = ${param.select1}
			</c:if>
			
		</c:otherwise>
	</c:choose>
</sql:query>

<%--�m���}�l--%>
<div align="center">
	<%--�B�v��ƬO�_�s�b--%>
	<c:choose>
	
		<%--���s�b--%>
		<c:when test="${TR.rowCount=='0'}">
			�d�L���
		</c:when>
	
		<%--�s�b--%>
		<c:otherwise>
			�d�ߦ��\<br><br>
			�B�v��Ƴ��i��
			<hr>
			<p>�`�@�� ${TR.rowCount} �����</p>
			<table align="center" border="1" cellspacing="0">

				<%--���D--%>	
				<tr align="center" bgcolor="papayawhip">
					<c:choose>			
						<%--�ֵ����--%>
						<c:when test="${TR.rowCount<='5'}">
							<th>�s��</th><th>�Ǹ�</th><th>�ˬd���</th><th>��������</th><th>�B�v����</th><th>���B�v���p</th><th>�B�v���p</th><th>�O�_����</th>
						</c:when>						
						<%--�h�����--%>
						<c:otherwise>			
							<th><a href="query_deal.jsp?select0=${param.select0}&sort=1">�s��</a><th><a href="query_deal.jsp?select0=${param.select0}&sort=2">�Ǹ�</a></th></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=3">�ˬd���</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=12">��������</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=8">�B�v����</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=5">���B�v���p</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=6">�B�v���p</a></th><th><a href="query_deal.jsp?select0=${param.select0}&sort=7">�O�_����</a></th>
						</c:otherwise>				
					</c:choose>													
				</tr>
			
			<%--����B�v�O���}�l--%>
			<c:forEach items="${TR.rowsByIndex}" var="TR_put">		

				<c:if test="${TR_put[0]%2=='0'}">
					<tr align="center" bgcolor="#eeeeee">
				</c:if>
				<c:if test="${TR_put[0]%2=='1'}">		
					<tr align="center" bgcolor="#cccccc">
				</c:if>				
			

					<c:forEach begin="0" end="2" var="item">
						<td>${TR_put[item]}</td>
					</c:forEach>
					<td>${TR_put[11]}</td>
					<td>${TR_put[7]}</td>
					<td>${TR_put[4]}</td>
					<td>${TR_put[5]}</td>
					<td>
						<c:choose>
							<c:when test="${TR_put[6]=='true'}"><strike>�w�g����</strike></c:when>
							<c:otherwise><b><font color="darkorenge">�|������</font></b></c:otherwise>
						</c:choose>
					</td>						
				</tr>

	
			</c:forEach>		
			<%--����B�v�O������--%>
			</table>			
		</c:otherwise>	
		<%--�s�b--%>					
	</c:choose>
	<%--�B�v��ƬO�_�s�b--%>	
</div>
<%--�m������--%>