<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판  -  비밀번호 검증(Pass)</h2>
	<form method="post">
		<input type="hidden" name="idx" value="<%=request.getParameter("mode")%>">
		<input type="hidden" name="mode" value="${param.mode}">
		
		<table border="1" width="90%">
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass" sytle="width:100px;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">전송하기</button>
					<button type="reset">RESET</button>
					<button type="button" onclick="location.href='/mvcboard/list.do'">
					목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>