<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jspstudy.domain.*" %>
<%
	BoardVo bv = (BoardVo)request.getAttribute("bv");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
<style>
div{
	float:right;
}
</style>
<title>게시판 내용</title>
</head>
<body>
<h1>게시판 내용보기</h1>
<table border=1>
<tr>
<td width="100">제목</td>
<td width="700"><%=bv.getSubject() %></td>
</tr>
<tr>
<td>내용</td>
<td height="200"><%=bv.getContent() %></td>
</tr>

<tr>
<td>파일다운로드</td>
<td >
<% if (bv.getFilename() != null) { %>
<img src="<%=request.getContextPath()%>/images/<%=bv.getFilename()%>">
<a href="<%=request.getContextPath()%>/board/fileDownload.do?filename=<%=bv.getFilename()%>"><%=bv.getFilename()%></a>

<%} %>
</td>
</tr>

<tr>
<td>작성자</td>
<td><%=bv.getWriter() %></td>
</tr>
<tr>
<td colspan=2 >
		<div>
		<input type="button" name ="modify" value="수정" onclick="location.href='<%=request.getContextPath()%>/board/boardModify.do?bidx=<%=bv.getBidx() %>'"> 
		<input type="button" name="delete" value="삭제" onclick="location.href='<%=request.getContextPath()%>/board/boardDelete.do?bidx=<%=bv.getBidx() %>'"> 
		<input type="button" name="reply" value="답변" onclick="location.href='<%=request.getContextPath()%>/board/boardReply.do?bidx=<%=bv.getBidx() %>&originbidx<%=bv.getOriginbidx()%>&depth=<%=bv.getDepth()%>&level_=<%=bv.getLevel_()%>'">
		<input type="button" name="list" value="목록" onclick="location.href='<%=request.getContextPath()%>/board/boardList.do'">
		</div>
</td>
</tr>
</table>
</body>
</html>