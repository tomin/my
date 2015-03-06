<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%--�d�߰��˸��--%>
<sql:query var="HER">
    <c:choose>
	
		<%--�Ƨ�--%>
		<c:when test="${param.sort!=null}">
		  	SELECT * FROM HER natural join exam natural join item where item.item_id = ${param.select1} AND Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} ) ORDER BY ${param.sort} ASC
		</c:when>	
		
		<%--�Ǹ�--%>
		<c:when test="${param.textfield0!=''}">
		  	SELECT * FROM HER natural join exam natural join item where item.item_id = ${param.select1} AND Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--�Z��--%>
		<c:otherwise>			
		  	SELECT * FROM HER natural join exam natural join item where item.item_id = ${param.select1} AND Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )		
		</c:otherwise>				
	</c:choose>
</sql:query>

<div align="center">
	<%--���˸�ƬO�_�s�b--%>
	<c:choose>
	
		<%--���s�b--%>
		<c:when test="${HER.rowCount=='0'}">
			�d�L���
		</c:when>
	
		<%--�s�b--%>		
		<c:otherwise>
			<p>�d�ߦ��\</p>
			<p>���˸�Ƴ��i��</p>
			<hr>
			<c:forEach items="${HER.rowsByIndex}" begin="0" end="0" var="HER_put">
				<p>${HER_put[10]}</p>
				<p><u>${HER_put[6]} ${HER_put[7]}</u></p>
				<p>
					<c:if test="${HER_put[8]!=null}">			
						�Ѧҭ�:${HER_put[8]} 
					</c:if>
					<c:if test="${HER_put[9]!=null}">							
						���:${HER_put[9]}			
					</c:if>				
				</p>				
			</c:forEach>
			<p>�`�@�� ${HER.rowCount} �����</p>			
			<table width="80%" align="center" border="1">	
				<tr align="center">
					<c:choose>			
						<%--�Ǹ�--%>
						<c:when test="${HER.rowCount=='1'}">
							<th>���˽s��</th><th>�Ǹ�</th><th>�ˬd���</th><th>�ˬd���G</th><th>�O�_���`</th>
						</c:when>						
						<%--�Z��--%>
						<c:otherwise>			
							<th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=1">���˽s��</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=2">�Ǹ�</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=3">�ˬd���</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=5">�ˬd���G</a></th><th><a href="query_single_deal.jsp?select0=${param.select0}&select1=${param.select1}&sort=6">�O�_���`</a></th>
						</c:otherwise>				
					</c:choose>								
				</tr>					
				<c:forEach items="${HER.rowsByIndex}" var="HER_put">
					
					<tr align="center">
						<c:forEach begin="0" end="2" var="item">
							<td>${HER_put[item]}</td>
						</c:forEach>
						<td>${HER_put[4]}</td>
						<td>
							<c:choose>
								<c:when test="${HER_put[5]=='1'}">���`</c:when>
								<c:otherwise><font color="red">���`</font></c:otherwise>
							</c:choose>
						</td>
					</tr>
						
				</c:forEach>
			</table>
		</c:otherwise>
						
	</c:choose>
</div>