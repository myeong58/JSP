<%@page import="java.sql.PreparedStatement"%>
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
	<h2>회원 추가 테스트(executeUpdtae() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
		
	for(int i = 2; i<10; i++){
		String num = Integer.toString(i);
		String id = "test" + num;
		String pass = num + num + num + num;
		String name = "테스트" +num + "회원";
		
 		String sql = "INSERT INTO member VALUES(?, ?, ?, sysdate)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pass);
		psmt.setString(3,name);

		int inResutl = psmt.executeUpdate();
		out.println(inResutl +"행이 입력되었습니다.");
	}
	
	jdbc.close();	 
	%>
</body>
</html>