<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/mysql.jsp" %>

<%
//�o��t��A������URL
String vendorA = request.getHeader("referer");
//���Xhostname�A�Ҧp: http://www.idealist.idv.tw/index.jsp�A�o��host�N�o�� www.idealist.idv.tw
int end = vendorA.indexOf("/", 7);
String host = vendorA.substring(0, end);
pageContext.setAttribute("dns",host);
%>

<%--Check if the source is correct
<c:if test="${dns!='http://npc.twbbs.org'}">
   wrong
</c:if>
<c:redirect url="http://npc.twbbs.org:8080/new2.jsp?id=${IP}"/>
--%>

		<sql:update>
		  INSERT INTO identify
		  VALUES ( ? , ? , ? , ? , ? , ?  , ? , ? , ? , ? )  
		  <sql:param value="12" />
		  <sql:param value="1" />
		  <sql:param value="${sessionScope.site}" />    
		  <sql:param value="${sessionScope.title}" /> 
		  <sql:param value="${sessionScope.site}" />    
		  <sql:param value="All about Demo" /> 		  
		  <sql:param value="Demo" />  
		  <sql:param value="default" />  
		  <sql:param value="1" /> 
		  <sql:param value="1" /> 		      
		</sql:update>


<c:redirect url="http://npc.twbbs.org:8080/bid/new/new2.jsp?add=1"/>
