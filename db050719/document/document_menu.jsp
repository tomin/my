<%@ include file="../check/session/user.jsp" %>
<%@ include file="../include/head.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<base target="main">
<div align="center">
	<c:if test="${sessionScope.rank==1}">
		�D<a href="student.jsp">�ǥͰ򥻸��</a>
	</c:if>
	<c:if test="${sessionScope.rank==2}">
		�D<a href="exam.jsp">���˸�ƺ޲z</a>
		�D<a href="disease.jsp">�S��e�f�O��</a>
		�D<a href="statistic.jsp">�έp���R</a>
	</c:if>	
	<c:if test="${sessionScope.rank==3}">	
		�D<a href="treat.jsp">�B�v�O���޲z</a>
	</c:if>	
	<c:if test="${sessionScope.rank==4}">
		�D<a href="exam.jsp">���˸�ƺ޲z</a>	
		�D<a href="disease.jsp">�S��e�f�O��</a>
	</c:if>	
	<c:if test="${sessionScope.rank==5}">
		�D<a href="exam.jsp">���˸�ƺ޲z</a>	
		�D<a href="statistic.jsp">�έp���R</a>
	</c:if>	
	<c:if test="${sessionScope.rank==9}">
		�D<a href="student.jsp">�ǥͰ򥻸��</a>
		�D<a href="exam.jsp">���˸�ƺ޲z</a>
		�D<a href="treat.jsp">�B�v�O���޲z</a>
		�D<a href="disease.jsp">�S��e�f�O��</a>
		�D<a href="statistic.jsp">�έp���R</a>
		�D<a href="system.jsp">�t�Χ@�~</a>
	</c:if>
		�D<a href="team.jsp">�}�o�ζ�</a>
</div>