<%@ include file="../check/session/exam.jsp" %>
<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/mysql.jsp" %>
<%@ include file="../include/head.jsp" %>
<script language="javascript">
function checkdata() {
   	var id = document.form.textfield0.value;
   	if(id==""){
   		alert("�Ǹ��@�w�n��I");
		return false;
	}			
	else{
		return true;
	}			
}
</script>
�s�W���˸��
<form name="form" method="post" action="add_deal.jsp">
  <p>�Ǹ��G
    <input type="text" name="textfield0">
(����)</p>
  <p>  ���˰O���s���G
    <input type="text" name="textfield">
  </p>
  <p>  �ˬd����G 
    <select name="select1">
      <c:forEach begin="2005" end="2020" var="year">
      <option>${year}</option>
      </c:forEach>
    </select> 
    �~
    <select name="select2">
      <c:forEach begin="1" end="12" var="month">
      <option>${month}</option>
      </c:forEach>	  
    </select>
	��
	<select name="select3">
      <c:forEach begin="1" end="31" var="day">
      <option>${day}</option>
      </c:forEach>  
    </select>
	��
</p>
  <p>���綵��</p>
<sql:query sql="SELECT * FROM item order by item_id asc" var="item" />
<table>
	<tr>
		<th>�s��</th><th>��������</th><th>���ؤ���W</th><th>���ح^��W</th><th>�Ѧҭ�</th><th>���</th><th>�ˬd���G</th>
	</tr>
	<c:forEach items="${item.rowsByIndex}" var="item_put" >	
		<tr>
			<td>${item_put[0]}</td><td>${item_put[5]}</td><td>${item_put[1]}</td><td>${item_put[2]}</td>		
			<td align="center">${item_put[3]}</td><td>${item_put[4]}</td>		
			<td>
				<c:choose>
					<c:when test="${item_put[3]=='�L����'}">
							<select name="text${item_put[0]}">
								<option value="">�S���ˬd</option>
								<option value="�L����">&nbsp;�L����&nbsp;</option>
								<option value="������">&nbsp;������&nbsp;</option>
							</select>
					</c:when>
	
					<c:when test="${item_put[3]=='���`'}">
							<select name="text${item_put[0]}">
								<option value="">�S���ˬd</option>
								<option value="���`">�@���`�@</option>
								<option value="�����`">&nbsp;�����`&nbsp;</option>
							</select>
					</c:when>				
					
					<c:when test="${item_put[3]=='���ʤ���'}">
							<select name="text${item_put[0]}">
								<option value="">�S���ˬd</option>
								<option value="���ʤ���">���ʤ���</option>
								<option value="���ʤ���">���ʤ���</option>
							</select>
					</c:when>
					
					<c:when test="${item_put[3]=='���ʤ���'}">
							<select name="text${item_put[0]}">
							<option value="">�S���ˬd</option>
							  <option value="���ʤ���">���ʤ���</option>
							  <option value="���ʤ���">���ʤ���</option>
							</select>
					</c:when>				
					
					<c:otherwise>					
						<input type="text" name="text${item_put[0]}" size="10">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>  
</table>
<center>  
  <p>
    <input type="submit" name="Submit" value="�e�X" onClick="return checkdata()"> 
  </p>
</center>
</form>
