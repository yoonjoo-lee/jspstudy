<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<HTML>
 <HEAD>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="${pageContext.request.contextPath}/css/basicstyle.css" rel="stylesheet">
  <TITLE> New Document </TITLE> 
  <script>
  function check(){
  	
  	var fm = document.frm;
  	
  	if (fm.memberId.value ==""){
  		alert("���̵� �Է��ϼ���");
  		fm.memberId.focus();
  		return;
  	}else if (fm.memberPwd.value ==""){
  		alert("��й�ȣ�� �Է��ϼ���");
  		fm.memberPwd.focus();
  		return;
  	}
  	 	
  		fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.do";
  		fm.method = "post";
  		fm.submit();
  	
  
   return;
  }
  
  </script>
 </HEAD>

 <BODY>
<center><h1>�α���</h1></center>
<hr></hr>
<form name="frm"> 
 <table>
<tr>
<td>���̵�</td>
<td><input type="text" name="memberId" size="30"></td>
</tr>
<tr>
<td>��й�ȣ</td>
<td><input type="password" name="memberPwd" size="30"></td>
</tr>
<tr>
<td>��ư</td>
<td>
<input type="button" name ="btn" value="Ȯ��" onclick="check();"> 
<input type="reset" value="�ٽ��ۼ�"> 
</td>
</tr>
 </table>
 </form>
 </BODY>
</HTML>
