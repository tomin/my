<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<%-- �B�z�ɶ��n�Ϊ�import --%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!--Cookie�n�Ϊ�import-->
<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�s�W�峹�B�z</title>
</head>

<body>
<%
	//�����r��
	String author=(String)request.getParameter("textfield1");
	String title=(String)request.getParameter("textfield2");
	String password=(String)request.getParameter("textfield3");	
	
	if(!author.equals("") && !title.equals("")){//�p�G�m�W�B���D������J�r��
		//�]�wcookie
		Cookie cookie1 = new Cookie(URLEncoder.encode("�b��"),URLEncoder.encode(author));
		Cookie cookie2 = new Cookie(URLEncoder.encode("�K�X"),URLEncoder.encode(password));		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		
		int isReply=0;//���O�^���峹
		String textarea=(String)request.getParameter("textarea");		
		String IP;//���o�Ȥ��IP	
			if (request.getHeader("X-FORWARDED-FOR") == null) {
				IP = request.getRemoteAddr();
			}
			else {
				IP = request.getHeader("X-FORWARDED-FOR");
			}
		
		//���o���
		Date cdate = new Date();
		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd",Locale.US);
		String date=new String(formatter1.format(cdate).getBytes("iso-8859-1"));
		//���o�ɶ�
		Date ctime = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm:ss",Locale.TAIWAN);
		String time=new String(formatter2.format(ctime).getBytes("iso-8859-1"));
		
		//pageContext.setAttribute("dayStr", "day"+i);		

		//���o�ثe�峹�s��		
		int min_id=0,max_id=1;
		String search="select id,type from message_whole order by id asc";
		Statement query = con.createStatement();
		ResultSet rs = query.executeQuery(search);
		
		//���o�̤p�s���峹
		while(rs.next()){
			if(rs.getString("type").equals("normal")){//�Ĥ@�ӵ���@��峹��(�D��ءB�D�m��)
				min_id=rs.getInt("id");//�N�O�̤pid
				break;
			}
		}
		
		//���o�̤j�s���峹
		if(rs.last()){//�p�Grs.last�s�b
			rs.last();
			max_id=rs.getInt("id");	//17
			max_id++;//�̤j���s���A�[�@�A�]�N�O��18��
		}
		rs.close();
		query.close();
		
		//�̦h�d�����Ƴ]�w					
		if(max_id-min_id>=17){//18-1�A�p�G�d���F���18���F
			//�R���峹
			String del_article="delete from message_whole where id="+min_id;//�R���s���̤p���d��
			//�R������
			String del_push="delete from message_single where article_id="+min_id;			
			Statement delete = con.createStatement();
			delete.executeUpdate(del_article);
			delete.executeUpdate(del_push);			
			delete.close();
		}
		//�N�d���g�J��Ʈw	
		String up="insert into message_whole(author,title,date,time,IP,id,article,isReply,password) values(' "+author+" ','"+title+"','"+date+"','"+time+"','"+IP+"','"+max_id+"','"+textarea+"','"+isReply+"','"+password+"')";
	    Statement stmt = con.createStatement();
	    stmt.executeUpdate(up);
				
		stmt.close();
		con.close();
		response.sendRedirect("message.jsp");
	}
%>
</body>
</html>
