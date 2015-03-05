<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- �w�]���� --%>
<c:choose>
	<%-- �w�]���� --%>
	<c:when test="${param.height==null}">
		<c:set var="height" value="468" />
	</c:when>
		
	<%-- �ϥΪ̦ۭq --%>
	<c:otherwise>			
		<c:set var="height" value="${param.height}"/>
	</c:otherwise>		
</c:choose>

<%-- �w�]�e�� --%>
<c:choose>
	<%-- �w�]�e�� --%>
	<c:when test="${param.width==null}">
		<c:set var="width" value="190" />
	</c:when>
		
	<%-- �ϥΪ̦ۭq --%>
	<c:otherwise>			
		<c:set var="width" value="${param.width}"/>
	</c:otherwise>		
</c:choose>

<%-- �w�]Scroll --%>
<c:choose>
	<%-- �w�]���n --%>
	<c:when test="${param.scrolling==null}">
		<c:set var="scrolling" value="no" />
	</c:when>
		
	<%-- �ϥΪ̦ۭq�n --%>
	<c:otherwise>			
		<c:set var="scrolling" value="${param.scrolling}"/>
	</c:otherwise>		
</c:choose>

document.write('<iframe marginheight="0" marginwidth="0" src="http://tomin.twbbs.org:8080/out.jsp?view=${param.view}&name=${param.name}&random=${param.random}&css=${param.css}" height="${height}" width="${width}" scrolling="${scrolling}" frameborder="0"></iframe>');