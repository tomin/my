<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=Big5" language="java" import="java.sql.*" errorPage="" %>

<form name="form1" method="get" action="">
  <table width="100%"  border="1">
    <tr>
      <td width="40%"><p>Ziqi Boya! </p>
        <p>1.�A���j�W�G
            <input name="name" type="text" value="${param.name}">
        </p>
        <p> 2.�������ءG
            <select name="view">			  
              <option value="1" <c:if test="${param.view==1}">selected</c:if>>�̪��ť</option>
              <option value="2" <c:if test="${param.view==2}">selected</c:if>>�̪�W��</option>
              <option value="3" <c:if test="${param.view==3}">selected</c:if>>�̷R�q��</option>
			  			  
            </select>
            <input name="random" type="radio" value="0" <c:if test="${param.random=='0' || param.random==null}">checked</c:if>>
            �̷s
            <input name="random" type="radio" value="1" <c:if test="${param.random=='1'}"> checked</c:if>>
        �H��</p>
        <p>3.�q����ܼƶq�G
            <select name="limit">
				<c:forEach begin="1" end="15" var="limit_put" >
					<option value="${limit_put}" <c:if test="${param.limit==limit_put}">selected</c:if>>${limit_put}</option>
				</c:forEach>			
            </select>
  (�w�]6��) </p>
        <p>4.�ج[���סG
            <input name="height" type="text" value="${param.height}">
  (�w�]468)</p>
        <p>5.�ج[�e�סG
            <input name="width" type="text" value="${param.width}">
  (�w�]190)</p>
        <p>6.�ج[���b�G
            <select name="scrolling">
			  	<option value="no" <c:if test="${param.scrolling=='no'}">selected</c:if>>���n</option>
              <option value="yes" <c:if test="${param.scrolling=='yes'}">selected</c:if>>�n</option>              
            </select>
  (�w�]���n)</p>
        <p>7.�ۭqCSS�G
          <input name="css" type="text" value="${param.css}">
(�w�]�S��)        </p>
        <p>
          <input type="submit" name="Submit" value="�w��">
�@�@          
<a href="?name=tomin&view=1&limit=6&height=468&width=190&scrolling=no">�w�]</a>
�@<a href="http://tomin.twbbs.org:8080/see.jsp?name=tomin&view=1&limit=10&height=600&width=200&scrolling=yes&css=http%3A//tomin.twbbs.org%3A8080/style.css&Submit=&#38928;&#35261;&textarea=%3Cscript+src=%22http%3A//tomin.twbbs.org%3A8080/v.jsp?view=1&name=tomin&limit=10&height=800&width=200&scrolling=yes&css=http%3A//tomin.twbbs.org%3A8080/style.css">�i��</a>�@
<a href="?view=4&limit=6&height=468&width=190&scrolling=no">����</a>
�@<a href="hot.jsp" target="_new">�����Ʀ�</a>
</p></td>
      <td width="60%"><p>�{���X�G</p>
        <table width="100%"  border="1">
          <tr>
            <td>
              <textarea name="textarea" cols="74" rows="3">&lt;script src=&quot;http://tomin.twbbs.org:8080/v.jsp?view=${param.view}<c:if test="${param.name!=null && param.name!=''}">&amp;name=${param.name}</c:if><c:if test="${param.limit!=6 && param.limit!=null && param.limit!=''}">&amp;limit=${param.limit}</c:if><c:if test="${param.height!=468 && param.height!=null && param.height!=''}">&amp;height=${param.height}</c:if><c:if test="${param.width!=190 && param.width!=null && param.width!=''}">&amp;width=${param.width}</c:if><c:if test="${param.scrolling!='no' && param.scrolling!=null && param.scrolling!=''}">&amp;scrolling=${param.scrolling}</c:if><c:if test="${param.css!=null && param.css!=''}">&amp;css=${param.css}</c:if><c:if test="${param.random=='1'}">&amp;random=${param.random}</c:if> type=&quot;text/javascript&quot;&gt;&lt;/script&gt;</textarea>
            </td>
          </tr>
        </table>
      <p>&nbsp;</p>
      <p>�����G</p>
      <p>�N�{���X�ƻs�쳡����������]�w���䤤�@�Ӯخء��x�s�C�N�����F�C	  
      <p><a href="http://mishiming.blogspot.com/2007/09/pixnetsidebar.html">Step by step�Ϥ�ܽd</a></p>      </td>
    </tr>
  </table>
  </form>
  �w���e���p�U
  <hr>
<iframe id="show" name="show" marginheight="0" marginwidth="0" src="http://tomin.twbbs.org:8080/out.jsp?view=${param.view}&name=${param.name}&limit=${param.limit}&css=${param.css}&random=${param.random}" height="${param.height}" width="${param.width}" scrolling="${param.scrolling}" frameborder="0"></iframe>