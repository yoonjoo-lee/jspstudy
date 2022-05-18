<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/basicstyle.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<h1>메인 페이지 입니다.</h1>
<%
if (session.getAttribute("midx") != null){
	out.println("회원 아이디 : " + session.getAttribute("memberId") + "<br>");
	out.println("회원 이름 : "  + session.getAttribute("memberName") + "<br>");
	
	out.println("<a href='"+ request.getContextPath() + "/member/memberLogout.do'>로그아웃</a><br>");
}
%>

<!-- [mvc방식] 가상경로(.do) 클릭 > 서버 > (web.xml코드로써)FrontController > 세분화Controller - 처리(Dao통해) -->
<a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입하기</a>
<a href="<%=request.getContextPath() %>/member/memberList.do">회원목록가기</a>
<a href="<%=request.getContextPath() %>/member/memberLogin.do">회원로그인</a>
<a href="<%=request.getContextPath() %>/board/boardWrite.do">게시판 글쓰기</a>
<a href="<%=request.getContextPath() %>/board/boardList.do">게시판 리스트</a>

 


</body>
</html>