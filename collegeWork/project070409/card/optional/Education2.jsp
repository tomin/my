 <html>
<head>
<title>Education</title>
</head>
<body>
<center>
</center>
<center>
<font size=10>Education</font>

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
 

String SQL ="insert into education (id,university,uni_year,uni_month,senior_high,sen_year,sen_month,junior_high,jun_year,jun_month,elementary,ele_year,ele_month) values('"+
                request.getParameter("university")+"','"+request.getParameter("university")+"','"+request.getParameter("u_year")+"','"+request.getParameter("u_month")+"','"+
                 request.getParameter("h_school")+"','"+request.getParameter("h_year")+"','"+request.getParameter("h_month")+"','"+request.getParameter("j_school")+"','"+request.getParameter("j_year")+"','"+
                 request.getParameter("j_month")+"','"+request.getParameter("elementary")+"','"+request.getParameter("e_year")+"','"+request.getParameter("e_month")+"'); ";
                stmt.executeUpdate(SQL);

%>
