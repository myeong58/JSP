<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Page 지시어 - errorPage, isErrorPage 속성</h1>
	<%
		int myAge = Integer.parseInt(request.getParameter("age")); 
		out.println("10년후 당신의 나이는 " + (myAge+10) +"입니다.");

	%>

</body>
</html>