<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�֤k���e</title>
</head>
<%
String login=(String)session.getAttribute("login");
if(login==null || login.equals("null")){
    response.sendRedirect("../member.jsp");
}
%>
<body>
<table width="80%" height="971" border="1" align="center" bgcolor="#FF00CC">
  <tr>
    <td width="10%" height="68">&nbsp;</td>
    <td width="90%"><p><a href="change.jsp">�����U���</a>�@<a href="check.jsp">�d�߭ɾ\���p</a>�@�w���s�ѡ@�u�W�վ\</p></td>
  </tr>
  <tr valign="top">
    <td><p>�A�n,���k</p>
        <p><a href="logout.jsp">�n�X</a></p></td>
    <td><table cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="7"><strong>�֤k���e���y�Ʀ� </strong>(2005-05-10 ~ 2005-06-10) </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td class="tabletitle" width="48"><strong>�W�� </strong></td>
        <td class="tabletitle" width="85"><strong>���O </strong></td>
        <td class="tabletitle" width="155"><strong>�ѦW </strong></td>
        <td class="tabletitle" width="68"><strong>�̷s���� </strong></td>
        <td class="tabletitle" width="86"><strong>�X���� </strong></td>
        <td class="tabletitle" width="86"><strong>�@�� </strong></td>
      </tr>
      <tr>
        <td class="tableword">1 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �k�k�������������O </td>
        <td class="tableword">20 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�z�ж��� </td>
      </tr>
      <tr>
        <td class="tableword">2 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �����p�j�i�ƽ� </td>
        <td class="tableword">12 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">���t���l </td>
      </tr>
      <tr>
        <td class="tableword">3 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �m�����H-�� </td>
        <td class="tableword">16 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�ۤt��l </td>
      </tr>
      <tr>
        <td class="tableword">4 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �s�t��s�v </td>
        <td class="tableword">10 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">��y�@ </td>
      </tr>
      <tr>
        <td class="tableword">5 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �R����ä�B </td>
        <td class="tableword">0 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�¨��� </td>
      </tr>
      <tr>
        <td class="tableword">6 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> NANA </td>
        <td class="tableword">12 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�ڿA�R </td>
      </tr>
      <tr>
        <td class="tableword">7 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �T�_�·R </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�C�D�h�E </td>
      </tr>
      <tr>
        <td class="tableword">8 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���k���n�� </td>
        <td class="tableword">7 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�ӶP�D�i </td>
      </tr>
      <tr>
        <td class="tableword">9 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ۤ�ө_�� </td>
        <td class="tableword">0 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�����l </td>
      </tr>
      <tr>
        <td class="tableword">10 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���]�V </td>
        <td class="tableword">27 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�M���¤l </td>
      </tr>
      <tr>
        <td class="tableword">11 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���c���y </td>
        <td class="tableword">0 </td>
        <td class="tableword">���� </td>
        <td class="tableword">�����l </td>
      </tr>
      <tr>
        <td class="tableword">12 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �������ըk������ </td>
        <td class="tableword">5 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�������l </td>
      </tr>
      <tr>
        <td class="tableword">13 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ����F�O </td>
        <td class="tableword">6 </td>
        <td class="tableword">���E </td>
        <td class="tableword">���u�y�t </td>
      </tr>
      <tr>
        <td class="tableword">14 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �����۫�f </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�u���� </td>
      </tr>
      <tr>
        <td class="tableword">15 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���k�O���~ </td>
        <td class="tableword">4 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�Q���� </td>
      </tr>
      <tr>
        <td class="tableword">16 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ʷR���� </td>
        <td class="tableword">9 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">����ȥ� </td>
      </tr>
      <tr>
        <td class="tableword">17 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ԷX���H���]�� </td>
        <td class="tableword">25 </td>
        <td class="tableword">�|�� </td>
        <td class="tableword">�˥��q </td>
      </tr>
      <tr>
        <td class="tableword">18 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �T�_-�ݤ����P�K </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�D���u�� </td>
      </tr>
      <tr>
        <td class="tableword">19 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���M�I�C�� </td>
        <td class="tableword">15 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">���ۯu�v </td>
      </tr>
      <tr>
        <td class="tableword">20 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �s���k��18�� </td>
        <td class="tableword">4 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�`����� </td>
      </tr>
      <tr>
        <td class="tableword">21 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �Q���֤k </td>
        <td class="tableword">9 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�s������ </td>
      </tr>
      <tr>
        <td class="tableword">22 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �R�����b�� </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�μťѨ� </td>
      </tr>
      <tr>
        <td class="tableword">23 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ��A���֦~ </td>
        <td class="tableword">14 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�˥ͯu�� </td>
      </tr>
      <tr>
        <td class="tableword">24 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �۰m </td>
        <td class="tableword">2 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�[�[�_�R </td>
      </tr>
      <tr>
        <td class="tableword">25 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �i�ƨtLOVERS </td>
        <td class="tableword">2 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�P������ </td>
      </tr>
      <tr>
        <td class="tableword">26 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ʷR���� </td>
        <td class="tableword">28 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�åХ��� </td>
      </tr>
      <tr>
        <td class="tableword">27 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �L�~�C�K��O </td>
        <td class="tableword">25 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">���� </td>
      </tr>
      <tr>
        <td class="tableword">28 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �Ѥ~�a�x-�� </td>
        <td class="tableword">11 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�G�c���l </td>
      </tr>
      <tr>
        <td class="tableword">29 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ����-�� </td>
        <td class="tableword">10 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">�c�O���| </td>
      </tr>
      <tr>
        <td class="tableword">30 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �N��A�ݤ��� </td>
        <td class="tableword">1 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�y�ж��� </td>
      </tr>
      <tr>
        <td class="tableword">31 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> 10�~���H������ </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">���T���� </td>
      </tr>
      <tr>
        <td class="tableword">32 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �C�@����u </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�T�s�`�l </td>
      </tr>
      <tr>
        <td class="tableword">33 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �H�Ϊ��L�� </td>
        <td class="tableword">3 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�N�Ь�� </td>
      </tr>
      <tr>
        <td class="tableword">34 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �Ѩ�X�K�y </td>
        <td class="tableword">1 </td>
        <td class="tableword">���E </td>
        <td class="tableword">���[���� </td>
      </tr>
      <tr>
        <td class="tableword">35 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �V�v�R���� </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�߭���� </td>
      </tr>
      <tr>
        <td class="tableword">36 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ʷR�ձ�-�k�����C�� </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">������J </td>
      </tr>
      <tr>
        <td class="tableword">37 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> H�ʷR�Ƕ� </td>
        <td class="tableword">4 </td>
        <td class="tableword">���E </td>
        <td class="tableword">���вz�f </td>
      </tr>
      <tr>
        <td class="tableword">38 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �n�ǥͪ��߱o </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">MIZUHO K </td>
      </tr>
      <tr>
        <td class="tableword">39 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ʩf��K�� </td>
        <td class="tableword">5 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�M�u�ݦn </td>
      </tr>
      <tr>
        <td class="tableword">40 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���~�����b </td>
        <td class="tableword">40 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�j�t���� </td>
      </tr>
      <tr>
        <td class="tableword">41 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ɪ������� </td>
        <td class="tableword">21 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�i���H�l </td>
      </tr>
      <tr>
        <td class="tableword">42 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ձЮv </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�ä��� </td>
      </tr>
      <tr>
        <td class="tableword">43 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ʤ��Z-�� </td>
        <td class="tableword">4 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�V��̰ </td>
      </tr>
      <tr>
        <td class="tableword">44 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �·R�k�� </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">������J </td>
      </tr>
      <tr>
        <td class="tableword">45 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���K���� </td>
        <td class="tableword">2 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">��w </td>
      </tr>
      <tr>
        <td class="tableword">46 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ڤ߷R���D�H </td>
        <td class="tableword">0 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�K�е�� </td>
      </tr>
      <tr>
        <td class="tableword">47 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���}���H�ƥ� </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">������l </td>
      </tr>
      <tr>
        <td class="tableword">48 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���e�B�I </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�l�t�l </td>
      </tr>
      <tr>
        <td class="tableword">49 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> SPARK!����-�� </td>
        <td class="tableword">2 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�s�Ф] </td>
      </tr>
      <tr>
        <td class="tableword">50 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���k�H�ήv </td>
        <td class="tableword">1 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�������l </td>
      </tr>
      <tr>
        <td class="tableword">51 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �F���y�HJUNKS </td>
        <td class="tableword">1 </td>
        <td class="tableword">���E </td>
        <td class="tableword">���F�G�l </td>
      </tr>
      <tr>
        <td class="tableword">52 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���~�R�H </td>
        <td class="tableword">0 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�s�ХѪ� </td>
      </tr>
      <tr>
        <td class="tableword">53 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �������@�� </td>
        <td class="tableword">5 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�H�Ь��� </td>
      </tr>
      <tr>
        <td class="tableword">54 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �x��p�� </td>
        <td class="tableword">3 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�ä��� </td>
      </tr>
      <tr>
        <td class="tableword">55 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ۼv�Ѩ� </td>
        <td class="tableword">16 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">���Ω`�� </td>
      </tr>
      <tr>
        <td class="tableword">56 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �̷R�Q���l </td>
        <td class="tableword">2 </td>
        <td class="tableword">���E </td>
        <td class="tableword">�s���u�� </td>
      </tr>
      <tr>
        <td class="tableword">57 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> ���d-�� </td>
        <td class="tableword">2 </td>
        <td class="tableword">�y�� </td>
        <td class="tableword">�L�C�z </td>
      </tr>
      <tr>
        <td class="tableword">58 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �R���]�O </td>
        <td class="tableword">2 </td>
        <td class="tableword">�F�� </td>
        <td class="tableword">�q���[�z </td>
      </tr>
      <tr>
        <td class="tableword">59 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �r�B����� </td>
        <td class="tableword">10 </td>
        <td class="tableword">�j�M </td>
        <td class="tableword">�ѶQ��´ </td>
      </tr>
      <tr>
        <td class="tableword">60 </td>
        <td class="tableword">�֤k���e </td>
        <td class="tableword"> �ʷRGOGO </td>
        <td class="tableword">0 </td>
        <td class="tableword">�L�s��� </td>
        <td class="tableword">�s���p�K </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
