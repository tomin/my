<%@ include file="../check/session/book.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

�d�߰򥻸��
<form name="form" method="post" action="query_deal.jsp">
  <p>�D 
    <select name="select">
      <option value="name">�ѦW</option>
      <option value="author">�@��</option>
      <option value="publisher">�X����</option>
      <option value="date">�X�����</option>
      <option value="type">����</option>
      <option value="ISBN">ISBN</option>
    </select>
    <input type="text" name="textfield0">
    <input type="submit" name="Submit" value="�d��">
  </p>
  </form>