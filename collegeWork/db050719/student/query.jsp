<%@ include file="../check/session/student.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
�d�߰򥻸�� -�п�ܥH�t�Ŭd�ߩξǸ��d��
<form name="form" method="post" action="query_deal.jsp">
  <p>�D�t�šG
  
    <sql:query sql="SELECT * FROM class order by class_id asc" var="result" />

    <select name="class_id">
      <c:forEach items="${result.rowsByIndex}" var="row" >
      <option value="${row[0]}">
	  ${row[0]}.${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]}
      </option>
      </c:forEach>
        </select>	
  </p>
  <p>�D�Ǹ��G
    <input type="text" name="textfield0">
  </p>
  <p>    <input type="submit" name="Submit" value="�d��"> 
  </p>
</form>