<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspstudy.domain.*" %>
<%
	BoardVo bv = (BoardVo)request.getAttribute("bv");
if (session.getAttribute("midx") == null){
	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
<title>게시판 수정하기</title>
<script>
function check(){
	var fm = document.frm;
	
		fm.action = "<%=request.getContextPath()%>/board/boardModifyAction.do";
  		fm.method = "post"; 
  		fm.submit(); 
  		
  	return;
}
</script>
<style>
div{
	float : right;
}
</style>
</head>
<body>
<h1>게시판 수정하기</h1>
<form name="frm"> 
<table border=1>
<tr>
	<td>제목</td>
	<td><input type="text" name="subject" size="50" value=<%=bv.getSubject() %>></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea placeholder="내용을 입력해주세요." name="content" cols="100" rows="20" ><%=bv.getContent() %></textarea></td>
</tr>
<tr>
	<td>작성자</td>
	<td><input type="text" name="writer" size="50" value=<%=bv.getWriter() %>></td>
</tr>
<tr>
	<td colspan=2>
		<div>
		<input type="button" name ="btn" value="확인" onclick="check()"> 
		<input type="reset" value="취소" > 
		<input type=hidden name="bidx" value=<%=bv.getBidx() %>>
		</div>
	</td>
</tr>
</table>
</form>
</body>
</html>