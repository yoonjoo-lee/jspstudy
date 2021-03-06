<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import = "java.util.*" %>
<%@page import = "jspstudy.domain.*" %>
<%
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
<title>글목록</title>
</head>
<body>


<form name="frm" action="<%=request.getContextPath()%>/board/boardList.do" method="post">
<table class="searchtable">
<tr>
<td>
<select name="searchType">
<option value="subject">제목</option>
<option value="writer">작성자</option>
</select>
 
<input type="text" name="keyword" size="10">
 
<input type="submit" name="submit" value="검색"> <!--submit 버튼 클릭시  searchType과 keyword를 action의 주소로 보냄 -->
</td>
</tr>
</table>
</form>




<table>
<thead>
<tr style = "color: green">
<th>bidx번호</th>
<th>제목 </th>
<th>작성자 </th>
<th>작성일</th> 
</tr>
</thead>


<% for (BoardVo bv : alist) {%>
<tbody>
<tr>
<td><%=bv.getBidx() %></td>
<td>
<%
for(int i = 1; i <= bv.getLevel_(); i++){
	out.print("&nbsp;&nbsp;");
	if (i==bv.getLevel_()){
		out.println("ㄴ");
	}
}
%>
<a href="<%=request.getContextPath() %>/board/boardContent.do?bidx=<%=bv.getBidx() %>"><%=bv.getSubject() %></a>
</td>
<td><%=bv.getWriter() %></td>
<td><%=bv.getWriteday() %></td>
</tr>

</tbody>
<% } %>

<tfoot  style="text-align:center;">
<tr>
<th colspan=4>
<% if (pm.isPrev() == true){
	out.println("<a href='"+request.getContextPath()+ "/board/boardList.do?page="+(pm.getStartPage()-1) + "&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+ pm.getScri().getSearchType()+"'>◀</a>");
}
	%>
 
<%
for (int i=pm.getStartPage(); i <= pm.getEndPage(); i++) {
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+ i +"&keyword=" +pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>"+i+"</a>");
}
%>
 
<% if (pm.isNext() && pm.getEndPage()>0){
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+(pm.getEndPage()+1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>▶</a>");
}
%>
</th>
</tr>
</tfoot>
</table>




</body>
</html>