<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<%-- session �� include --%>
<%@ include file="session.jsp" %>
<%-- Cookie�n�Ϊ�import--%>
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>Russia</title>
<STYLE>
<!--
@import URL(style.css);
body {
	background-image:url(images/message_single.gif);
}
-->
</STYLE>
</head>
<script>
function del() {
	var answer = confirm("�T�w�n�R���d���ܡH");
	if (answer){
		var pass = prompt("�п�J�K�X");
		if(pass==""){
			window.alert("�п�J�K�X");
		}
		else{
		document.passform.password.value=pass;
�@�@	document.passform.submit();
		}
	}
}
</script>
<script language="javascript">
function checkdata() {
   var a = document.form.textfield1.value;
   var b = document.form.textfield2.value;
   if(a=="" || b==""){
   		alert("�m�W�M���e�@�w�n��I");
		return false;
   }		
   else	 if(a.length>12){
   		alert("�m�W�Ӫ��o�I");
		return false;
   }				
   else	 if(b.length>80){
   		alert("���e�Ӫ��o�I");
		return false;
   }				
   else
   		return true;
}
</script>
<body>
<%
	int stop=0;
	int push_value=0;
	//�N�����Ӫ�string id�ରinteger
	int id=Integer.parseInt(request.getParameter("id"));		

	//�d�ߤ峹�s��	
    String query0 = "select id,stop from message_whole";
    Statement stmt0 = con.createStatement();
    ResultSet rs0 = stmt0.executeQuery(query0);
	
	rs0.first();//���o�峹�s���̤p��
	int min_id=rs0.getInt("id");
	rs0.last();//���o�峹�s���̤j��
	int max_id=rs0.getInt("id");
		
	//�d�ߦ��g�峹���Ҧ���T
    String query1 = "select * from message_whole where id="+id;
    Statement stmt1 = con.createStatement();
    ResultSet rs1 = stmt1.executeQuery(query1);
	ResultSet isEmpty;
	
	//�C�X��g�峹�}�l
	if(rs1.next()){
		stop=rs1.getInt("stop");//�O�_�T�����			
		//�r���_��B�z
		String msg = rs1.getString("article");
		String article; 
		article = msg.replaceFirst("��","<font color=\"green\">��");//�̷s�^�Ф��ʨ�
		article = article.replaceFirst("\r\n: ��","</font><br><font color=\"#009999\">: ��");//�ĤG�g�^�Ф��ʨ�
		article = article.replaceAll("\r\n:","</font><br><font color=\"#009999\">:");//�ĤG�g�^�Фޤ媺�_��
		article = article.replaceAll("\r\n","</font><br>");//�^�Ъ̪��_��
%>	
	<table border="0" width="100%" cellspacing="0">
		<tr>
			<td bgcolor="#CCCCCC" width="5%" style="color:#0000CC" align="center">�@��</td>			
			<td bgcolor="#0033CC">&nbsp;<%=rs1.getString("author")%></td>
			<td bgcolor="#CCCCCC" width="5%" style="color:#0000CC" align="center">�ݪO</td>
			<td bgcolor="#0033CC" width="8%" align="center">Russia</td>
		</tr>
		<tr>
			<td bgcolor="#CCCCCC" style="color:#0000CC" align="center">���D</td>
			<td bgcolor="#0033CC" colspan="3">&nbsp;<%=rs1.getString("title")%></td>
		</tr>
		<tr>
			<td bgcolor="#CCCCCC" style="color:#0000CC" align="center">�ɶ�</td>
			<td bgcolor="#0033CC" colspan="3">&nbsp;<%=rs1.getString("date")%> <%=rs1.getString("time")%></td>
		</tr>
	</table>
	
		<hr color="#009999" size="1"><br>
		<%=article%>
		</font>
		<br><br>
		--<br>
  		<font color="Green">�� �o�H��: �Xù��</font><br>
  		�� From: <%=rs1.getString("IP")%>
<%
	}
	else{//�p�G�峹�O�Ū�(�w�Q�R���^
		id++;//�N�峹�s���[�@
		response.sendRedirect("message_single.jsp?id="+id);		
	}//�C�X��g�峹����
	
	//�d�ߦ��g�峹������
    String query2 = "select * from message_single where article_id="+id+" order by date,time asc";
	Statement stmt2 = con.createStatement();
    ResultSet rs2 = stmt2.executeQuery(query2);
%>	
	<table border=0 width="100%">
	<%while(rs2.next()){//�C�X����%>	
			<tr>
				<td width="2%">
				<%if(rs2.getInt("value")==0){
					push_value--;%>
					<font color="#999999">�N</font></td>					
				<%}
				if(rs2.getInt("value")==1){
					push_value++;%>					
					��</td>
				<%}%>		
		    	<td>
					<font color="yellow"><%=rs2.getString("push_name")%></font><font color="#FFFF66">:<%=rs2.getString("push_word")%></font>
				</td>
				<td width="15%" align="right"><%=rs2.getString("IP")%></td>				
				<td width="13%" align="right"><%=rs2.getString("date")%></td>
			</tr>
	<%}%>
	</table>
<%
	String push_id="";//�w�q����b��
	//���ocookie
	Cookie rcookie[] = request.getCookies();
		for (int i = 0; i < rcookie.length; i++)
			if (URLDecoder.decode(rcookie[i].getName()).equals("�b��"))
				push_id=URLDecoder.decode(rcookie[i].getValue());
					
	//�N����Ʃ�J��Ʈw��
	String update_push = "update message_whole set value="+push_value+" where id="+id;
	Statement stmt = con.createStatement();
	stmt.executeUpdate(update_push);
	
	rs0.close();
	rs1.close();
	rs2.close();
	stmt0.close();
	stmt1.close();
	stmt2.close();		
    con.close();
%>

<%if(stop==0){//%>
	<form name="form" method="post" action="push_deal.jsp">
	  �m�W�G
	  <input name="textfield1" type="text" size="13" value="<%=push_id%>"> 
	  ���e�G
	  <input name="textfield2" type="text" size="70"> 
	  <input type="submit" name="Submit" value="�e�X" onClick="return checkdata()">
	  ��
	  <input name="radiobutton" type="radio" value="1" checked> 
	  �N
	  <input name="radiobutton" type="radio" value="0">
	  <input name="article_id" type="hidden" value=<%=id%>>
	</form>
<%}else{%>
	<center><b>����\��Q�T��F</b></center>
<%}%>
<form name="passform" method="post" action="delete.jsp?id=<%=id%>">
	<input type="hidden" name="password" value="">
</form>	

<br>
	<table width="100%" border="0">
		<tr>
			<td>			
				<%if(min_id<id){%>
					<a href="message_single.jsp?id=<%=id-1%>">�W�g</a>
				<%}else %>�W�g
								
				<%if(id<max_id){%>
					<a href="message_single.jsp?id=<%=id+1%>">�U�g</a>
				<%}else %>�U�g
				<a href="message.jsp">�C��</a>							
			</td>
			<td align="right">
				<a href="reply.jsp?id=<%=id%>&way=y">�^��</a>
				<a href="edit.jsp?id=<%=id%>">�ק�</a>
				<a href="javascript:del()">�R��</a>
			</td>
		</tr>
	</table>
</body>
</html>
