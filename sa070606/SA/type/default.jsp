<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�w�]�e��</title>
</head>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<body>
<table width="80%" height="971" border="1" align="center">
  <tr>
    <td width="71" height="68">&nbsp;</td>
    <td width="362"><p><a href="change.jsp">�����U���</a>�@<a href="check.jsp">�d�߭ɾ\���p</a>�@�w���s�ѡ@�u�W�վ\</p></td>
  </tr>
  <tr valign="top">
    <td><p>�A�n</p>
        <p><a href="logout.jsp">�n�X</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7" width="568"><strong>�������s�� </strong></td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="8%"><strong>�Ǹ� </strong></td>
        <td class="tabletitle" width="15%"><strong>���O </strong></td>
        <td class="tabletitle" width="25%"><strong>�ѦW </strong></td>
        <td class="tabletitle" width="10%"><strong>���� </strong></td>
        <td class="tabletitle" width="15%"><strong>�X���� </strong></td>
        <td class="tabletitle" width="15%"><strong>�@�� </strong></td>
        <td class="tabletitle" width="15%"><strong>�X����� </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6908')">�C�s�]-������ </a></td>
        <td class="tableword">13 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">���s�� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6919')">�W�����_�n�S�O�g </a></td>
        <td class="tableword">23 </td>
        <td class="tableword">�C�� </td>
        <td class="tableword">�C�s��� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6920')">�Ҥ����D </a></td>
        <td class="tableword">1 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�ӦW���� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6923')">�Ҥ����D </a></td>
        <td class="tableword">2 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�ӦW���� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6924')">�]��������RAGNAROK </a></td>
        <td class="tableword">5 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">��U </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6925')">���P��-���Ȥ֤k���u��G��</a></td>
        <td class="tableword">0 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">������ </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6890')">�r�s�L�� </a></td>
        <td class="tableword">2 </td>
        <td class="tableword">�p���W </td>
        <td class="tableword">�u�\���F </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6891')">�p���ׯ��� </a></td>
        <td class="tableword">15 </td>
        <td class="tableword">���� </td>
        <td class="tableword">���P </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6900')">���@�Ҥ��� </a></td>
        <td class="tableword">24 </td>
        <td class="tableword">�p���W </td>
        <td class="tableword">�����M�h </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6901')">���⪺�����ۮv </a></td>
        <td class="tableword">20 </td>
        <td class="tableword">�p���W </td>
        <td class="tableword">�I�� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6902')">�]�۬P�� </a></td>
        <td class="tableword">10 </td>
        <td class="tableword">�p���W </td>
        <td class="tableword">�y������ </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6904')">�p�^�Z�h </a></td>
        <td class="tableword">3 </td>
        <td class="tableword">�p���W </td>
        <td class="tableword">���j��</td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6883')">������(�G) </a></td>
        <td class="tableword">3 </td>
        <td class="tableword">�\�� </td>
        <td class="tableword">�i�� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6905')">���k�� </a></td>
        <td class="tableword">3 </td>
        <td class="tableword">�p���W </td>
        <td class="tableword">���F�j�h </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6884')">���߮v </a></td>
        <td class="tableword">6 </td>
        <td class="tableword">�Ӵ� </td>
        <td class="tableword">�C�F�i </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6907')">�A���ڬ� </a></td>
        <td class="tableword">9 </td>
        <td class="tableword">�A�A </td>
        <td class="tableword">�H�� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6885')">��ťP�� </a></td>
        <td class="tableword">1 </td>
        <td class="tableword">�Ӵ� </td>
        <td class="tableword">�C�� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6909')">�g�Ϊ��v </a></td>
        <td class="tableword">9 </td>
        <td class="tableword">�A�A </td>
        <td class="tableword">ť�y </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6886')">���] </a></td>
        <td class="tableword">18 </td>
        <td class="tableword">�Ӵ� </td>
        <td class="tableword">��� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">�Z�L�p�� </td>
        <td class="tableword"><a href="javascript:popupWindow('book_preview.php?bID=6910')">�L�ҥȧL </a></td>
        <td class="tableword">14 </td>
        <td class="tableword">�A�A </td>
        <td class="tableword">�ȧL�� </td>
        <td class="tableword"><p align="left">2005-05-27 </p></td>
      </tr>
    </table>
</td>
  </tr>
</table>
</body>
</html>
