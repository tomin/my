<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%-- �B�z�ɮ׿�J��X��import--%>
<%@ page import="java.io.*" %>
<%-- �B�z�ɶ��n�Ϊ�import --%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<p>��Ƴƥ�</p>	
	<c:if test="${empty param.backup}">
		<p>&nbsp;</p>
		<form name="form1" method="post" action="backup.jsp?backup=true">
		  <p>�п�ܱ��ƥ�������</p>
		  <p><input type="checkbox" name="checkbox1" value="checkbox">�򥻸��</p>
		  <p><input type="checkbox" name="checkbox2" value="checkbox">���˸��</p>
		  <p><input type="checkbox" name="checkbox3" value="checkbox">�B�v�O��</p>
		  <p><input type="checkbox" name="checkbox4" value="checkbox">�S��e�f</p>
		  <p><input type="submit" name="Submit" value="�e�X"></p>
		</form>
		<p>&nbsp;</p>
		<p><a href="backup.jsp?backup=all">���������ƥ��������</a></p>
	</c:if>
	
	<%--�ƥ��}�l--%>	
	<c:if test="${!empty param.backup}">
		<hr>
		<%@ include file="../include/mysql.jsp" %>
		<%--�]�w���D--%>
		<c:set value="-- <br>-- ��߬F�v�j�ǰ��d����<br>--  <br>" var="data"/>
		
		<%--�򥻸��--%>
		<c:if test="${!empty param.checkbox1 || param.backup=='all'}">
			<c:set value="${data}<br><br>-- <br>-- Table Student<br>--  <br>" var="data"/>
			<sql:query sql="SELECT * FROM STUDENT" var="student" />
			<c:forEach items="${student.rowsByIndex}" var="student_put">
				<c:set value="${data}<br>INSERT INTO STUDENT VALUES ( ${student_put[0]},${student_put[1]}," var="data"/>
				<c:forEach begin="2" end="14" var="item">
					<c:set value="${data}'${student_put[item]}'," var="data"/>
				</c:forEach>
				<c:set value="${data}'${student_put[15]}' );" var="data"/>
			</c:forEach>
			<p>�򥻸�Ƥw�ƥ�</p>
		</c:if>
		
		<%--���˸��--%>
		<c:if test="${!empty param.checkbox2 || param.backup=='all'}">
		
			<c:set value="${data}<br><br>-- <br>-- Table HER<br>--  <br>" var="data"/>
			<sql:query sql="SELECT * FROM HER" var="HER" />
			<c:forEach items="${HER.rowsByIndex}" var="HER_put">
				<c:set value="${data}<br>INSERT INTO HER VALUES ( ${HER_put[0]}, '${HER_put[1]}', '${HER_put[2]}' );" var="data"/>
			</c:forEach>
			
			<c:set value="${data}<br><br>-- <br>-- Table Exam<br>--  <br>" var="data"/>
			<sql:query sql="SELECT * FROM EXAM" var="EXAM" />
			<c:forEach items="${EXAM.rowsByIndex}" var="EXAM_put">
				<c:set value="${data}<br>INSERT INTO EXAM VALUES ( ${EXAM_put[0]}, ${EXAM_put[1]}, '${EXAM_put[2]}', ${EXAM_put[3]} );" var="data"/>
			</c:forEach>			
			<p>���˸�Ƥw�ƥ�</p>
		</c:if>
		
		<%--�B�v�O��--%>
		<c:if test="${!empty param.checkbox3 || param.backup=='all'}">
		
			<c:set value="${data}<br><br>-- <br>-- Table TR<br>--  <br>" var="data"/>
			<sql:query sql="SELECT * FROM TR" var="TR" />
			<c:forEach items="${TR.rowsByIndex}" var="TR_put">
				<c:set value="${data}<br>INSERT INTO TR VALUES ( ${TR_put[0]}, ${TR_put[1]}, '${TR_put[2]}' );" var="data"/>
			</c:forEach>
			
			<c:set value="${data}<br><br>-- <br>-- Table Treat<br>--  <br>" var="data"/>
			<sql:query sql="SELECT * FROM TREAT" var="TREAT" />
			<c:forEach items="${TREAT.rowsByIndex}" var="TREAT_put">
				<c:set value="${data}<br>INSERT INTO TREAT VALUES ( ${TREAT_put[0]}, ${TREAT_put[1]}, '${TREAT_put[2]}', '${TREAT_put[3]}', ${TREAT_put[4]} );" var="data"/>
			</c:forEach>			
			<p>�B�v�O���w�ƥ�</p>
		</c:if>

		<%--�S��e�f--%>
		<c:if test="${!empty param.checkbox4 || param.backup=='all'}">			
			<c:set value="${data}<br><br>-- <br>-- Table Register<br>--  <br>" var="data"/>
			<sql:query sql="SELECT * FROM REGISTER" var="REGISTER" />
			<c:forEach items="${REGISTER.rowsByIndex}" var="REGISTER_put">
				<c:set value="${data}<br>INSERT INTO REGISTER VALUES ( ${REGISTER_put[0]}, ${REGISTER_put[1]}, '${REGISTER_put[2]}', '${REGISTER_put[3]}' );" var="data"/>
			</c:forEach>			
			<p>�S��e�f�w�ƥ�</p>
		</c:if>										
		<%
			//���o�ɶ�
			Date cdate = new Date();
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyyMMdd-HHmmss",Locale.US);
			String time=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
			pageContext.setAttribute("time", time);	
					
			String path=request.getRealPath(".");	
			path = path+"\\backup\\hems-"+time+".sql";
			FileWriter fw= new FileWriter(path);
		
			String data = (String)pageContext.getAttribute("data");
			data = data.replaceAll("<br>","\n");
			fw.write(data);
			fw.close();			
		%>
		<p>�ƥ�����</p>
		<p>&nbsp;</p>
		<p><a href="../backup/hems-${time}.sql">�����U�� hems-${time}.sql �ƥ����</a></p>

	</c:if>
	<%--�ƥ�����--%>
</div>


