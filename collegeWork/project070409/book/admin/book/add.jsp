<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT * FROM typeno" var="typeno" />
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
�s�W���y��� 
<form name="form" method="post" action="add_deal.jsp">
  <p>�ѦW�G 
    <input type="text" name="textfield0">
  </p>
  <p> �@�̡G 
    <input type="text" name="textfield1">
  </p>
  <p> �X�����G 
    <input type="text" name="textfield2">
  </p>
  <p> �X������G 
    <input type="text" name="textfield3">
  </p>
  <p>ISBN �G 
    <input type="text" name="textfield4">
  </p>
  <p>���O�G
	<select name="textfield5">
	  <c:forEach items="${typeno.rowsByIndex}" var="typeno_put" >
	  <option value="${typeno_put[0]}">
			${typeno_put[0]}
	  </option>
	  </c:forEach>
	</select>
  </p>
  <p> �y���G 
    <select name="select">
      <option value="�c�餤��">�c�餤��</option>
      <option value="²�餤��">²�餤��</option>
    </select>
  </p>
  <p> 
    <input type="submit" name="Submit" value="�e�X" onClick="return checkdata()">
  </p>
  </form>