<%@page import="java.util.List"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
List<MemberDTO> list = dao.getAllList(); 
dao.close();

%>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>가입일</th>
		</tr>
		<%
			for(MemberDTO dto :list){
		%>
		<tr>
			<th><%=dto.getId() %></th>
			<th><%=dto.getPass() %></th>
			<th><%=dto.getName() %></th>
			<th><%=dto.getRegidate() %></th>
		</tr>
		<%
			}
		%>
		
	</table>
	<a href="LoginForm.jsp">로그인 화면 이동</a>

</body>
</html>