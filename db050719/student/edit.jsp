<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.id==null}">
	<p>�ק�򥻸��</p>
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
			<script language="javascript">
			function checkdata() {
				id = document.form.textfield0.value;
				if(id==""){
					alert("�Ǹ��@�w�n��I");
					return false;
				}			
				else{
					return true;
				}			
			}
			</script>
			<sql:query sql="SELECT * FROM student where stu_id = '${param.id}'" var="student" />	
			<c:choose>
				<c:when test="${student.rowCount=='0'}">
					�S���Ǹ� ${param.id} ���򥻸��
				</c:when>
				
				<c:otherwise>
					�ק�򥻸��
				
					<c:forEach items="${student.rowsByIndex}" var="student_put" >
						<form name="form" method="post" action="edit_deal.jsp">
						  <p>�Ǹ��G<input type="text" name="textfield0" value="${student_put[0]}" readonly=""></p>
						  <p>�t�šG
							  
							<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
							<select name="select0">
								<c:forEach items="${result.rowsByIndex}" var="row" >
									<c:choose>
										<c:when test="${row[0]==student_put[1]}">
											<option value="${row[0]}" selected>					
										</c:when>
										
										<c:otherwise>			
											<option value="${row[0]}">
										</c:otherwise>				
									</c:choose>
										${row[0]}.${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]}
									</option>
								</c:forEach>
							</select>	  
						</p>
						  <p>  �m�W�G
							<input type="text" name="textfield1" value="${student_put[2]}">
						  </p>
						  <p>  �ʧO�G
							<c:choose>
								<c:when test="${student_put[3]=='�k'}">
									<input name="sex" type="radio" value="�k" checked>�k
									<input name="sex" type="radio" value="�k">�k  
								</c:when>
										
								<c:otherwise>
									<input name="sex" type="radio" value="�k">�k			
									<input name="sex" type="radio" value="�k" checked>�k 
								</c:otherwise>				
							</c:choose>	   
						  </p>
						  <p>  �����Ҧr���G 
							<input type="text" name="textfield2"  value="${student_put[5]}"> 
						  </p>
						  <p>  �X�ͤ���G 
							<input type="text" name="date"  value="${student_put[4]}">
						  </p>
						  <p>  �a�}�G 
							<input type="text" name="textfield3" value="${student_put[6]}"> 
						  </p>
						  <p>  �q�ܡG 
							<input type="text" name="textfield4" value="${student_put[7]}"> 
						  </p>
						  <p>  ����G 
							<input type="text" name="textfield5" value="${student_put[8]}"> 
						  </p>
						  <p>  e-mail �G 
							<input type="text" name="textfield6" value="${student_put[9]}">
						  </p>
						  <p>  �O�_����ǥ͡G 
							<c:choose>
								<c:when test="${student_put[10]=='0'}">
									<input name="trans" type="radio" value="1">�O			
									<input name="trans" type="radio" value="0" checked>�_ 			
								</c:when>
										
								<c:otherwise>
									<input name="trans" type="radio" value="1" checked>�O
									<input name="trans" type="radio" value="0">�_  
								</c:otherwise>				
							</c:choose>	  	  
						  </p>
						  <p>    �N�Ǫ��A�G 
							<input type="text" name="studying" value="${student_put[11]}">
						  </p>
						  <p>  ����p���H�m�W�G
							<input type="text" name="textfield9" value="${student_put[12]}">
						  </p>
						  <p>  �P�p���H���Y�G
							<input type="text" name="textfield10" value="${student_put[13]}">
						  </p>
						  <p>  �p���H�q�ܡG
							<input type="text" name="textfield11" value="${student_put[14]}">
						  </p>
						  <p>  �p���H����G
							<input type="text" name="textfield12" value="${student_put[15]}">
						  </p>
						  <p>
							<input type="submit" name="Submit" value="�e�X" onClick="return checkdata()"> 
						  </p>
						</form>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</c:otherwise>				
	</c:choose>
</c:if>