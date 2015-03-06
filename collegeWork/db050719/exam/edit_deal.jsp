<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�ק�--%>
<c:if test="${param.sort==null}">
	<%--��s���˰O��--%>
	<sql:update>
	  UPDATE HER
	  SET  HER_ID = ? , Stu_ID = ? , Exam_Date = ? 
	  WHERE stu_id = ${param.textfield0}
	  <sql:param value="${param.textfield}" />  
	  <sql:param value="${param.textfield0}" />
	  <sql:param value="${param.textfield1}" />
	</sql:update>
	
	<%--�ӦW�ǥͪ��ˬd�O�������R��--%>
	<sql:update>
		DELETE FROM EXAM WHERE HER_ID = ${param.textfield}
	</sql:update>
	<%--�s�W�ˬd�O��--%>
	<c:forEach begin="1" end="42" var="item" varStatus="s">
		<% 
			int i = ((Integer) pageContext.getAttribute("item")).intValue();
			pageContext.setAttribute("textStr", "text"+i);
			pageContext.setAttribute("selectStr", "select"+i); 
		%>
		<%--�p�G���ˬd--%>
		<c:if test="${param[textStr]!=null}">
			<c:if test="${param[textStr]!=''}">
				<sql:update>
					INSERT INTO EXAM
					VALUES ( ? , ? , ? , ? )
					<sql:param value="${param.textfield}"/>		 
					<sql:param value="${item}"/>
					<sql:param value="${param[textStr]}"/>
					<sql:param value="${param[selectStr]}"/>          
				</sql:update>					
			</c:if>
		</c:if>
	</c:forEach>  
</c:if>

<sql:query sql="SELECT * FROM HER where Stu_ID = ${param.textfield0}" var="HER" />

<%--�ƧǻP�_--%>
<c:choose>
	<%--�Ƨ�--%>
	<c:when test="${param.sort!=null}">
		<sql:query sql="SELECT * FROM exam where HER_ID = ${param.textfield} order by ${param.sort} asc" var="exam" />
	</c:when>
	
	<%--���Ƨ�--%>
	<c:otherwise>
		<sql:query sql="SELECT * FROM exam where HER_ID = ${param.textfield}" var="exam" />
	</c:otherwise>
</c:choose>
	
�ק令�\<br><br>
���˸�Ƴ��i��
<hr>
<c:forEach items="${HER.rowsByIndex}" var="HER_put">
	���˰O���s���G${HER_put[0]}<br>
	�Ǹ��G${HER_put[1]}<br>	
	�ˬd����G${HER_put[2]}	
</c:forEach>

<c:if test="${exam.rowCount!='0'}">
	<table>
		<tr>
			<th><a href="edit_deal.jsp?textfield0=${param.textfield0}&textfield=${param.textfield}&sort=2">�s��</a></th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th><a href="edit_deal.jsp?textfield0=${param.textfield0}&textfield=${param.textfield}&sort=3">�ˬd���G</a></th><th><a href="edit_deal.jsp?textfield0=${param.textfield0}&textfield=${param.textfield}&sort=4">�O�_���`</a></th>
		</tr>
		<c:forEach items="${exam.rowsByIndex}" var="exam_put">
		<sql:query sql="SELECT * FROM item where item_id = ${exam_put[1]}" var="item" />
			<tr>
				<c:forEach items="${item.rowsByIndex}" var="item_put">
					<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td align="center">${item_put[3]}</td><td>${item_put[4]}</td>
				</c:forEach>		
				<td>${exam_put[2]}</td>
				<td align="center">
					<c:choose>
						<c:when test="${exam_put[3]=='1'}">���`</c:when>
						<c:otherwise><font color="red">���`</font></c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>  
	</table>
</c:if>   
