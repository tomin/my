<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<base target="_top">
<script language="javascript">
function setfocus(){
        document.form.textfield.focus();
        return;
}
</script>

<body onLoad="setfocus()">

<form name="form" method="get" action="../chat">   
  <input name="name" type="hidden" value="${sessionScope.name}">
  ${sessionScope.name} ���N���G 
  <input name="textfield" type="text" size="105">
  <input type="submit" name="Submit" value="�e�X">
  <a href="rename.jsp">��W</a>
  <a href="chat_logout.jsp">�n�X</a> 
</form>	

