<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>

<STYLE>
<!--
A:link {color:darkgoldenrod ;text-decoration:underline}
A:visited {color:orange ;text-decoration:underline}
A:hover {color:darkgoldenrod ;text-decoration:none}
-->
</STYLE>

<%--�d�߲ŦX���--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo limit 0,5
</sql:query>

<sql:query var="hot">
	SELECT * FROM bookinfo WHERE type = '�@�ɤ��' limit 0,6
</sql:query>

<sql:query var="score">
	SELECT * FROM bookinfo WHERE type = '�{���y��' limit 0,10
</sql:query>

<sql:query var="many">
	SELECT * FROM bookinfo WHERE type = '����g��' limit 0,6
</sql:query>



<table width="100%" border="0">
  <tr>
    <td valign="top">
		<table border="1" bgcolor="#CCFFCC" bordercolor="#FFFFFF">
			
          <th colspan="2"><font size="+2" face="�з���">�̷s�����y</font></th>
			<c:forEach items="${bookinfo.rowsByIndex}" var="row">
			<tr> 
			
			  <td><a href="detail.jsp?isbn=${row[4]}"><img src="images/${row[4]}.jpg" border="0"></a></td>
			  <td> �ѦW�G${row[0]}<br>
				�@�̡G${row[1]}<br>
				�X�����G${row[2]}<br>
				</td>
			</tr>
			</c:forEach>
		  </table>
    </td>
	
	
	<td align="right" valign="top">

		<table border="0" width="200">    
			
          <th><font size="+1" face="�з���">�I�\�v�̰������y</font></th>
			
			<c:forEach items="${hot.rowsByIndex}" var="hot_put"> 
			<tr>				
				<td>
					<a href="detail.jsp?isbn=${hot_put[4]}">${hot_put[0]}</a><br>											
				</td>
			</tr>
			</c:forEach>										
		</table>
		  
		<br><br><br>
		
		<table border="0" width="200">    
			
          <th><font size="+1" face="�з���">�����̰������y</font></th>
			
			<c:forEach items="${score.rowsByIndex}" var="score_put"> 
			<tr>				
				<td>
					<a href="detail.jsp?isbn=${score_put[4]}">${score_put[0]}</a><br>											
				</td>
			</tr>
			</c:forEach>										
		 </table>		
		
		<br><br>
		
		<table border="0" width="200">    
			
          <th><font size="+1" face="�з���">���׳̦h�����y</font></th>
			
			<c:forEach items="${many.rowsByIndex}" var="many_put"> 
			<tr>				
				<td>
					<a href="detail.jsp?isbn=${many_put[4]}">${many_put[0]}</a><br>											
				</td>
			</tr>
			</c:forEach>										
		 </table>		
		
		<br><br>

		
	</td>
  </tr>
</table>