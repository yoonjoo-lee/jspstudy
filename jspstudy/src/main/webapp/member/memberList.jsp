<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "jspstudy.domain.*" %>
<%@ page import = "java.util.*" %>
<%
//	MemberDao md = new MemberDao();
//	ArrayList<MemberVo> alist = md.memberSelectAll();
//	out.println(alist.get(0).getMembername() + "<br>");

	ArrayList<MemberVo> alist = (ArrayList<MemberVo>)request.getAttribute("alist");

%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
<title>Insert title here</title>
</head>
<body>

 
<table>
<thead>
<tr>
<th>��ȣ</th>
<th>ȸ���̸� </th>
<th>ȸ������ó </th>
<th>�ۼ���</th> 
</tr>
</thead>
<% for (MemberVo mv : alist) {%>
<tbody>
<tr>
<td><%=mv.getMidx() %></td>
<td><%=mv.getMembername() %></td>
<td><%=mv.getMemberphone() %></td>
<td><%=mv.getWriteday() %></td>
</tr>
</tbody>
<% } %>

</table>
</body>
</html>