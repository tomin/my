<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<script language="javascript">
function checkdata() {
   	var id = document.form.textfield0.value;
   	if(id==""){
   		alert("�Ǹ��@�w�n��I");
		return false;
	}			
	else{
		return true;
	}			
}
</script>
�s�W�򥻸��
<form name="form" method="post" action="add_deal.jsp">
  <p>�Ǹ��G
    <input type="text" name="textfield0">
(����)</p>
  <p>�t�šG
  
<sql:query sql="SELECT * FROM class order by class_id asc" var="result" />


<select name="select0">
<c:forEach items="${result.rowsByIndex}" var="row" >
<option value="${row[0]}">
	${row[0]}.${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]}
</option>
</c:forEach>
</select>	  
</p>
  <p>  �m�W�G
    <input type="text" name="textfield1">
  </p>
  <p>  �ʧO�G 
    <input name="sex" type="radio" value="�k" checked> 
    �k
    <input name="sex" type="radio" value="�k">
�k  </p>
  <p>  �����Ҧr���G 
    <input type="text" name="textfield2"> 
  </p>
  <p>  �X�ͤ���G 
    <select name="select1">
	  <c:forEach begin="1970" end="1999" var="year">
	  <option>${year}</option>
	  </c:forEach>
    </select> 
    �~
    <select name="select2">
	  <c:forEach begin="1" end="12" var="month">
	  <option>${month}</option>
	  </c:forEach>	  
    </select>
	��
	<select name="select3">
	  <c:forEach begin="1" end="31" var="day">
	  <option>${day}</option>
	  </c:forEach>  
	</select>
��  </p>
  <p>  �a�}�G 
    <input type="text" name="textfield3"> 
  </p>
  <p>  �q�ܡG 
    <input type="text" name="textfield4"> 
  </p>
  <p>  ����G 
    <input type="text" name="textfield5"> 
  </p>
  <p>  e-mail �G 
    <input type="text" name="textfield6">
  </p>
  <p>  �O�_����ǥ͡G 
    <input name="trans" type="radio" value="1"> 
    �O
    <input name="trans" type="radio" value="0" checked> 
  �_  </p>
  <p>    �N�Ǫ��A�G 
    <input name="studying" type="radio" value="�b��" checked>
    �b��
    <input name="studying" type="radio" value="���">
    ���
    <input name="studying" type="radio" value="���~">
    ���~
    <input name="studying" type="radio" value="�w�~">
  �w�~</p>
  <p>  ����p���H�m�W�G
    <input type="text" name="textfield9">
  </p>
  <p>  �P�p���H���Y�G
    <input type="text" name="textfield10">
  </p>
  <p>  �p���H�q�ܡG
    <input type="text" name="textfield11">
  </p>
  <p>  �p���H����G
    <input type="text" name="textfield12">
  </p>
  <p>
    <input type="submit" name="Submit" value="�e�X" onClick="return checkdata()"> 
  </p>
</form>