<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<script language="javascript">
function checkdata2() {
	var radio="";
    for(i=0; i<form2.radiobutton.length; i++){
      if(form2.radiobutton[i].checked){
        radio = form2.radiobutton[i].value;
        break;
      }
    }
   	var a = document.form2.id2.value;
   	var b = document.form2.password2.value;

   	if(radio==""){
   		alert("�@�w�n���֨��I");		
	}
	else if(a.length>15)
   		alert("�b���Ӫ��o�I");
	else if(b.length>15)
   		alert("�K�X�Ӫ��o�I");				
	else{
		return true;
	}
	return false;	
}
</script>

<script language="javascript">
function checkdata() {
   	var a = document.form.id.value;
   	var b = document.form.password.value;
   	if(a=="" || b==""){
   		alert("�b���M�K�X�@�w�n��I");
	}
	else if(a.length>15)
   		alert("�b���Ӫ��o�I");
	else if(b.length>15)
   		alert("�K�X�Ӫ��o�I");				
	else{
		return true;
	}
	return false;			
}
</script>
<sql:query sql="SELECT * FROM user" var="user" />
<form name="form2" method="get" action="../user">
<table width="100%">
  <tr>
     <td colspan="6">�ϥΪ̤αK�X�]�w</td>
  </tr>
  <tr>
  	 <td>�֨�</td>
     <td>�ϥΪ�</td>
     <td>�K�X</td>
	 <td>����</td>	 
     <td colspan="2">�v��</td>
  </tr>
  <c:forEach items="${user.rowsByIndex}" var="user_put" >	
  <tr>
	 <td><input name="radiobutton" type="radio" value="${user_put[0]}"></td>  	
  	 <td>${user_put[0]}</td>
  	 <td>${user_put[1]}</td>
	 <c:if test="${user_put[2]==0}">
	 	<td><b>����</b></td>
		<td>�L</td>
		</strike>
	 </c:if>	 
	 <c:if test="${user_put[2]==1}">
	 	<td>�򥻸�ƺ޲z��</td>
		<td>�ǥͰ򥻸��</td>
	 </c:if>
	 <c:if test="${user_put[2]==2}">
	 	<td>�޲z�B���R���˸�ƤH��</td>
		<td>���E��ƺ޲z�B�S��e�f�O���B�έp���R</td>
	 </c:if>
	 <c:if test="${user_put[2]==3}">
	 	<td>�޲z�B�v�H��</td>
		<td>�B�v�O���޲z</td>
	 </c:if>
	 <c:if test="${user_put[2]==4}">
	 	<td>�޲z���˸�ƤH��</td>
		<td>���E��ƺ޲z�B�S��e�f�O��</td>
	 </c:if>
	 <c:if test="${user_put[2]==5}">
	 	<td>���R���˸�ƤH��</td>
		<td>���E��ƺ޲z�B�έp���R</td>
	 </c:if>
	 <c:if test="${user_put[2]==9}">
	 	<td>���ű��v�H���]���@�x���t�ΤH���^</td>
		<td>�Ҧ��v��</td>
	 </c:if>	 	 	 	 
	 	 	 
	 <c:if test="${user_put[0]!='admin'}">
		<td width="5%"><a href="../user?del=${user_put[0]}">�R��</a></td>	 
	 </c:if>

  </tr>
  </c:forEach>
</table>
	<br>
  �ק�ϥΪ�:
    <select name="select2">
      <option value="1">�򥻸�ƺ޲z��</option>
      <option value="2">�޲z�B���R���˸�ƤH��</option>
      <option value="3">�޲z�B�v�H��</option>
      <option value="4">�޲z���˸�ƤH��</option>
      <option value="5">���R���˸�ƤH��</option>
      <option value="9">���ű��v�H��</option>
	  <option value="0">����</option>
    </select>
  �ܧ�b��:
  <input type="text" name="id2">
  �ܧ�K�X:
  <input type="password" name="password2">
  <input type="submit" name="Submit2" value="�ק�" onClick="return checkdata2()">
</form>

<form name="form" method="get" action="../user">
	�s�W�ϥΪ�:
	  <select name="select">
	    <option value="1">�򥻸�ƺ޲z��</option>
		<option value="2">�޲z�B���R���˸�ƤH��</option>
		<option value="3">�޲z�B�v�H��</option>
		<option value="4">�޲z���˸�ƤH��</option>
		<option value="5">���R���˸�ƤH��</option>
		<option value="9">���ű��v�H��</option>												
      </select>
	 �]�w�b��:
	 <input type="text" name="id">
	 �]�w�K�X:
	 <input type="password" name="password">	 
	 <input type="submit" name="Submit" value="�s�W" onClick="return checkdata()">
</form>