<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<sql:query sql="SELECT distinct(isbn),bookinfo.name FROM record_book natural join bookinfo where id = '${param.id}' order by count_date desc limit 0,8" var="record_book" />
<sql:query sql="SELECT * FROM comment where id = '${param.id}' order by time desc" var="comment" />
<div align="center">
  <table width="100%" border="0" bgcolor="#3399CC">
    <tr>
      <td align="center"><p><font size="7" face="�з���">�o�O${param.id}��Blog</font></p>
        </td>
    </tr>
  </table>
  <p><font size="7" face="�з���"></font></p>
</div>


<p>&nbsp;</p>
<table width="100%" border="0">
  <tr>
    <td width="19%"><p>���b�ݪ���..</p>
      <p>&nbsp;</p>
      <p>�̪�ݹL����</p>
		<c:choose>
			<c:when test="${record_book.rowCount=='0'}">
				�d�L���
			</c:when>
		
			<c:otherwise>
				<c:forEach items="${record_book.rowsByIndex}" var="record_book_put">
					<a href="../detail.jsp?isbn=${record_book_put[0]}">${record_book_put[1]}</a><br>
				</c:forEach>
			</c:otherwise>
		</c:choose>	  

      <p>�̪���w����</p>
      <p>&nbsp;</p>
      <p>���~Top10�ѳ�</p>
      <p>�ץ�Top10�ѳ�</p>
      </td>
    <td width="57%">
	<c:choose>
		<c:when test="${comment.rowCount=='0'}">
			<p align="center">�L</p>
		</c:when>
	
		<c:otherwise>
			<table>			
			<c:forEach items="${comment.rowsByIndex}" var="comment_put">
			<tr>
				<td>
				<img src="../images/${comment_put[0]}.jpg">
				</td>
				<td>
					<img src="../comment/star/${comment_put[4]}.gif">�o��ɶ��G${comment_put[2]}
					<c:if test="${sessionScope.id==comment_put[1]}">
					<a href="detail_del.jsp?isbn=${comment_put[0]}">�R��</a>				
					</c:if>
					<br>
					<pre>${comment_put[3]}</pre>
					<br>
					<a href="../detail.jsp?isbn=${comment_put[0]}">�����s�����y����</a>
				</td>

					
			</tr>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>		
	
	</td>
    <td width="24%"><p>�D���(10)</p>
      <p>�D���N(5)</p>
      <p>�D�q��(20)</p>
      <p>�D���O(18)</p>
      <p>�D���(9)</p>
      </td>
  </tr>
</table>
<p>&nbsp;</p>
