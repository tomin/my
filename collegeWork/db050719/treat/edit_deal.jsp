<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�ק��B�v���--%>
<sql:update>
	UPDATE TR SET TREAT_DATE = '${param.textfield2}' WHERE TR_ID= ${param.textfield1}
</sql:update>

<%--�R���B�v�O��--%>
<sql:update>
	DELETE FROM TREAT WHERE TR_ID = ${param.textfield1}
</sql:update>

<%--Ū��edit.jsp�ǹL�Ӫ��ˬd���G--%>
<c:forEach begin="1" end="${param.num}" var="item" varStatus="s">
	<% 
		int i = ((Integer) pageContext.getAttribute("item")).intValue();
		pageContext.setAttribute("item_id", "item_id"+i);
		pageContext.setAttribute("before", "before"+i);
		pageContext.setAttribute("after", "after"+i);	
		pageContext.setAttribute("finish", "finish"+i);				
	%>
	<%--�p�G���ˬd--%>
	<c:if test="${param[before]!=''}">
		<c:if test="${param[after]!=''}">
			<sql:update>
				INSERT INTO TREAT
				VALUES ( ? , ? , ? , ? , ?)
				<sql:param value="${param.textfield1}" />
				<sql:param value="${param[item_id]}"/>
				<sql:param value="${param[before]}"/>
				<sql:param value="${param[after]}"/>
				<sql:param value="${param[finish]}"/>					
			</sql:update>					
		</c:if>
	</c:if>
</c:forEach>  

<sql:query sql="SELECT * FROM TR where TR_ID = ${param.textfield1}" var="TR" />
<sql:query sql="SELECT * FROM TREAT where TR_ID = ${param.textfield1}" var="TREAT" />
	

<div align="center">
	�ק令�\<br><br>
	�B�v�O�����i��
	<hr>
	<c:forEach items="${TR.rowsByIndex}" var="TR_put">
		<table align="center">
			<tr>
				<td>
					�Ǹ��G${TR_put[1]}<br>
					�s���G${TR_put[0]}<br>
					����G${TR_put[2]}<br>
				</td>
			</tr>
		</table>
	</c:forEach>	
</div>

<%--�p�G���B�v--%>
<c:if test="${TREAT.rowCount!='0'}">
	<p align="center">�B�v����</p>
	<table align="center" width="100%">
		<tr>
			<th>�s��</th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th>���B�v���p</th><th>�B�v���p</th><th>����</th>
		</tr>
		<c:forEach items="${TREAT.rowsByIndex}" var="TREAT_put">
		<sql:query sql="SELECT * FROM item where item_id = ${TREAT_put[1]}" var="item" />
		<tr align="center">
			<c:forEach items="${item.rowsByIndex}" var="item_put">
				<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td>${item_put[3]}</td><td>${item_put[4]}</td>
			</c:forEach>		
			<td>${TREAT_put[2]}</td>
			<td>${TREAT_put[3]}</td>
			<td>
				<c:choose>
					<c:when test="${TREAT_put[4]=='true'}">�O</c:when>
					<c:otherwise><font color="red">�_</font></c:otherwise>
				</c:choose>			
			</td>
		</tr>
		</c:forEach>  
	</table>
</c:if>   
