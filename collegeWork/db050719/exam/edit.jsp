<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.id==null}">
	<p>�קﰷ�˸��</p>
	<form name="form" method="post" action="edit.jsp">
		�Ǹ��G<input name="id" type="text"><input type="submit" name="Submit" value="�ק�"> 
	</form>
</c:if>
<c:if test="${param.id!=null}">
	<c:choose>
		<%--�Ǹ��ť�--%>
		<c:when test="${param.id==''}">
			�Ǹ�����ť�
		</c:when>
		<c:otherwise>
			<%@ include file="../include/mysql.jsp" %>			
			<sql:query sql="SELECT * FROM HER where stu_id = '${param.id}'" var="HER" />
			<c:choose>
			
				<c:when test="${HER.rowCount=='0'}">
				�S���Ǹ� ${param.id} �����˸��
				</c:when>
				
				<c:otherwise>
				�קﰷ�˸��
				<form name="form" method="post" action="edit_deal.jsp">
				<c:forEach items="${HER.rowsByIndex}" var="HER_put" >
				  <p>�Ǹ��G
					<input type="text" name="textfield0" value="${HER_put[1]}" readonly="">
				  </p>
				  <p>  ���˰O���s���G
					<input type="text" name="textfield" value="${HER_put[0]}">
				  </p>
				  <p>  �ˬd����G 
					<input type="text" name="textfield1" value="${HER_put[2]}">
				  </p>
					<sql:query sql="SELECT * FROM item order by item_id asc" var="item" />
					<sql:query sql="SELECT * FROM exam where HER_ID = ${HER_put[0]}" var="exam" />	
				</c:forEach>  
				  <p>���綵��</p>
					<table>
						<tr>
							<th>�s��</th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th>�ˬd���G</th><th>�O�_���`</th>
						</tr>
						<c:forEach items="${item.rowsByIndex}" var="item_put">	
						<tr>
							<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td align="center">${item_put[3]}</td><td>${item_put[4]}</td>
							<td>
								<%--�w�]���ŭ�--%>
								<c:set var="text" value=""/>
								<c:set var="select" value=""/>
								
								<c:forEach items="${exam.rowsByIndex}" var="exam_put">
									<%--�p�G�Ӷ��ئ��ˬd�L--%>
									<c:if test="${item_put[0]==exam_put[1]}">									
										<%--�N�ˬd���G��Jtext--%>
										<c:set var="text" value="${exam_put[2]}"/>
										
										<%--�p�G�ˬd���G�����`--%>
										<c:if test="${exam_put[3]=='true'}">
											<%--�]�wselect���w���--%>
											<c:set var="select" value=" selected"/>
										</c:if>
										
									</c:if>						
								</c:forEach> 
								<input type="text" name="text${item_put[0]}" value="${text}" size="13">
							</td>			
							<td>				
								<select name="select${item_put[0]}">
								  <option value="0">���`</option>
								  <option value="1"${select}>���`</option>
								</select>
							</td>
						</tr>
						</c:forEach>  
					</table>  
				  <p>
				  	<center>
					<input type="submit" name="Submit" value="�e�X"> 
					</center>
				  </p>
				</form>
				</c:otherwise>
			</c:choose>
		</c:otherwise>				
	</c:choose>
</c:if>