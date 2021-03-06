<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp" %>
<title>회원 목록</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원 목록</h2>
<input type="button" value="회원 추가" onclick="location.href=${path}/member/write.do">
<table border="1" width="700px">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>회원가입 일자</th>
	</tr>
	<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.userId}</td>
		<td><a href="${path}/member/view.do?userId=${row.userId}">${row.userName}</a></td>
		<td>${row.userEmail}</td>
		<td>${row.userRegdate}</td>
	<tr>
	</c:forEach>
</table>
</body>
</html>