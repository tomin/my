<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�d�߾Ǹ��O�_�b�ǥ͸�Ƹ�--%>
<sql:query sql="SELECT * FROM student where Stu_ID = ${param.textfield0}" var="student" />

<%--�Ǹ��O�_�s�b--%>
<c:choose>
	
	<%--�Ǹ����s�b--%>
	<c:when test="${student.rowCount=='0'}">
		<center>
			<p>�ӦW�ǥͤ��s�b</p>
			<p><a href="../student/add.jsp">�s�W�ǥ͸��</a></p>
		</center>
	</c:when>
			
	<%--�@�뱡�ζ}�l--%>
	<c:otherwise>
		<%------------------------------------------------------------�s�W���˰O���}�l------------------------------------------------------------%>
		<c:if test="${param.sort==null}">
			<sql:update>
			  INSERT INTO HER
			  VALUES ( ? , ? , ? )  
			  <sql:param value="${param.textfield}" />
			  <sql:param value="${param.textfield0}" />  
			  <sql:param value="${param.select1}+${param.select2}+${param.select3}" />
			</sql:update>
	
			<%--Ū��add.jsp�ǹL�Ӫ��ˬd���G--%>
			<c:forEach begin="1" end="42" var="item" varStatus="s">
				<% 
					int i = ((Integer) pageContext.getAttribute("item")).intValue();
					pageContext.setAttribute("textStr", "text"+i);				
				%>
				<%--�Ӷ��ئ��ˬd--%>
				<c:if test="${param[textStr]!=null}">
					<c:if test="${param[textStr]!=''}">
						
						<%--�P�_�ˬd���G�O�_���`�}�l--%>
						
						<%--��l�Ȭ����`--%>
						<c:set value="0" var="abnormal"/>
						
						<c:choose>						
							<%--�@���ˬd--%>
								<%--���Y��--%>
								<c:when test="${item=='3'}">
									<c:if test="${param[textStr]>160}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
		
								<%--�αi��--%>
								<c:when test="${item=='4'}">
									<c:if test="${param[textStr]>90}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
	
								<%--����������O--%>
								<c:when test="${item=='5'}">
									<%--���B��--%>
									<c:if test="${param.text7==''}">
										<c:if test="${param[textStr]<0.6}">
											<c:set value="1" var="abnormal"/>
										</c:if>
									</c:if>
								</c:when> 	
	
								<%--����k�����O--%>
								<c:when test="${item=='6'}">
									<%--���B��--%>
									<c:if test="${param.text8==''}">
										<c:if test="${param[textStr]<0.6}">
											<c:set value="1" var="abnormal"/>
										</c:if>
									</c:if>
								</c:when> 								
		
								<%--�B���������O--%>
								<c:when test="${item=='7'}">
									<c:if test="${param[textStr]<0.6}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 	
	
								<%--�B���k�����O--%>
								<c:when test="${item=='8'}">
									<c:if test="${param[textStr]<0.6}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 	
								
								<%--���O--%>
								<c:when test="${item=='11'}">
									<c:if test="${param[textStr]=='������'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 
								
								<%--ť�O--%>
								<c:when test="${item=='12'}">
									<c:if test="${param[textStr]=='������'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 
								
							<%--���G�ˬd--%>
								<%--���P��--%>
								<c:when test="${item=='18'}">
									<c:if test="${param[textStr]<5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>8}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 
		
								<%--���x����--%>
								<c:when test="${item=='19'}">
									<c:if test="${param[textStr]=='�����`'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
		
								<%--�x����--%>
								<c:when test="${item=='20'}">
									<c:if test="${param[textStr]=='���ʤ���'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when> 						
				
								<%--���--%>
								<c:when test="${item=='21'}">
									<c:if test="${param[textStr]=='���ʤ���'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
								
								<%--�ȵv���Q--%>
								<c:when test="${item=='22'}">
									<c:if test="${param[textStr]=='���ʤ���'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>						
		
								<%--�զ�y��Q--%>
								<c:when test="${item=='23'}">
									<c:if test="${param[textStr]=='���ʤ���'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
								
							<%--��G�ˬd--%>
								<%--����y--%>
								<c:when test="${item=='24'}">
									<c:if test="${param[textStr]<380}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>600}">
										<c:set value="1" var="abnormal"/>
									</c:if>							
								</c:when>
								
								<%--�����--%>
								<c:when test="${item=='25'}">
									<c:if test="${param[textStr]<12}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>18}">
										<c:set value="1" var="abnormal"/>
									</c:if>								
								</c:when>
		
								<%--��y�e�n��--%>
								<c:when test="${item=='26'}">
									<c:if test="${param[textStr]<34}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>50}">
										<c:set value="1" var="abnormal"/>
									</c:if>							
								</c:when>						
		
								<%--������y��n--%>
								<c:when test="${item=='27'}">
									<c:if test="${param[textStr]<80}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>102}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--������y�����--%>
								<c:when test="${item=='28'}">
									<c:if test="${param[textStr]<27}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>34}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
								<%--������y������@��--%>
								<c:when test="${item=='29'}">
									<c:if test="${param[textStr]<32}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>36}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--�զ�y--%>
								<c:when test="${item=='30'}">
									<c:if test="${param[textStr]<4000}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>10000}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--��y������@��--%>
								<c:when test="${item=='31'}">
									<c:if test="${param[textStr]<15}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>45}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
							<%--�x�\���ˬd--%>
								<%--��M���į�����i�Q--%>
								<c:when test="${item=='32'}">
									<c:if test="${param[textStr]<5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>40}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--��M���Ĥ�଻����i�Q--%>
								<c:when test="${item=='33'}">
									<c:if test="${param[textStr]<5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>40}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
							<%--B���x���ˬd--%>
								<%--B���x�����ܭ�--%>
								<c:when test="${item=='34'}">
									<c:if test="${param[textStr]=='���ʤ���'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>
		
								<%--B���x��������--%>
								<c:when test="${item=='35'}">
									<c:if test="${param[textStr]=='���ʤ���'}">
										<c:set value="1" var="abnormal"/>
									</c:if>
								</c:when>						
							
							<%--�ǥ\���ˬd--%>
								<%--�姿����--%>
								<c:when test="${item=='36'}">
									<c:if test="${param[textStr]<8}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>23}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--�ٻ���--%>
								<c:when test="${item=='37'}">
									<c:if test="${param[textStr]<0.6}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>1.4}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--����--%>
								<c:when test="${item=='38'}">
									<c:if test="${param[textStr]<2}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>8}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
								
							<%--��ת��ˬd--%>
								<%--�`�x�T�J--%>
								<c:when test="${item=='39'}">
									<c:if test="${param[textStr]<130}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>200}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>	
		
							<%--�z���ˬd--%>
								<%--�ݳ�X���ˬd--%>
								<c:when test="${item=='40'}">
									<c:if test="${param[textStr]=='������'}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>	
		
							<%--��L�ˬd--%>
								<%--�߷i--%>
								<c:when test="${item=='41'}">
									<c:if test="${param[textStr]<60}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>90}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>
		
								<%--�`�x���--%>
								<c:when test="${item=='41'}">
									<c:if test="${param[textStr]<0.5}">
										<c:set value="1" var="abnormal"/>
									</c:if>
									<c:if test="${param[textStr]>1.2}">
										<c:set value="1" var="abnormal"/>
									</c:if>	
								</c:when>																
						</c:choose>
						<%--�P�_�ˬd���G�O�_���`����--%>
									
						<%--�s�W�ˬd���G�ܸ�Ʈw�}�l--%>
						<sql:update>
							INSERT INTO EXAM
							VALUES ( ? , ? , ? , ? )
							<%--���˽s���O�_��J--%>
							<c:choose>
								<%--�����J--%>
								<c:when test="${param.textfield!=''}">
									<sql:param value="${param.textfield}" />
								</c:when> 
								<%--�S����J--%>
								<c:otherwise>
									<sql:query sql="SELECT MAX(HER_ID) FROM HER" var="MAX" />
										<c:forEach items="${MAX.rowsByIndex}" var="MAX_put">
											<sql:param value="${MAX_put[0]}" />
										</c:forEach>
								</c:otherwise>
							</c:choose>                   
							<sql:param value="${item}" />
							<sql:param value="${param[textStr]}"/>
							<sql:param value="${abnormal}"/>          
						</sql:update>
						
						<%--�s�W�ˬd���G�ܸ�Ʈw����--%>
					</c:if>
				</c:if>
			</c:forEach>
			<%--Ū��add.jsp�ǹL�Ӫ��ˬd���G����--%>	
		</c:if>
		<%------------------------------------------------------------�s�W���˰O������------------------------------------------------------------%>

		<%--�d�߶}�l--%>
		
		<%--Ū�����˽s���}�l--%>
		
			<sql:query sql="SELECT * FROM HER where Stu_ID = ${param.textfield0}" var="HER" />					
			
			�s�W���\<br><br>
			���˸�Ƴ��i��
			<hr>
			<c:forEach items="${HER.rowsByIndex}" var="HER_put">
				<c:set value="${HER_put[0]}" var="HER_ID"/>
				���˰O���s���G${HER_put[0]}<br>
				�Ǹ��G${HER_put[1]}<br>	
				�ˬd����G${HER_put[2]}	
			</c:forEach>
			
		<%--Ū�����˽s������--%>
		
		<%--Ū���ˬd���G�}�l--%>
		
			<%--�ƧǻP�_--%>
			<c:choose>
				<%--�Ƨ�--%>
				<c:when test="${param.sort!=null}">
					<c:set value="${param.sort}" var="sort"/>			
				</c:when>
				
				<%--���Ƨ�--%>
				<c:otherwise>
					<c:set value="1" var="sort"/>
				</c:otherwise>
			</c:choose>							
	
			<sql:query sql="SELECT * FROM exam where HER_ID = ${HER_ID} order by ${sort} asc" var="exam" />				
			
		<%--Ū���ˬd���G����--%>
		
		<%--�p�G�ˬd���G�s�b�}�l--%>
		<c:if test="${exam.rowCount!='0'}">
		
			<%--�C�X�ˬd���G�}�l--%>
			<table>
			
				<%--���D--%>
				<tr>
					<th><a href="add_deal.jsp?textfield0=${param.textfield0}&sort=2">�s��</a></th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th><a href="add_deal.jsp?textfield0=${param.textfield0}&sort=3">�ˬd���G</a></th><th><a href="add_deal.jsp?textfield0=${param.textfield0}&sort=4">�O�_���`</a></th>
				</tr>
				
				<%--���e�}�l--%>				
				<c:forEach items="${exam.rowsByIndex}" var="exam_put">
					<%--�d�߶���--%>
					<sql:query sql="SELECT * FROM item where item_id = ${exam_put[1]}" var="item" />
					<tr align="center">
						<%--�C�X�ˬd����--%>
						<c:forEach items="${item.rowsByIndex}" var="item_put">
							<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td>${item_put[3]}</td><td>${item_put[4]}</td>
						</c:forEach>
						
						<%--���˵��G--%>		
						<td>${exam_put[2]}</td>
												
						<%--�O�_���`--%>
						<td>							
							<c:choose>
								<c:when test="${exam_put[3]=='1'}">���`</c:when>
								<c:otherwise><font color="red">���`</font></c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				<%--���e����--%>  
			</table>
			<%--�C�X�ˬd���G����--%>
		</c:if>
		<%--�p�G�ˬd���G�s�b����--%>
		
		<%--�d�ߵ���--%>
	</c:otherwise>
	<%--�@�뱡�ε���--%>
</c:choose>
<%--�Ǹ��O�_�s�b--%>