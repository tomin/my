<%@ include file="../check/session/statistic.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>

<div align="center">
	<p>������R</p>
	<%--��J--%>
	<form name="form" method="post" action="nearsight.jsp">
		<sql:query sql="SELECT * FROM CLASS ORDER BY CLASS_ID ASC" var="result" />
		<p>�t�šG<select name="select"><c:forEach items="${result.rowsByIndex}" var="row" ><option value="${row[0]}">${row[0]}.${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]}</option></c:forEach></select></p>
		<p><input type="submit" name="Submit" value="�d��"></p>
	</form>

	<%--�d��--%>
	<c:if test="${!empty param.select}">
		<hr>
		<sql:query sql="SELECT * FROM CLASS WHERE CLASS_ID = ${param.select}" var="result" />
		<c:forEach items="${result.rowsByIndex}" var="row" >
			<p><u>${row[4]} ${row[1]} ${row[2]}�~�� ${row[3]}</u></p>
		</c:forEach>
		<sql:query sql="SELECT COUNT(*) FROM STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select}" var="total" />
		<c:forEach items="${total.rowsByIndex}" var="total_put" >
			<p>���Z�H�ơG<fmt:formatNumber value="${total_put[0]}" minIntegerDigits="2"/> �H</p>
		</c:forEach>
		
		<sql:query sql="SELECT COUNT(*) FROM HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select}" var="total" />
		<sql:query sql="SELECT COUNT(DISTINCT(HER.HER_ID)) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND ITEM_ID BETWEEN 5 AND 6 AND EXAM_RESULT < 0.6" var="total2" />
		<c:forEach items="${total.rowsByIndex}" var="total_put" >
			<p>���ˤH�ơG<fmt:formatNumber value="${total_put[0]}" minIntegerDigits="2"/> �H</p>
			<c:forEach items="${total2.rowsByIndex}" var="total2_put" >
				<p>����H�ơG<fmt:formatNumber value="${total2_put[0]}" minIntegerDigits="2"/> �H</p>
				<p>�����v</p>
				<h2><fmt:formatNumber value="${total2_put[0]/total_put[0]*100}" minFractionDigits="2" maxFractionDigits="2" /> %</h2>
			</c:forEach>
		</c:forEach>

		<table width="40%">
			<tr>
				<th>���饪��</th><th>����k��</th>
			</tr>
			<tr align="center">
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 5" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>�����������O�G<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>�����̰����O�G<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>�����̧C���O�G<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>�k���������O�G<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>�k���̰����O�G<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>�k���̧C���O�G<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>				
			</tr>

			<tr>
				<td>&nbsp;</td><td>&nbsp;</td>
			</tr>
			<tr>
				<th>���`����</th><th>���`�k��</th>
			</tr>			
			<tr align="center">
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 5 AND EXAM_RESULT >= 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>�����������O�G<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>�����̰����O�G<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>�����̧C���O�G<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
				<td>			
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 6 AND EXAM_RESULT >= 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>�k���������O�G<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>�k���̰����O�G<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>�k���̧C���O�G<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>				
			</tr>

			<tr>
				<td>&nbsp;</td><td>&nbsp;</td>
			</tr>
			<tr>
				<th>�������</th><th>����k��</th>
			</tr>			
			<tr align="center">
				<td>
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 5 AND EXAM_RESULT < 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>�����������O�G<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>�����̰����O�G<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>�����̧C���O�G<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
				<td>
					<sql:query sql="SELECT AVG(EXAM_RESULT),MAX(EXAM_RESULT),MIN(EXAM_RESULT) FROM EXAM NATURAL JOIN HER NATURAL JOIN STUDENT NATURAL JOIN CLASS WHERE CLASS.CLASS_ID = ${param.select} AND EXAM.ITEM_ID = 6 AND EXAM_RESULT < 0.6" var="total" />
					<c:forEach items="${total.rowsByIndex}" var="total_put" >
						<p>�k���������O�G<fmt:formatNumber value="${total_put[0]}" minFractionDigits="2" maxFractionDigits="2"/></p>
						<p>�k���̰����O�G<fmt:formatNumber value="${total_put[1]}" minFractionDigits="2"/></p>
						<p>�k���̧C���O�G<fmt:formatNumber value="${total_put[2]}" minFractionDigits="2"/></p>						
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:if>
</div>