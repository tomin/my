<%@ page contentType="text/html; charset=big5" %>
<%@ include file="../include/head.jsp" %>

<script language="javascript">
function checkdata() {
   	var id = document.form.textfield0.value;
	var pass1 = document.form.textfield1.value;
	var pass2 = document.form.textfield2.value;	
	var email = document.form.textfield3.value;	
   	if(id==""){
   		alert("�b���@�w�n��I");
		return false;
	}
   	else if(pass1==""){
   		alert("�K�X�@�w�n��I");
		return false;
	}
   	else if(pass2==""){
   		alert("�K�X�T�{�@�w�n��I");
		return false;
	}
   	else if(email==""){
   		alert("�q�l�H�c�@�w�n��I");
		return false;
	}	
   	else if(pass1!=pass2){
   		alert("�K�X�P�K�X�T�{���ŦX�I");
		return false;
	}						
	else{
		return true;
	}			
}
</script>

<div align="center"> 
  <p>&nbsp;</p>
  <p>���U�|�� <a href="about:blank">(����)</a></p>
  <form name="form" method="post" action="register_deal.jsp">
    <table width="50%" border="0">
      <tr>
        <td><div align="right">�b���G</div></td>
        <td><input type="text" name="textfield0"></td>
      </tr>
      <tr>
        <td><div align="right">�K�X�G</div></td>
        <td><input type="password" name="textfield1"></td>
      </tr>
      <tr>
        <td><div align="right">�K�X�T�{�G</div></td>
        <td><input type="password" name="textfield2"></td>
      </tr>
      <tr>
        <td><div align="right">�q�l�H�c�G</div></td>
        <td><input type="text" name="textfield3"></td>
      </tr>
    </table>
    <p> 
		<input type="submit" name="Submit" value="�ӽ�" onClick="return checkdata()">
	  </p>
	  </form>
</div>