<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�֦~���e</title>
</head>

<body>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<table width="80%" height="971" border="1" align="center" bgcolor="#00CCFF">
  <tr>
    <td width="10%" height="68">&nbsp;</td>
    <td width="90%"><p><a href="change.jsp">�����U���</a>�@<a href="check.jsp">�d�߭ɾ\���p</a>�@<a href="order.jsp">�w���s��</a>�@<a href="preview.jsp">�u�W�վ\</a>�@�@</p>
    </td>
  </tr>
  <tr valign="top">
    <td><p>�A�n,�ӭ�</p>
    <p><a href="logout.jsp">�n�X</a></p></td>
    <td>    <table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="7"><strong>�֦~���e���y�Ʀ� </strong>(2005-05-10 ~ 2005-06-10) </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="45"><strong>�W�� </strong></td>
        <td class="tabletitle" width="82"><strong>���O </strong></td>
        <td class="tabletitle" width="149"><strong>�ѦW </strong></td>
        <td class="tabletitle" width="84"><strong>�̷s���� </strong></td>
        <td class="tabletitle" width="83"><strong>�X���� </strong></td>
        <td class="tabletitle" width="95"><strong>�@�� </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �s�T�� </td>
        <td class="tableword">33 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�s��q�H </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �]�������� </td>
        <td class="tableword">36 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">�åЩM�� </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> HUNTER*HUNTER�y�H </td>
        <td class="tableword">21 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�I��q�� </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���]�e </td>
        <td class="tableword">39 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">�����d�� </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���v�Ԫ�NARUTO </td>
        <td class="tableword">26 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�������v </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �O�L�i�h </td>
        <td class="tableword">28 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�T���ؤ� </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���y���l </td>
        <td class="tableword">27 </td>
        <td class="tableword">�C�� </td>
        <td class="tableword">�\���� </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �ѤU�L�� </td>
        <td class="tableword">3 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�c�U�ȳ� </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> KATSU!�C�K��e </td>
        <td class="tableword">13 </td>
        <td class="tableword">�C�� </td>
        <td class="tableword">�w�F�R </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ��������N�v </td>
        <td class="tableword">10 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">��t�� </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ONE PIECE����� </td>
        <td class="tableword">36 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">���кa�@ </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> 20�@���֦~ </td>
        <td class="tableword">18 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">���A���� </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �]�� </td>
        <td class="tableword">12 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">���_�� </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ��!�k�� </td>
        <td class="tableword">10 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�c�U�ȳ� </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �βy�j�p�� </td>
        <td class="tableword">52 </td>
        <td class="tableword">�C�� </td>
        <td class="tableword">���Щݤ] </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���`���ODEATHNOTE </td>
        <td class="tableword">5 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�p�а� </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> BLEACH���� </td>
        <td class="tableword">16 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�[�O�a�H </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �s�K���p�l </td>
        <td class="tableword">20 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�e�t�� </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ����R�� </td>
        <td class="tableword">18 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">���Y </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �ֳt�y </td>
        <td class="tableword">40 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�t�T�f�a </td>
      </tr>
      <tr>
        <td class="tableword">21 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���s </td>
        <td class="tableword">8 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�D����� </td>
      </tr>
      <tr>
        <td class="tableword">22 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���R�f�r </td>
        <td class="tableword">1 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�~����] </td>
      </tr>
      <tr>
        <td class="tableword">23 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �Ʋz�_���� </td>
        <td class="tableword">27 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�g�s </td>
      </tr>
      <tr>
        <td class="tableword">24 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �v�W�̱j�̤l�ݤ@ </td>
        <td class="tableword">14 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�Q���W�T </td>
      </tr>
      <tr>
        <td class="tableword">25 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �����g�MKYO </td>
        <td class="tableword">31 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�W�����p </td>
      </tr>
      <tr>
        <td class="tableword">26 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���x�֦~ACT2 </td>
        <td class="tableword">18 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�K���E�� </td>
      </tr>
      <tr>
        <td class="tableword">28 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �a�Ѥ��� </td>
        <td class="tableword">12 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">����� </td>
      </tr>
      <tr>
        <td class="tableword">29 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �b��II </td>
        <td class="tableword">24 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�O���f�� </td>
      </tr>
      <tr>
        <td class="tableword">29 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �̲׶i�Ƥ֦~ </td>
        <td class="tableword">4 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�e�q�� </td>
      </tr>
      <tr>
        <td class="tableword">30 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �j���ڤ۩_�� </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">�B���u </td>
      </tr>
      <tr>
        <td class="tableword">31 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> D-LIVE�ͦs�v�� </td>
        <td class="tableword">9 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�Ҥt�G�G </td>
      </tr>
      <tr>
        <td class="tableword">32 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���P�ܴL </td>
        <td class="tableword">23 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�w���i�� </td>
      </tr>
      <tr>
        <td class="tableword">33 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �`���l </td>
        <td class="tableword">30 </td>
        <td class="tableword">�x�W�F�c </td>
        <td class="tableword">����� </td>
      </tr>
      <tr>
        <td class="tableword">34 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �ڮa�}������ </td>
        <td class="tableword">1 </td>
        <td class="tableword">�x�W�F�c </td>
        <td class="tableword">�����ϵ� </td>
      </tr>
      <tr>
        <td class="tableword">35 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ZETMAN�W�]�H </td>
        <td class="tableword">4 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�ۥ��M </td>
      </tr>
      <tr>
        <td class="tableword">36 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �S������� </td>
        <td class="tableword">5 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�[�O���z </td>
      </tr>
      <tr>
        <td class="tableword">37 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �����j�D�� </td>
        <td class="tableword">22 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">���L </td>
      </tr>
      <tr>
        <td class="tableword">38 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���H </td>
        <td class="tableword">8 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�s�Ъڸ� </td>
      </tr>
      <tr>
        <td class="tableword">39 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���100% </td>
        <td class="tableword">14 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�e�U���� </td>
      </tr>
      <tr>
        <td class="tableword">40 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �]�L�ǩ_ </td>
        <td class="tableword">8 </td>
        <td class="tableword">�C�� </td>
        <td class="tableword">�w��H�� </td>
      </tr>
      <tr>
        <td class="tableword">41 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���~���� </td>
        <td class="tableword">1 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�Z </td>
      </tr>
      <tr>
        <td class="tableword">42 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �ѨϤ� </td>
        <td class="tableword">14 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�_���q </td>
      </tr>
      <tr>
        <td class="tableword">43 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ����Ф� </td>
        <td class="tableword">71 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">�s�� </td>
      </tr>
      <tr>
        <td class="tableword">44 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���Υ��E </td>
        <td class="tableword">8 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�߭쥿�| </td>
      </tr>
      <tr>
        <td class="tableword">45 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �{�F2�H�� </td>
        <td class="tableword">29 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">��p��H </td>
      </tr>
      <tr>
        <td class="tableword">46 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �R���Ŧ� </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">�C���H�@ </td>
      </tr>
      <tr>
        <td class="tableword">47 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �βy�S�� </td>
        <td class="tableword">20 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�Q�q���� </td>
      </tr>
      <tr>
        <td class="tableword">48 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���ܪ� </td>
        <td class="tableword">5 </td>
        <td class="tableword">�x�W�F�c </td>
        <td class="tableword">�s���^�� </td>
      </tr>
      <tr>
        <td class="tableword">49 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ��ѹC��O </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">������� </td>
      </tr>
      <tr>
        <td class="tableword">50 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> TSUBASA�l </td>
        <td class="tableword">9 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">CLAMP </td>
      </tr>
      <tr>
        <td class="tableword">51 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �������H </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">�`�����v </td>
      </tr>
      <tr>
        <td class="tableword">52 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �Įv�x�D�l�ǩ_�ƥ�ï </td>
        <td class="tableword">1 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�������� </td>
      </tr>
      <tr>
        <td class="tableword">53 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ��ߩ�i�� </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">�s�]���� </td>
      </tr>
      <tr>
        <td class="tableword">54 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �����^�� </td>
        <td class="tableword">1 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�Z���i�v </td>
      </tr>
      <tr>
        <td class="tableword">55 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �߲z�宥�� </td>
        <td class="tableword">1 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�R���q </td>
      </tr>
      <tr>
        <td class="tableword">56 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �S������� </td>
        <td class="tableword">0 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�p�����^ </td>
      </tr>
      <tr>
        <td class="tableword">57 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �H�֤ͤk </td>
        <td class="tableword">1 </td>
        <td class="tableword">�x�W���t </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">58 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �F�j�S�V�Z </td>
        <td class="tableword">6 </td>
        <td class="tableword">�x�W�F�c </td>
        <td class="tableword">�T�Ь��� </td>
      </tr>
      <tr>
        <td class="tableword">59 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> ���b�H </td>
        <td class="tableword">9 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�[�ä��E </td>
      </tr>
      <tr>
        <td class="tableword">60 </td>
        <td class="tableword">�֦~���e </td>
        <td class="tableword"> �ڬO�ë� </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">�Ӥ� </td>
      </tr>
    </table>    </td>
  </tr>
  <tr>
    <td colspan="2"><p>&nbsp;</p>      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
