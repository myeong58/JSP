<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>액션 태그로 폼값 한 번에 받기</h3>
	<jsp:useBean id="person" class="common.Person" />
	<jsp:setProperty name="person" property="*"/>
	<ul>
		<li>이름: <jsp:getProperty property="name" name="person"/>  </li>
		<li>나이: <jsp:getProperty property="age" name="person"/>  </li>
	</ul>
</body>
</html>