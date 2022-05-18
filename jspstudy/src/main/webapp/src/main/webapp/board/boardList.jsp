<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.util.ArrayList" %>
<%@page import ="jspstudy.domain.*" %>
<% 
ArrayList<BoardVo> alist  = (ArrayList<BoardVo>)request.getAttribute("alist");
PageMaker pm = (PageMaker)request.getAttribute("pm");

%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
<H1>게시글목록 리스트</H1>

<table border=1 style="width:800px">
<tr style="color:green;">
<th>bidx번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
</tr>

<% for (BoardVo bv : alist) {%>
<tr>
<td><%=bv.getBidx() %></td>
<td>
<%
for(int i=1;i<=bv.getLevel_();i++){
	out.print("&nbsp;&nbsp;");
	if (i== bv.getLevel_()){
		out.println("ㄴ");
	}	
}
%>
<a href="<%=request.getContextPath() %>/board/boardContent.do?bidx=<%=bv.getBidx() %>"><%=bv.getSubject() %></a>
</td>
<td><%=bv.getWriter() %></td>
<td><%=bv.getWriteday() %></td>
</tr>
<% } %>

</table>
<table border=0 style="width:800px;text-align:center;">
<tr>
<td style="width:200px;text-align:right;">
<% if (pm.isPrev() == true){
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+(pm.getStartPage()-1)+"'>◀</a>");
	}
%>  
</td>
<td>

<%
for (int i=pm.getStartPage(); i<= pm.getEndPage();i++){
out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+i+"'>"+i+"</a>");	
}
%>
</td>
<td style="width:200px;text-align:left;">
<% if(pm.isNext() && pm.getEndPage() >0) {
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+(pm.getEndPage()+1)+"'>▶</a>");	
	}  
%> 
</td>
</tr>
</table>

</body>
</html>