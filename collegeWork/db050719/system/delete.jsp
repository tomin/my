<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<div align="center">
	<p>�R�����</p>
	<hr>			
	<%--��J--%>
    <c:if test="${param.radiobutton==null}">
		<form name="form1" method="post" action="">			
			<p>
				<input name="radiobutton" type="radio" value="id" checked>�Ǹ��G<input type="text" name="textfield0" size="15">
				<select name="select">
					<option value="0">�R�����������</option>
					<option value="1">�u�O�d�򥻸��</option>
					<option value="2">�u�R���B�v���</option>
					<option value="3">�u�R���S��e�f</option>
				</select>
			</p>
			<p><input name="radiobutton" type="radio" value="year">�R���Ҧ�<input type="text" name="textfield1" size="5">�Ǧ~�פJ�Ǫ��ǥ͸��</p>
			<p>&nbsp;</p>
			<p><input type="submit" name="Submit" value="�T�w�R��"></p>
		</form>
	</c:if>
	
	<%--�Ǹ�--%>
	<c:if test="${param.radiobutton=='id'}">		
		<c:if test="${param.textfield0==''}">
			�Ǹ����i�ť�
		</c:if>
		
		<c:if test="${param.textfield0!=''}">
			<%@ include file="../include/mysql.jsp" %>
			<%--�R���S��e�f--%>
			<c:if test="${param.select!='2'}">
				<sql:update sql="delete from register where her_id = any ( select her_id from her where stu_id = ${param.textfield0} )"/>
				<p>�S��e�f�O���w�R��</p>
			</c:if>
			<%--�R���B�v�O��--%>			
			<c:if test="${param.select<='2'}">
				<sql:update sql="delete from treat where tr_id = any ( select tr_id from tr where stu_id = ${param.textfield0} )"/>
				<sql:update sql="delete from tr where stu_id = ${param.textfield0}"/>
				<p>�B�v�O���w�R��</p>
			</c:if>
			<%--�R�����˰O��--%>			
			<c:if test="${param.select<='1'}">
				<sql:update sql="delete from exam where her_id = any ( select her_id from her where stu_id = ${param.textfield0} )"/>
				<sql:update sql="delete from her where stu_id = ${param.textfield0}"/>
				<p>���˰O���w�R��</p>
			</c:if>
			<%--�R���򥻸��--%>						
			<c:if test="${param.select=='0'}">
				<sql:update sql="delete from student where stu_id = ${param.textfield0}"/>
				<p>�ǥͰ򥻸�Ƥw�R��</p>
			</c:if>			
			<p><u>�Ǹ� ${param.textfield0} �R�����\</u></p>
		</c:if>	
	</c:if>	
	  
	<%--�~��--%>
	<c:if test="${param.radiobutton=='year'}">
		<c:if test="${param.textfield1==''}">
			�Ǧ~�פ��i�ť�
		</c:if>
		<c:if test="${param.textfield1!=''}">
			<%@ include file="../include/mysql.jsp" %>	
			<%--�R���S��e�f--%>
			<sql:update sql="delete from register where her_id = any ( select her_id from her where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000} )"/>
			<p>�S��e�f�O���w�R��</p>			
			<%--�R���B�v�O��--%>
			<sql:update sql="delete from treat where tr_id = any ( select tr_id from tr where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000} )"/>
			<sql:update sql="delete from tr where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000}"/>
			<p>�B�v�O���w�R��</p>
			<%--�R�����˰O��--%>
			<sql:update sql="delete from exam where her_id = any ( select her_id from her where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000} )"/>
			<sql:update sql="delete from her where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000}"/>
			<p>���˰O���w�R��</p>
			<%--�R���򥻸��--%>	
			<sql:update sql="delete from student where stu_id between ${param.textfield1*1000000} and ${(param.textfield1+1)*1000000}"/>
			<p>�ǥͰ򥻸�Ƥw�R��</p>	
			<p><u>${param.textfield1} �Ǧ~�קR�����\</u></p>						
		</c:if>		
	</c:if>
	
</div>