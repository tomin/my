 <html>
<head>
<title>Family</title>
</head>
<body>
<center>
</center>
<center>
<font size=10>Family</font>

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
 

String SQL ="insert into Family(id,Name,Relation,picture,intro,blog) values('"+
                request.getParameter("Name1")+"','"+request.getParameter("Name1")+"','"+request.getParameter("Relation1")+"','"+request.getParameter("picture1")+"','"+
                 request.getParameter("introduction1")+"','"+request.getParameter("blog1")+"');";
                stmt.executeUpdate(SQL);

String SQL2 ="insert into Family(id,Name,Relation,picture,intro,blog)  values('"+
                request.getParameter("Name2")+"','"+request.getParameter("Name2")+"','"+request.getParameter("Relation2")+"','"+request.getParameter("picture2")+"','"+
                 request.getParameter("introduction2")+"','"+request.getParameter("blog2")+"');";
                stmt.executeUpdate(SQL2);

String SQL3 ="insert into Family(id,Name,Relation,picture,intro,blog)  values('"+
                request.getParameter("Name3")+"','"+request.getParameter("Name3")+"','"+request.getParameter("Relation3")+"','"+request.getParameter("picture3")+"','"+
                 request.getParameter("introduction3")+"','"+request.getParameter("blog3")+"');";
                stmt.executeUpdate(SQL);

String SQL4 ="insert into Family(id,Name,Relation,picture,intro,blog) values('"+
                request.getParameter("Name4")+"','"+request.getParameter("Name4")+"','"+request.getParameter("Relation4")+"','"+request.getParameter("picture4")+"','"+
                 request.getParameter("introduction4")+"','"+request.getParameter("blog4")+"');";
                stmt.executeUpdate(SQL);
%>
