<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<table align="center">
  <tr>
    <td>
	  <p align="center">���`���Ӭd��-�п�ܥH�t�Ŭd�ߩξǸ��d�� </p>
      <sql:query sql="SELECT * FROM class order by class_id asc" var="result" />
      <form name="form" method="post" action="query_abnormal_deal.jsp">
        <p>�D�t�šG
            <select name="select0">
              <c:forEach items="${result.rowsByIndex}" var="row" >
              <option value="${row[0]}"> ${row[0]}.${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]} </option>
              </c:forEach>
            </select>
        </p>
        <p>�D�Ǹ��G
            <input type="text" name="textfield0">
        </p>
        <p align="center">
          <input type="submit" name="Submit" value="�d��">
        </p>
    </form>
	</td>
  </tr>
</table>
