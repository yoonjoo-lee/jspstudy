<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>메인 페이지 입니다.</h1>

<a href="<%=request.getContextPath() %>/member/memberJoin.do">회원가입하기</a> 
<a href="<%=request.getContextPath() %>/member/memberList.do">회원 목록가기</a>
<a href="<%=request.getContextPath() %>/member/memberLogin.do">회원 로그인</a>
<a href="<%=request.getContextPath() %>/board/boardWrite.do">게시판 글쓰기</a>
<a href="<%=request.getContextPath() %>/board/boardList.do">게시판 리스트</a>


</body>
</html>