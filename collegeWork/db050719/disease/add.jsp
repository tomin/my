<%@ include file="../check/session/disease.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<script language="javascript">
function checkdata() {
   	var id = document.form.stu_id.value;
   	if(id==""){
   		alert("�Ǹ��@�w�n��I");
		return false;
	}			
	else{
		return true;
	}			
}
</script>

<%--�m���}�l--%>
<div align="center">
	�s�W�S��e�f�O��
	<form name="form" method="post" action="add_deal.jsp">
	  <p>�Ǹ��G
		<input type="text" name="stu_id">
	  </p>
	
	  <p> 
		<select name="select1">
		  <c:forEach begin="2005" end="2020" var="year">
		  <option value="${year}">${year}�~</option>
		  </c:forEach>
		</select> 
	
		<select name="select2">
		  <c:forEach begin="1" end="12" var="month">
		  <option value="${month}">${month}��</option>
		  </c:forEach>	  
		</select>
	
		<select name="select3">
		  <c:forEach begin="1" end="31" var="day">
		  <option value="${day}">${day}��</option>
		  </c:forEach>  
		</select>
		</p>
	  <sql:query sql="SELECT * FROM disease order by disease_id asc" var="disease" />
	<table>
		<tr>
			<th>�s��</th><th>�e�f�W��</th><th>�S��e�f����</th>
		</tr>
	<c:forEach items="${disease.rowsByIndex}" var="disease_put" >	
		<tr align="center">
			<td>${disease_put[0]}</td><td>${disease_put[1]}</td><td><input type="text" name="text${disease_put[0]}" size="50"></td>
		</tr>
	</c:forEach>  
	</table>
	<p>
	  <input type="submit" name="Submit" value="�e�X" onClick="return checkdata()">
	</p>
	</form>
</div>
<%--�m������--%>