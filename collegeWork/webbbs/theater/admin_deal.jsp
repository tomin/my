<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�B�z�޲z����</title>
</head>
<%-- �s����Ʈw�� include --%>
<%@ include file="mysql.jsp" %>
<body>
<%
	String id=(String)request.getParameter("id");
	String action=(String)request.getParameter("radiobutton");
	if(!action.equals("null")){
	
		Statement stmt = con.createStatement();//�إ�Statement	
		
		if(action.equals("good")){//��ؤ峹
			String good="update message_whole set type='good' where id="+id;
			stmt.executeUpdate(good);
		}
		
		else if(action.equals("top")){//�m���峹
			String top="update message_whole set top='1' where id="+id;
			stmt.executeUpdate(top);
		}
		
		else if(action.equals("allow_push")){//���\����
			String allow_push="update message_whole set stop='0' where id="+id;
			stmt.executeUpdate(allow_push);
		}			

		else if(action.equals("cancel_good")){//�������
			String cancel_good="update message_whole set type='normal' where id="+id;
			stmt.executeUpdate(cancel_good);
		}
		
		else if(action.equals("cancel_top")){//�����m��
			String cancel_top="update message_whole set top='0' where id="+id;
			stmt.executeUpdate(cancel_top);
		}
		
		else if(action.equals("stop_push")){//�������
			String stop_push="update message_whole set stop='1' where id="+id;
			stmt.executeUpdate(stop_push);
		}								
		
		else{//�R���峹
			String delete1="delete from message_whole where id="+id;
			String delete2="delete from message_single where article_id="+id;			
			stmt.executeUpdate(delete1);
			stmt.executeUpdate(delete2);			
		}
			stmt.close();
			con.close();
			response.sendRedirect("admin.jsp");
	}
%>
</body>
</html>
