<%@ include file="../check/session/system.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<div align="center">
	<p>����٭�</p>
	<%--��J--%>
	<c:if test="${empty param.recover}">
		<p>&nbsp;</p>
		<form name="form1" method="post" action="?recover=true">
		  <p>�п�ܱ��٭쪺����</p>
		  <p><input type="checkbox" name="checkbox1" value="checkbox">�򥻸��</p>
		  <p><input type="checkbox" name="checkbox2" value="checkbox">���˸��</p>
		  <p><input type="checkbox" name="checkbox3" value="checkbox">�B�v�O��</p>
		  <p><input type="checkbox" name="checkbox4" value="checkbox">�S��e�f</p>
		  <p>�бN�ƥ����ɮץ���A�ƻs��U����줺�C</p>
		  <p><textarea name="textarea" cols="90" rows="10"></textarea></p>
		  <p>
		  	<select name="file">
				<option value="">�άO��ܱ��٭쪺�ɮצW��</option>
				<%
					Vector vDirList = new Vector();
					String path=request.getRealPath("\\");
					File dir = new File(path+"\\backup"); 
					String sDirList[] = dir.list();
					if (sDirList.length >0){
						for (int i =0; i < sDirList.length; i++){
							vDirList.add(sDirList[i]);
						}
					}
		
					for(int i=0; i<vDirList.size(); i++) {
						String sFileName = (String)vDirList.get(i);
						out.print("<option>"+sFileName+"</option>");
					}   			
				%>				
			</select>
		  </p>		  
		  <p><b>�`�N�G�٭�ʧ@�L�k�_��A��ĳ�ƥ��ثe����ơC</b></p>
		  <p><input type="submit" name="Submit" value="�T�w�٭�"></p>
		</form>
	</c:if>

	<%--�B�z�}�l--%>	
	<c:if test="${!empty param.recover}">
		<hr>
		<%
			if(!request.getParameter("file").equals("")){
				String path=request.getRealPath("\\");
				FileReader fr=new FileReader(path+"\\backup\\"+request.getParameter("file"));    
				BufferedReader br= new BufferedReader(fr);
				String text="";
				String Line="";
				while( (Line=br.readLine())!=null){	
					text = text + Line;
				}
				text = text.replaceAll("--  ",";");
				pageContext.setAttribute("textarea",text);
			}
		%>
		<%--���M�ɮ׵��X--%>
		<c:set value="${param.textarea}${textarea}" var="textarea"/>
		<%--�٭�}�l--%>
		<c:if test="${!empty textarea}"> 
			<sql:transaction>
				<%--�򥻸��--%>
				<c:if test="${!empty param.checkbox1}">				
					<sql:update sql="DELETE FROM STUDENT"/>
					<p>�򥻸���٭줤</p>
				</c:if>
				
				<%--���˸��--%>
				<c:if test="${!empty param.checkbox2}">
					<sql:update sql="DELETE FROM HER"/>
					<sql:update sql="DELETE FROM EXAM"/>				
					<p>���˸���٭줤</p>
				</c:if>
				
				<%--�B�v�O��--%>
				<c:if test="${!empty param.checkbox3}">			
					<sql:update sql="DELETE FROM TR"/>
					<sql:update sql="DELETE FROM TREAT"/>				
					<p>�B�v�O���٭줤</p>
				</c:if>
		
				<%--�S��e�f--%>
				<c:if test="${!empty param.checkbox4}">			
					<sql:update sql="DELETE FROM REGISTER"/>
					<p>�S��e�f�٭줤</p>
				</c:if>
				
				<c:forTokens items="${textarea}" delims=";" var="text">
					<sql:update sql="${text}"/>
				</c:forTokens>
				<p>�٭짹��</p>
			</sql:transaction>
		</c:if>
		<%--�٭쵲��--%>			
	</c:if>
	<%--�B�z����--%>
</div>



