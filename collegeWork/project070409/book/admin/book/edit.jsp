<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<c:if test="${param.keyword==null}">
	<p>�ק�򥻸��</p>
	<form name="form" method="post" action="edit.jsp">
  <p>ISBN: 
    <input type="text" name="keyword">
  </p>
  <p> 
    <input type="submit" name="Submit" value="�ק�">

  </p>
</form>
</c:if>
<c:if test="${param.keyword!=null}">
	<c:choose>
		<%--�Ǹ��ť�--%>
		<c:when test="${param.keyword==''}">
			ISBN����ť�
		</c:when>
		<c:otherwise>
			<script language="javascript">
			function checkdata() {
				var id = document.form.textfield0.value;
				var isbn = document.form.textfield4.value;
				if(id==""){
					alert("�ѦW�@�w�n��I");
					return false;
				}
				else if(isbn==""){
					alert("ISBN�@�w�n��I");
					return false;
				}				
				else{
					return true;
				}			
			}
			</script>
			<sql:query sql="SELECT * FROM bookinfo where ISBN = '${param.keyword}'" var="bookinfo" />	
			<c:choose>
				<c:when test="${bookinfo.rowCount=='0'}">
					�S��ISBN ${param.id} ���򥻸��
				</c:when>
				
				<c:otherwise>
					�ק�򥻸��
				
					<c:forEach items="${bookinfo.rowsByIndex}" var="bookinfo_put" >
						<form name="form" method="post" action="edit_deal.jsp">
						  <p>�ѦW�G 
							<input type="text" name="textfield0" value="${bookinfo_put[0]}">
						  </p>
						  <p> �@�̡G 
							<input type="text" name="textfield1" value="${bookinfo_put[1]}">
						  </p>
						  <p> �X�����G 
							<input type="text" name="textfield2" value="${bookinfo_put[2]}">
						  </p>
						  <p> �X������G 
							<input type="text" name="textfield3" value="${bookinfo_put[3]}">
						  </p>
						  <p>ISBN �G 
							<input type="text" name="textfield4" value="${bookinfo_put[4]}">
						  </p>
						  <p>���O�G 
							<input type="text" name="textfield5" value="${bookinfo_put[5]}">
						  </p>
						  <p> �y���G 
							<input type="text" name="textfield6" value="${bookinfo_put[6]}">
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