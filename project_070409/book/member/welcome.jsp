<%@ include file="../check/session/member.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<sql:query sql="SELECT * FROM record natural join typeno WHERE id = '${sessionScope.id}' AND count = ANY ( SELECT max(count) from record where id = '${sessionScope.id}')" var="record"/>


<base target="main">
<div align="center"> 
  <table width="100%" border="0">
    <tr>
      
    <td width="25%">
		�w��${sessionScope.id}�n�J<br>
		<a href="../check/logout.jsp" target="_self">�����n�X</a>
	
	</td>
      <td width="50%" align="center">
	  
		<c:forEach items="${record.rowsByIndex}" var="record_put"> 
			<c:if test="${record_put[3]>='1' && record_put[3]<='11'}">
				<a href="../detail.jsp?isbn=9571341649"><img src="../personal/banner/advertise1.JPG" border="0"></a>
			</c:if>

			<c:if test="${record_put[3]>='12' && record_put[3]<='22'}">
				<a href="../detail.jsp?isbn=9861246606"><img src="../personal/banner/advertise2.JPG" border="0"></a>
			</c:if>

			<c:if test="${record_put[3]>='23' && record_put[3]<='33'}">
				<a href="../detail.jsp?isbn=9573257882"><img src="../personal/banner/advertise3.JPG" border="0"></a>
			</c:if>
			
			<c:if test="${record_put[3]>='34' && record_put[3]<='44'}">
				<a href="../detail.jsp?isbn=9867245784"><img src="../personal/banner/advertise4.JPG" border="0"></a>
			</c:if>
			
			<c:if test="${record_put[3]>='45' && record_put[3]<='55'}">
				<a href="../detail.jsp?isbn=986820593X"><img src="../personal/banner/advertise5.JPG" border="0"></a>
			</c:if>						
		
		</c:forEach>	  	
	  
	  </td>
      <td width="25%" align="right">
	  <a href="../personal/personal.jsp?id=${sessionScope.id}" target="_blank">�e���ӤH�ƭ���</a>
	  <br>
	  <a href="../blog/blog.jsp?id=${sessionScope.id}" target="_blank">�e�������歶��</a>
      </td>
    </tr>
  </table>
