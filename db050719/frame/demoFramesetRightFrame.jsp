<%@ include file="../check/session/user.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<sql:query sql="SELECT * FROM BBS ORDER BY ID DESC" var="bbs" />
<table width="100%" border="0">
  <tr>
     <td colspan="4">�T����</td>
  </tr>
  <tr>
     <td width="11%">���</td>
     <td width="*" colspan="3">�ƶ�</td>
  </tr>
  <c:forEach items="${bbs.rowsByIndex}" var="bbs_put" >	
  <tr>
  	 <td>${bbs_put[1]}</td>
  	 <td>${bbs_put[2]}</td>
	 <c:if test="${sessionScope.rank==9}">
		 <td width="5%"><a href="../BBS?edit_id=${bbs_put[0]}&word=${bbs_put[2]}">�ק�</a></td>
		 <td width="5%"><a href="../BBS?del_id=${bbs_put[0]}">�R��</a></td>	 
	 </c:if>
  </tr>
  </c:forEach>
</table>

<c:if test="${sessionScope.rank==9}">
	<br>
	<form name="form1" method="get" action="../BBS">
	���s�W�ƶ��G<input name="textfield" type="text" size="85"><input type="submit" name="Submit" value="�e�X"> <a href="../system/bbs.jpg" target="_blank">����</a>
	</form>	
</c:if>


