<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�����p��</title>
</head>

<body>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<table width="80%" border="1" align="center" bgcolor="#CC33FF">
  <tr>
    <td width="15%" height="68">&nbsp;</td>
    <td width="85%"><p><a href="change.jsp">�����U���</a>�@<a href="check.jsp">�d�߭ɾ\���p</a>�@�w���s�ѡ@�u�W�վ\</p></td>
  </tr>
  <tr valign="top">
    <td><p>�A�n,���N�a</p>
        <p><a href="logout.jsp">�n�X</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7" width="568"><strong>�����p�����y�Ʀ� </strong>(2005-05-10 ~ 2005-06-10) </td>
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
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �ޮa�p�a </td>
        <td class="tableword">858 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">���m </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> ���~�Q�k </td>
        <td class="tableword">55 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">�u�� </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �˿ˤp�ޮa </td>
        <td class="tableword">56 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">�|�� </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> ���u�j�� </td>
        <td class="tableword">859 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">��X </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �ڷR�p���l </td>
        <td class="tableword">54 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �N�t�N�����ܻT </td>
        <td class="tableword">53 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">Ĭ�� </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �`�����b�Q�k�� </td>
        <td class="tableword">51 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �o�@�����u�� </td>
        <td class="tableword">455 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">���i�i </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �W���Q�� </td>
        <td class="tableword">863 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">�s�� </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �Ʋz�Q�Q�� </td>
        <td class="tableword">385 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">��� </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �O�o�������w </td>
        <td class="tableword">127 </td>
        <td class="tableword">�s�u�X���� </td>
        <td class="tableword">�Ӫ��� </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �����A���c </td>
        <td class="tableword">456 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">Ĭ�c </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �·����@�� </td>
        <td class="tableword">860 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">��M </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> ���������J </td>
        <td class="tableword">384 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">�L�F </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �F�ӦѱC�^�a�k </td>
        <td class="tableword">857 </td>
        <td class="tableword">���ΥX���� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �B�Ré�V�F </td>
        <td class="tableword">2866 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">�i�� </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �k�H,�פ� </td>
        <td class="tableword">129 </td>
        <td class="tableword">�s�u�X���� </td>
        <td class="tableword">�O�� </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> ���s�`�� </td>
        <td class="tableword">133 </td>
        <td class="tableword">�s�u�X���� </td>
        <td class="tableword">��G </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �ɤH���Q </td>
        <td class="tableword">2860 </td>
        <td class="tableword">�ݰ��X���� </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">�����p�� </td>
        <td class="tableword"> �k�B��,�е��� </td>
        <td class="tableword">493 </td>
        <td class="tableword">�ݴ� </td>
        <td class="tableword">�C�� </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
