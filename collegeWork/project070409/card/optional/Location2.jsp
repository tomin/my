 <html>
<head>
<title>Location</title>
</head>
<body>
<center>
</center>
<center>
<font size=10>Location</font>

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
 

String SQL ="insert into Location (Street,City,Country,Zip_Code) values('
                '"+request.getParameter("Street")+"','"+request.getParameter("City")+"','"+request.getParameter("Country")+"'),'"+request.getParameter("Zip_Code")+"');";
                stmt.executeUpdate(SQL);

%>
