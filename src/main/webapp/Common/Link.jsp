<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="90%">
	<tr>
		<td align="center">
			<% if(session.getAttribute("UserId") == null) { %>
			<a href="../06Session/LoginForm.jsp">로그인</a>
			<%} else { %>
			<a href="../06Session/Logout.jsp">로그아웃</a>
			<%} %>
			
			&nbsp;&nbsp;&nbsp;
			<!-- <a href="../06Session/List.jsp">게시판(페이징x)</a> -->
			<a href="../08Board/List.jsp">게시판(페이징x)</a>
			&nbsp;&nbsp;&nbsp;
			<a href="../09PaginBoard/List.jsp">게시판(페이징o)</a>
		</td>
	</tr>
</table>