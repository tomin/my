<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>


<sql:query sql="SELECT * FROM member order by id asc" var="result" />

�d�ߥ����|��<br><br>

�@�� ${result.rowCount} �����
<hr>

<table>
	<th>�b��</th><th>�K�X</th><th>�H�c</th>
	

    <c:forEach items="${result.rowsByIndex}" var="row" >
	<tr>	  
		  <td>${row[0]}</td>
		  <td>${row[1]}</td>
		  <td>${row[2]}</td>
	</tr>		  
    </c:forEach>		


</table>