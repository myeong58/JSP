<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	
	<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT id, pass, name, regidate FROM member";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	String id = "test5"; String pw = "5555";
	
	while (rs.next()){
		if(rs.getString(1).equals(id) && rs.getString(2).equals(pw)){
			String name = rs.getString("name");
			out.println(String.format("user name : %s", name) + "<br>");
		}
	}
	
	jdbc.close();
	%>
</body>
</html>