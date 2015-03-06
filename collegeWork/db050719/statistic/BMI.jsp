<%@ include file="../check/session/statistic.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<p>BMI�p��</p>
	<%--��J--%>
	<form name="form" method="post" action="BMI.jsp">
		<table align="center">
		  <tr>
			<td>
				<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
				<p>�D�t�šG
					<select name="select">
						<c:forEach items="${result.rowsByIndex}" var="row" >
							<c:choose>
								<c:when test="${param.select==row[0]}">
									<option value="${row[0]}" selected>
								</c:when>						
								<c:otherwise>
									<option value="${row[0]}">
								</c:otherwise>
							</c:choose>
							${row[0]}.${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]}</option>
						</c:forEach>
					</select>
				</p>
				<p>�D�Ǹ��G
					<input type="text" name="id">
				</p>    
			</td>
		  </tr>
		</table>
		<p><input type="submit" name="Submit" value="�d��"></p>		
	</form>

	<%--�d��--%>
	<c:if test="${!empty param.select}">
		<hr>
		<p>�t�� ${param.select} ����</p>
		<c:choose>		
			<%--�Z��--%>
			<c:when test="${empty param.id}">
				<sql:query var="height">
					SELECT HER.HER_ID,HER.STU_ID,NAME,SEX,BDATE,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 1 
					<c:if test="${param.sort!=null}">
						ORDER BY ${param.sort} ASC
					</c:if>					
				</sql:query>
				<sql:query sql="SELECT HER.HER_ID,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 2" var="weight" />
			</c:when>

			<%--�Ǹ�--%>			
			<c:otherwise>
				<sql:query sql="SELECT HER.HER_ID,HER.STU_ID,NAME,SEX,BDATE,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.STU_ID = ${param.id} AND EXAM.ITEM_ID = 1" var="height" />
				<sql:query sql="SELECT HER.HER_ID,EXAM_RESULT FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT WHERE STUDENT.STU_ID = ${param.id} AND EXAM.ITEM_ID = 2" var="weight" />
			</c:otherwise>
		</c:choose>
		
		<%--�O�_�d�o����--%>
		<c:choose>
			<%--�L���--%>
			<c:when test="${height.rowCount==0 || weight.rowCount==0}">
				�d�L���
			</c:when>
			
			<%--�����--%>
			<c:otherwise>
				<%--��ܬd�ߵ��G--%>
				<p>�d�ߨ� ${height.rowCount} �����</p>
				<table width="70%" cellspacing="0">
					<tr bgcolor="#99CCCC">
						<c:if test="${height.rowCount>1}">
							<th><a href="?select=${param.select}&sort=2">�Ǹ�</a></th><th><a href="?select=${param.select}&sort=3">�m�W</a></th><th><a href="?select=${param.select}&sort=4">�ʧO</a></th><th><a href="?select=${param.select}&sort=5">�ͤ�</a></th><th>�魫</th><th><a href="?select=${param.select}&sort=6">����</a></th><th>BMI</th><th>���G</th>
						</c:if>
						<c:if test="${height.rowCount==1}">
							<th>�Ǹ�</th><th>�m�W</th><th>�ʧO</th><th>�ͤ�</th><th>�魫</th><th>����</th><th>BMI</th><th>���G</th>
						</c:if>
					</tr>
					<c:forEach items="${height.rowsByIndex}" var="height_put" >
						<c:forEach items="${weight.rowsByIndex}" var="weight_put" >
							<c:if test="${height_put[0]==weight_put[0]}">
								<c:if test="${height_put[3]=='�k'}">
									<tr align="center" bgcolor="#ccccee">
								</c:if>
								<c:if test="${height_put[3]=='�k'}">
									<tr align="center" bgcolor="#eecccc">
								</c:if>								
									<td>${height_put[1]}</td>
									<td>${height_put[2]}</td>
									<td>${height_put[3]}</td>
									<td>${height_put[4]}</td>
									<td>${weight_put[1]}</td>
									<td>${height_put[5]}</td>
									<c:set value="${weight_put[1]/(height_put[5]/100*height_put[5]/100)}" var="BMI"/>
									<td><fmt:formatNumber value="${BMI}" maxFractionDigits="2"/></td>
									<%--�P�_BMI���G--%>
									<td>
									<%--�k��--%>
									<c:if test="${height_put[3]=='�k'}">
										<c:choose>
											<c:when test="${BMI>=28}">
												<font color="red">�L��</font>
											</c:when>
											
											<c:when test="${BMI>=25}">
												<font color="green">�y��</font>
											</c:when>

											<c:when test="${BMI>=20}">
												���`
											</c:when>
											
											<c:when test="${BMI>=15}">
												<font color="green">�y��</font>
											</c:when>
											
											<c:otherwise>
												<font color="red">�L��</font>
											</c:otherwise>
										</c:choose>
									</c:if>

									<%--�k��--%>
									<c:if test="${height_put[3]=='�k'}">
										<c:choose>
											<c:when test="${BMI>=25}">
												<font color="red">�L��</font>
											</c:when>
											
											<c:when test="${BMI>=22}">
												<font color="green">�y��</font>
											</c:when>

											<c:when test="${BMI>=18}">
												���`
											</c:when>
											
											<c:when test="${BMI>=14}">
												<font color="green">�y��</font>
											</c:when>
											
											<c:otherwise>
												<font color="red">�L��</font>
											</c:otherwise>
										</c:choose>										
									</c:if>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>						
	</c:if>
</div>