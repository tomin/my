<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<div align="center"> 
  <p>�ӤH�ƭ���</p>
  <table width="70%" border="1">
    <tr> 
      <td width="50%" align="center"> <form name="form1" method="post" action="template.jsp">
          <p>�\Ū�˪� </p>
          <p> �r���j�p 
            <select name="select1">
              <option value="8">�p</option>
              <option value="12" selected>�w�]</option>
              <option value="16">�j</option>
              <option value="20">�S�j</option>
            </select>
          </p>
          <p> �r�� 
            <select name="select2">
              <option value="�ө���">�ө���</option>
              <option value="�s�ө���" selected>�s�ө���</option>
              <option value="�з���">�з���</option>
              <option value="Times New Roman">Times New Roman</option>
            </select>
          </p>
          <p>��r�C�� 
            <select name="select3">
              <option value="FFFFFF">�զ�</option>
              <option value="000000" selected>�¦�</option>
              <option value="darkgreen">�`���</option>
              <option value="lightblue ">�`�Ŧ�</option>
              <option value="orange">���</option>
              <option value="purple">����</option>
              <option value="hotpink">������</option>
            </select>
          </p>
          <p>�q����Z 
            <select name="select4">
              <option value="25">�p</option>
              <option value="30" selected>�w�]</option>
              <option value="35">�j</option>
              <option value="45">�S�j</option>
            </select>
          </p>
          <p>�r���e�� 
            <select name="select5">
              <option value="-3">��</option>
              <option value="3" selected>�w�]</option>
              <option value="6">�e</option>
              <option value="10">�W�e</option>
            </select>
          </p>
          <p>�I���C�� 
            <select name="select6">
              <option value="black">�¦�</option>
              <option value="white" selected>�զ�</option>
              <option value="chocolate">���J�O��</option>
              <option value="lightblue ">�`�Ŧ�</option>
              <option value="orange">���</option>
              <option value="purple">����</option>
              <option value="hotpink">������</option>
            </select>
          </p>
          <p> �I���Ϯ� 
            <select name="select7">
              <option value="blank.gif" selected>�L</option>
              <option value="bluebear.jpg">�Ŧ�p��</option>
              <option value="bluestar.jpg">�Ŧ�y�P</option>
              <option value="pinkstar.jpg">������y�P</option>
              <option value="sunflower.gif">�V�鸪</option>
              <option value="bluewall.gif">�Ŧ����</option>
              <option value="pinkwall.gif">���������</option>
              <option value="greenwall.gif">������</option>
            </select>
          </p>
          <p> 
            <input type="submit" name="Submit2" value="���">
          </p>
        </form></td>
      <td width="50%" align="center"><form name="form2" method="post" action="password.jsp">
          <p>�K�X���</p>
          <p> �s���K�X�G 
            <input type="password" name="textfield1">
          </p>
          <p> �K�X�T�{ �G 
            <input type="password" name="textfield2">
          </p>
          <p> ��l�K�X�G 
            <input type="password" name="textfield3">
          </p>
          <p> 
            <input type="submit" name="Submit222" value="���">
          </p>
        </form></td>
    </tr>
    <tr> 
      <td><form name="form3" method="post" action="">
          <div align="center"> 
            <p>�\Ū�ߺD</p>
            <p> 
              <input type="radio" name="radiobutton" value="radiobutton">
              �C���\Ū�q�W�������`�~��<br>
              <input type="radio" name="radiobutton" value="radiobutton">
              �C���\Ū�q�Y�}�l</p>
            <p> 
              <input type="checkbox" name="checkbox22" value="checkbox">
              �C�j 
              <input name="textfield" type="text" value="5" size="10">
              ������A�۰ʴ���</p>
            <p> 
              <input type="checkbox" name="checkbox222" value="checkbox">
              �ϥΤ@���s���\�� </p>
            <p> 
              <input type="radio" name="radiobutton" value="radiobutton">
              �@���s���Ҧ����`</p>
            <p> 
              <input type="radio" name="radiobutton" value="radiobutton">
              �@���s�� 
              <input name="textfield6" type="text" value="3" size="8">
              �ӳ��`<br>
            </p>
            <p> 
              <input type="submit" name="Submit23" value="���">
            </p>
          </div>
        </form></td>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <div align="center">
                <p>���p�v�O�K</p>
                <p> 
                  <input type="checkbox" name="checkbox23" value="checkbox">
                  �����椽�}</p>
                <p> 
                  <input type="checkbox" name="checkbox232" value="checkbox">
                  �M���s������ </p>
                <p> 
                  <input type="checkbox" name="checkbox2322" value="checkbox">
                  ��L�H�i�H�ݨ�ڹ�C���Ѫ����O</p>
                <p><br>
                  <input type="checkbox" name="checkbox2323" value="checkbox">
                  ��L�H�i�H�^���ڹ�C���Ѫ����O</p>
                <p> 
                  <input type="submit" name="Submit242" value="���">
                </p>
              </div>
              <p>&nbsp;</p>
              </div>
          </form>
        </div></td>
    </tr>
    <tr>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>���ҳ]�w</p>
              <p> 
                <input type="checkbox" name="checkbox2" value="checkbox">
                �n�J��A�۰ʫe�������� </p>
              <p> 
                <input type="submit" name="Submit24" value="���">
              </p>
              <p>&nbsp; </p>
              <p>&nbsp;</p>
            </div>
          </form>
        </div></td>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>�d�߳]�w</p>
              <p> �@���C�X 
                <input name="textfield5" type="text" value="10" size="10">
                ���ŦX���</p>
              <p> 
                <input type="submit" name="Submit243" value="���">
              </p>
            </div>
          </form>
        </div></td>
    </tr>
    <tr> 
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>�]�w�峹</p>
              <p> 
                <input type="checkbox" name="checkbox" value="checkbox">
                ���H�^�Ф峹�ɡA�۰ʱH�H���� </p>
              <p> 
                <input type="submit" name="Submit22" value="���">
              </p>
            </div>
          </form>
        </div></td>
      <td><div align="center"> 
          <form name="form3" method="post" action="">
            <div align="center"> 
              <p>�|���v�Q</p>
              <p> 
                <input type="checkbox" name="checkbox26" value="checkbox">
                �q�\�q�l�� </p>
              <p> 
                <input type="submit" name="Submit245" value="���">
              </p>
            </div>
          </form>
        </div></td>
    </tr>
  </table>


</div>