<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
  <title> New Document </title> 
  <script>
  function check(){
  	
  	var fm = document.frm;
  	
  	if (fm.memberId.value ==""){
  		alert("아이디를 입력하세요");
  		fm.memberId.focus();
  		return;
  	}else if (fm.memberPwd.value ==""){
  		alert("비밀번호를 입력하세요");
  		fm.memberPwd.focus();
  		return;
  	}else if (fm.memberPwd2.value ==""){
  		alert("비밀번호 확인을 입력하세요");
  		fm.memberPwd2.focus();
  		return;
  	}else if (fm.memberPwd.value != fm.memberPwd2.value){
  		alert("비밀번호가 일치하지 않습니다.");
  		fm.memberPwd2.value = "";
  		fm.memberPwd2.focus();
  		return;
  	}else if (fm.memberName.value == ""){
  		alert("이름을 입력하세요");  		
  		fm.memberName.focus();
  		return;
  	}else if (fm.memberEmail.value == ""){
  		alert("이메일을 입력하세요");  		
  		fm.memberEmail.focus();
  		return;
  	}else if (fm.memberPhone.value == ""){
  		alert("연락처를 입력하세요");  		
  		fm.memberPhone.focus();
  		return;
  	}else if (fm.memberJumin.value == ""){
  		alert("주민번호를 입력하세요");  		
  		fm.memberJumin.focus();
  		return;
  	} else {
  	
  		var chkYn = false;  // 기본값
  		for(var i =0; i<fm.memberHobby.length; i++){
  			if (fm.memberHobby[i].checked == true){ //체크가 되어있다면
  				chkYn = true;
  				break;
  			}  		
  		}
  		if (chkYn == false){
  			alert("취미를 한개이상 선택해주세요")
  			return;
  		}
  		
  	
  	} 	
  	
  	//	fm.action = "./memberJoinOk.jsp";
  		fm.action = "<%=request.getContextPath()%>/member/memberJoinAction.do";
  		fm.method = "post";
  		fm.submit();
  	
  
   return;
  }
  
  </script>
 </head>

 <body>
<center><h1>회원가입</h1></center>
<hr></hr>
<form name="frm"> 
 <table>
<tr>
<td>아이디</td>
<td><input type="text" name="memberId" size="30"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="memberPwd" size="30"></td>
</tr>
<tr>
<td>비밀번호확인</td>
<td><input type="password" name="memberPwd2" size="30"></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="memberName" size="30"></td>
</tr>
<tr>
<td>이메일</td>
<td><input type="email" name="memberEmail" size="30"></td>
</tr>
<tr>
<td>성별</td>
<td>
<input type="radio" name ="memberGender" value="M" checked>남자
<input type="radio" name ="memberGender" value="F">여자
</td>
</tr>
<tr>
<td>지역</td>
<td><select name="memberAddr" style="width:100px;height:25px">
	<option value="서울">서울</option>
	<option value="대전">대전</option>
	<option value="전주">전주</option>
	</select>
</td>
</tr>
<tr>
<td>연락처</td>
<td>
<input type="text" name="memberPhone" size="30">
</td>
</tr>
<tr>
<td>주민번호</td>
<td><input type="number" name="memberJumin" size="30">	
</td>
</tr>

<tr>
<td>취미</td>
<td>
<input type="checkbox" name ="memberHobby" value="야구" checked>야구
<input type="checkbox" name ="memberHobby" value="축구">축구
<input type="checkbox" name ="memberHobby" value="농구">농구
</td>
</tr>

<tr>
<td>버튼</td>
<td>
<input type="button" name ="btn" value="확인" onclick="check();"> 
<input type="reset" value="다시작성"> 
</td>
</tr>
 </table>
 </form>
 </body>
</html>
