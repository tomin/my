<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<%--��J�Ǹ�--%>
<c:if test="${param.id==null}">
	<center>
	<p>�ק��B�v�O��</p>
	<form name="form" method="post" action="edit.jsp">
		�Ǹ��G<input name="id" type="text"><input type="submit" name="Submit" value="�ק�"> 
	</form>
	</center>
</c:if>
<%--�D�{���}�l--%>
<c:if test="${param.id!=null}">
	<%--��ܶ}�l--%>	
	<c:choose>
	
		<%--�Ǹ��ť�--%>
		<c:when test="${param.id==''}">
			�Ǹ�����ť�
		</c:when>
		
		<%--�ק�}�l--%>
		<c:otherwise>
			<%--�s����Ʈw--%>
			<%@ include file="../include/mysql.jsp" %>
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
						<%--�ק��B�v�O���}�l--%>												
						<c:otherwise>				
							<form name="form" method="post" action="edit_deal.jsp">
								<table align="center">
									<tr>
										<td>
											<center>�ק��B�v�O��</center>
											<p>�Ǹ��G
											<input type="text" name="textfield0" value="${param.id}" readonly>
											</p>
											<sql:query sql="SELECT * FROM TR WHERE STU_ID = ${param.id}" var="TR" />												
											<c:forEach items="${TR.rowsByIndex}" var="TR_put">
												<c:set value="${TR_put[0]}" var="TR_ID"/>
												<p>�s���G
												<input type="text" name="textfield1" value="${TR_put[0]}" readonly>
												</p>
												<p>����G
												<input type="text" name="textfield2" value="${TR_put[2]}">
												</p>																			
											</c:forEach>																
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
												<sql:query sql="SELECT * FROM TREAT WHERE TR_ID = ${TR_ID} AND ITEM_ID = ${item_put[0]}" var="TREAT" />
												<c:choose>							
													<c:when test="${TREAT.rowCount=='0'}">
														<td><input type="text" name="before${num}" size="13"></td>
														<td><input type="text" name="after${num}" size="13"></td>
														<td><select name="finish${num}"><option value="0">�_</option><option value="1">�O</option></select></td>														
													</c:when>								
													<c:otherwise>
														<c:forEach items="${TREAT.rowsByIndex}" var="TREAT_put">												
															<td><input type="text" name="before${num}" size="13" value="${TREAT_put[2]}"></td>
															<td><input type="text" name="after${num}" size="13" value="${TREAT_put[3]}"></td>
															<td>
																<c:set value="" var="selected"/>
																<c:if test="${TREAT_put[4]=='true'}">
																	<c:set value=" selected" var="selected"/>
																</c:if>
																<select name="finish${num}">
																	<option value="0">�_</option>
																	<option value="1"${selected}>�O</option>
																</select>
															</td>
														</c:forEach>
													</c:otherwise>
												</c:choose>													
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
						<%--�ק��B�v�O���}�l����--%>
						
					</c:choose>									
					<%--�P�_�O�_�����`����--%>
				</c:otherwise>
				<%--�����˸�Ƶ���--%>
			</c:choose>
			<%--�O�_�����˸�Ƶ���--%>			
		</c:otherwise>
		<%--�קﵲ��--%>				
	</c:choose>
	<%--��ܵ���--%>
</c:if>
<%--�D�{������--%>