 <html>
<head>
<title>�T�{����</title>
</head>
<body>
<center>
</center>
<center>
<font size=10>Job</font>

<%@ page contentType="text/html;charset=big5" language="java"  import="java.sql.*" import="java.util.*" import="java.text.*" %>
<%                                                                              
   
        Connection con = null; //�_�l�]�w��Ʈw�s����������
        Statement stmt = null;
        ResultSet rs = null;
                                                                                                                                                                                                                                      
                Class.forName("org.gjt.mm.mysql.Driver");
                //���J�X�ʵ{�����O
                                                                                
                con = DriverManager.getConnection
                ("jdbc:mysql://npc.twbbs.org:3306/card","root","root");
                //�إ߸�Ʈw�s�u
                                                                                
                stmt = con.createStatement();
                //�إ�Statement����, �ó]�w�O�������������i�e�Ჾ��
 

String SQL ="insert into Job (id,company,title,period) values('"+
                request.getParameter("company")+"','"+request.getParameter("company")+"','"+request.getParameter("title")+"','"+request.getParameter("period")+"');";
                stmt.executeUpdate(SQL);

%>
