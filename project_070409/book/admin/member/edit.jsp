<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.keyword==null}">
	
<p>�ק�|�����</p>
	<form name="form" method="post" action="edit.jsp">
  <p>�b��: 
    <input type="text" name="keyword">
  </p>
  <p> 
    <input type="submit" name="Submit" value="�ק�">

  </p>
</form>
</c:if>
<c:if test="${param.keyword!=null}">
	<c:choose>
		<%--�b���ť�--%>
		<c:when test="${param.keyword==''}">
			�b������ť�
		</c:when>
		<c:otherwise>
			<script language="javascript">
			function checkdata() {
				var id = document.form.textfield0.value;
				var pass = document.form.textfield1.value;
				var email = document.form.textfield2.value;				
				if(id==""){
					alert("�b���@�w�n��I");
					return false;
				}
				else if(pass==""){
					alert("�K�X�@�w�n��I");
					return false;
				}
				else if(email==""){
					alert("�H�c�@�w�n��I");
					return false;
				}								
				else{
					return true;
				}			
			}
			</script>
			<sql:query sql="SELECT * FROM member where id = '${param.keyword}'" var="member" />	
			<c:choose>
				<c:when test="${member.rowCount=='0'}">
					�S���b�� ${param.id} ���򥻸��
				</c:when>
				
				<c:otherwise>
					�ק�򥻸��
				
					<c:forEach items="${member.rowsByIndex}" var="member_put" >
						<form name="form" method="post" action="edit_deal.jsp?id=${param.id}">
						  
  <p>�b���G 
    <input type="text" name="textfield0" value="${member_put[0]}">
						  </p>
						  
  <p> �K�X�G 
    <input type="text" name="textfield1" value="${member_put[1]}">
						  </p>
						  
  <p> �H�c�G 
    <input type="text" name="textfield2" value="${member_put[2]}">
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