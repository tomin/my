 <html>
<head>
<title>Secondary emails</title>
</head>
<body>
<center>
</center>
<center>
<font size=10>Secondary emails</font>

<%@ page contentType="text/html;charset=big5" language="java"  import="java.sql.*" import="java.util.*" import="java.text.*" %>
<%                                                                              
   
        Connection con = null; //�_�l�]�w��Ʈw�s����������
        Statement stmt = null;
        ResultSet rs = null;
                                                                                                                                                                                                                                      
                Class.forName("org.gjt.mm.mysql.Driver");
                //���J�X�ʵ{�����O
                                                                                
                con = DriverManager.getConnection
                ("jdbc:mysql://npc.twbbs.org:3306/meeting","root","root");
                //�إ߸�Ʈw�s�u
                                                                                
                stmt = con.createStatement();
                //�إ�Statement����, �ó]�w�O�������������i�e�Ჾ��
 

String SQL ="insert into Email (email1,email2,email3) values('
                '"+request.getParameter("email1")+"','"+request.getParameter("email2")+"','"+request.getParameter("email3")+"');";
                stmt.executeUpdate(SQL);

%>
