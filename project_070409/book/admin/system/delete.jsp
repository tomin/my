<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<p>�R�����</p>
	<hr>			
	<%--��J--%>
    <c:if test="${param.select==null}">
		<form name="form1" method="post" action="">
    <p> ISBN: 
      <input type="text" name="textfield0">
      <select name="select">
        <option value="0">�R�����������</option>
        <option value="1">�u�O�d�򥻸��</option>
        <option value="2">�u�R���|�����</option>
        <option value="3">�u�R���S����</option>
      </select>
    </p>
			<p><input type="submit" name="Submit" value="�T�w�R��"></p>
		</form>
	</c:if>
	
    <c:if test="${param.select!=null}">
	
		<%--ISBN--%>
		<c:if test="${param.textfield0==''}">
			ISBN���i�ť�
		</c:if>
		
		<c:if test="${param.textfield0!=''}">
			<%@ include file="../include/mysql.jsp" %>
			<%--�R�����y--%>
			<c:if test="${param.select!='4'}">
				<sql:update sql="delete from bookinfo where ISBN = '${param.textfield0}' "/>
				<p><u>���y ${param.textfield0} �R�����\</u></p>
			</c:if>
		</c:if>	 	
	</c:if>	 			
</div>