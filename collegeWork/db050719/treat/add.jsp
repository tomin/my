<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<%--�m���}�l--%>
<div align="center">
	<%--��J�Ǹ�--%>
	<c:if test="${param.id==null}">
		<p>�s�W�B�v�O��</p>
		<form name="form" method="post" action="add.jsp">
			�Ǹ��G<input name="id" type="text"><input type="submit" name="Submit" value="�s�W"> 
		</form>
	</c:if>
	<%--�D�{���}�l--%>
	<c:if test="${param.id!=null}">
		<%--��ܶ}�l--%>	
		<c:choose>
		
			<%--�Ǹ��ť�--%>
			<c:when test="${param.id==''}">
				�Ǹ�����ť�
			</c:when>
			
			<%--�Ǹ����O�ť�--%>
			<c:otherwise>
				<%--�s����Ʈw--%>
				<%@ include file="../include/mysql.jsp" %>
				<sql:query sql="SELECT * FROM TR WHERE STU_ID = ${param.id}" var="TR" />
				
				<%--�B�v�O���O�_�s�b--%>
				<c:choose>
				
					<%--���B�v�O��--%>	
					<c:when test="${TR.rowCount=='1'}">			
						<p>�Ǹ� ${param.id} �B�v�O���w�g�s�b</p>
						<p>�Шϥ�<a href="edit.jsp?id=${param.id}">�ק��B�v�O��</a></p>
					</c:when>
					
					<%--�s�W�}�l--%>
					<c:otherwise>												
						<%--�d�߰��˸��--%>
						<sql:query sql="SELECT * FROM HER where stu_id = '${param.id}'" var="HER" />
						<%--�O�_�����˸�ƶ}�l--%>
						<c:choose>
							<%--�S�����˸��--%>
							<c:when test="${HER.rowCount=='0'}">
								�S���Ǹ� ${param.id} �����˸��
							</c:when>
							
							<%--�����˸�ƶ}�l--%>
							<c:otherwise>
							
								<%--�d�ߦ����`������--%>
								<c:forEach items="${HER.rowsByIndex}" var="HER_put">
									<sql:query sql="SELECT * FROM exam where HER_ID = ${HER_put[0]} and Abnormal = 1" var="exam" />	
								</c:forEach>
								<%--�P�_�O�_�����`�}�l--%>
								<c:choose>
									<%--�L���`--%>
									<c:when test="${exam.rowCount=='0'}">
										�Ǹ� ${param.id} �d�L���`����
									</c:when>					
									
									<%--�����`--%>
									<%--�s�W�B�v�O���}�l--%>												
									<c:otherwise>
										<form name="form" method="post" action="add_deal.jsp">
											<table align="center">
												<tr>
													<td>
														<center>�s�W�B�v�O��</center>
														<p>�Ǹ��G
														<input type="text" name="textfield0" value="${param.id}" readonly>
														</p>
														<p>�s���G
														<input type="text" name="textfield1">
														</p>
														<p>����G
														<select name="select1"><c:forEach begin="2005" end="2020" var="year"><option>${year}</option></c:forEach></select>�~
														<select name="select2"><c:forEach begin="1" end="12" var="month"><option>${month}</option></c:forEach></select>��
														<select name="select3"><c:forEach begin="1" end="31" var="day"><option>${day}</option></c:forEach></select>��
														</p>							
														<p align="center">�B�v����</p>
														<p></p>
													</td>
												</tr>
											</table>
			
											<table align="center">
												<tr>
													<th>�s��</th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th>����</th><th>���B�v���p</th><th>�B�v���p</th><th>����</th>
												</tr>
												<c:set value="0" var="num"/>
												<c:forEach items="${exam.rowsByIndex}" var="exam_put">
													<c:set value="${num+1}" var="num"/>
													<sql:query sql="SELECT * FROM item where item_id = ${exam_put[1]}" var="item" />												
													<c:forEach items="${item.rowsByIndex}" var="item_put">	
														<tr align="center">												
															<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td>${item_put[3]}</td><td>${item_put[4]}</td><td>${exam_put[2]}</td>												
															<td><input type="text" name="before${num}" size="13"></td><td><input type="text" name="after${num}" size="13"></td><td><select name="finish${num}"><option value="0">�_</option><option value="1">�O</option></select></td>
															<c:set value="${item_put[0]}" var="item_id"/><input type="hidden" name="item_id${num}" value="${item_id}">
														</tr>
													</c:forEach>
												</c:forEach>
												<input type="hidden" name="num" value="${num}">
											</table>  
										  <p>
											<center>
												<input type="submit" name="Submit" value="�e�X">
											</center>
										  </p>
										</form>					
									</c:otherwise>
									<%--�s�W�B�v�O������--%>
									
								</c:choose>									
								<%--�P�_�O�_�����`����--%>
							</c:otherwise>
							<%--�����˸�Ƶ���--%>						
						</c:choose>
						<%--�O�_�����˸�Ƶ���--%>
					</c:otherwise>
					<%--�s�W����--%>						
				</c:choose>
				<%--�B�v�O���O�_�s�b--%>
			</c:otherwise>
			<%--�Ǹ����O�ť�--%>			
		</c:choose>
		<%--��ܵ���--%>
	</c:if>
	<%--�D�{������--%>
</div>
<%--�m������--%>