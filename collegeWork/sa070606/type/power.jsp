<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�Z�L�p��</title>
</head>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<body>
<table width="80%" border="1" align="center" bgcolor="#CC9933">
  <tr>
    <td width="10%">&nbsp;</td>
    <td width="90%"><p><a href="change.jsp">�����U���</a>�@<a href="check.jsp">�d�߭ɾ\���p</a>�@�w���s�ѡ@�u�W�վ\</p></td>
  </tr>
  <tr valign="top">
    <td><p>�A�n,�j�L</p>
        <p><a href="logout.jsp">�n�X</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7" width="568"><strong>�Z�L�p�����y�Ʀ� </strong>(2005-05-10 ~ 2005-06-10) </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="8%"><strong>�W�� </strong></td>
        <td class="tabletitle" width="15%"><strong>���O </strong></td>
        <td class="tabletitle" width="20%"><strong>�ѦW </strong></td>
        <td class="tabletitle" width="20%"><strong>�̷s���� </strong></td>
        <td class="tabletitle" width="15%"><strong>�X���� </strong></td>
        <td class="tabletitle" width="15%"><strong>�@�� </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �p�L�ǩ_ </td>
        <td class="tableword">21 </td>
        <td class="tableword">��� </td>
        <td class="tableword">�ȫB </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> ���ǻ� </td>
        <td class="tableword">45 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �ݥP </td>
        <td class="tableword">15 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> ���H�ƥ@�� </td>
        <td class="tableword">29 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">���K </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �ѮѶǩӪ� </td>
        <td class="tableword">2 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">HELP HER </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> ���䤧�� </td>
        <td class="tableword">28 </td>
        <td class="tableword">�A�A��� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �P�C����II(��) </td>
        <td class="tableword">5 </td>
        <td class="tableword">�A�A��� </td>
        <td class="tableword">���y�� </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �P�H�ǩ_ </td>
        <td class="tableword">5 </td>
        <td class="tableword">�A�A��� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �v���]����II </td>
        <td class="tableword">9 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">�ɤ��R�� </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �F�� </td>
        <td class="tableword">11 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">���j�� </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �ۥ@�D </td>
        <td class="tableword">13 </td>
        <td class="tableword">�A�A��� </td>
        <td class="tableword">�ѧ� </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �٭� </td>
        <td class="tableword">12 </td>
        <td class="tableword">�A�A��� </td>
        <td class="tableword">�Ҥl </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �q�r�g�Q��-�� </td>
        <td class="tableword">9 </td>
        <td class="tableword">�Ѯ��ѳ��� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> ���]�� </td>
        <td class="tableword">26 </td>
        <td class="tableword">�_�I�̤Ѱ� </td>
        <td class="tableword">�թ] </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �s�Ԥh���� </td>
        <td class="tableword">8 </td>
        <td class="tableword">�e�� </td>
        <td class="tableword">�b���C�� </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �y�]�t�� </td>
        <td class="tableword">3 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">�s�y�� </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> ���L </td>
        <td class="tableword">19 </td>
        <td class="tableword">�C���W�D </td>
        <td class="tableword">�ۦb </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �Ӹ�H�� </td>
        <td class="tableword">6 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">��� </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �Ī̻�� </td>
        <td class="tableword">12 </td>
        <td class="tableword">�p���W�D </td>
        <td class="tableword">��] </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"> �]�Z�hII </td>
        <td class="tableword">3 </td>
        <td class="tableword">�A�A��� </td>
        <td class="tableword">�Ŵ� </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
