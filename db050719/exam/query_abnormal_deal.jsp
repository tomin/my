<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<%--�d�߰��˸��--%>
<sql:query var="HER">
    <c:choose>
	
		<%--�Ƨ�--%>
		<c:when test="${param.sort!=null}">
		  	SELECT * FROM HER natural join exam natural join item where abnormal=1 and Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )	
					ORDER BY ${param.sort} ASC
		</c:when>	
		
		<%--�Ǹ�--%>
		<c:when test="${param.textfield0!=''}">
		  	SELECT * FROM HER natural join exam natural join item where abnormal=1 and Stu_ID = ${param.textfield0}
		</c:when>
		
		<%--�Z��--%>
		<c:otherwise>			
		  	SELECT * FROM HER natural join exam natural join item where abnormal=1 and Stu_ID = ANY
				( SELECT Stu_ID FROM student where Class_ID = ${param.select0} )		
		</c:otherwise>				
	</c:choose>
</sql:query>

<%--���˸�ƬO�_�s�b--%>
<c:choose>

	<%--���s�b--%>
	<c:when test="${HER.rowCount=='0'}">
		<center>�d�L���</center>
	</c:when>
		
	<%--�s�b--%>
	<c:otherwise>
		<div align="center">
			�d�ߦ��\<br><br>
			���˸�Ƴ��i��
			<hr>
			<p>�H�U�����˰O�������`���ǥ͸��</p>
			<p>�`�@�� ${HER.rowCount} �����</p>
		</div>
		<table align="center" border="1" cellspacing="0">
		
			<tr bgcolor="#99CCCC">
				<c:choose>
				
					<%--�Ƨ�--%>
					<c:when test="${HER.rowCount>'9'}">
						<th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=1">�s��</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=2">�Ǹ�</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=3">���ˤ��</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=4">����</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=11">��������</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=7">���ؤ���W</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=8">���ح^��W</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=9">�Ѧҭ�</a></th><th><a href="query_abnormal_deal.jsp?select0=${param.select0}&sort=5">�ˬd���G</a></th><th>�B�v</a></th>
					</c:when>
										
					<%--�Ǹ�--%>
					<c:otherwise>			
						<th>�s��</th><th>�Ǹ�</th><th>���ˤ��</th><th>����</th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>�ˬd���G</th><th>�B�v</th>
					</c:otherwise>
							
				</c:choose>											
			</tr>
									
			<%--��ܰ��˰O���}�l--%>								
			<c:forEach items="${HER.rowsByIndex}" var="HER_put">
			
				<c:if test="${HER_put[0]%2=='0'}">
					<tr align="center" bgcolor="#CCFF99">
				</c:if>
				<c:if test="${HER_put[0]%2=='1'}">
					<tr align="center" bgcolor="#CCFFFF">
				</c:if>				
						<c:forEach begin="0" end="3" var="item">
							<td>${HER_put[item]}</td>
						</c:forEach>
						<td>${HER_put[10]}</td>
						<c:forEach begin="6" end="8" var="item">
							<td>${HER_put[item]}</td>
						</c:forEach>
						<td>${HER_put[4]}</td>				
						<%--�d���B�v�O��--%>
						<sql:query sql="SELECT Treat_Finish FROM treat where item_id = ${HER_put[3]} AND TR_ID =  ANY ( SELECT TR_ID FROM TR where stu_id = ${HER_put[1]} )" var="treat" />
						<%--����B�v�O���}�l--%>																	
						<td>											
							<c:choose>							
								<c:when test="${treat.rowCount=='0'}"><font color="red">���B�v</font></c:when>								
								<c:otherwise>
									<c:forEach items="${treat.rowsByIndex}" var="treat_put">		
										<c:choose>										
												<c:when test="${treat_put[0]=='true'}">�w���\</c:when>
												<c:when test="${treat_put[0]=='false'}"><font color="green">�����\</font></c:when>										
										</c:choose>	
									</c:forEach>									
								</c:otherwise>
							</c:choose>																						
						</td>															
						<%--����B�v�O������--%>
					</tr>

			</c:forEach>
			<%--��ܰ��˰O������--%>				
			 
		</table>
	</c:otherwise>
					
</c:choose>		