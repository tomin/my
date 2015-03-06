<%@ include file="../check/session/treat.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<%--�B�v�s���O�_����J--%>
<c:choose>
	<%--�����J--%>
	<c:when test="${param.textfield1!=''}">
		<c:set value="${param.textfield1}" var="TR_ID"/>
	</c:when> 
	<%--�S����J--%>
	<c:otherwise>
		<sql:query sql="SELECT MAX(TR_ID) FROM TR" var="MAX" />
		<c:forEach items="${MAX.rowsByIndex}" var="MAX_put">
			<c:set value="${MAX_put[0]+1}" var="TR_ID"/>
		</c:forEach>
	</c:otherwise>
</c:choose>

<%--�s�W�B�v�O��--%>
<sql:update>
	INSERT INTO TR
	VALUES ( ? , ? , ? )  	
	<sql:param value="${TR_ID}" />
	<sql:param value="${param.textfield0}" />  
	<sql:param value="${param.select1}+${param.select2}+${param.select3}" />
</sql:update>

<%--Ū��add.jsp�ǹL�Ӫ��ˬd���G--%>
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
				<sql:param value="${TR_ID}" />
				<sql:param value="${param[item_id]}"/>
				<sql:param value="${param[before]}"/>
				<sql:param value="${param[after]}"/>
				<sql:param value="${param[finish]}"/>					
			</sql:update>					
		</c:if>
	</c:if>
</c:forEach>  

<sql:query sql="SELECT * FROM TR where TR_ID = ${TR_ID}" var="TR" />
<sql:query sql="SELECT * FROM TREAT where TR_ID = ${TR_ID}" var="TREAT" />
	

<div align="center">
	�s�W���\<br><br>
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
				<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td><td align="center">${item_put[3]}</td><td>${item_put[4]}</td>
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
