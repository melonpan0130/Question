<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./include/header.jsp" %>
</head>
<body>
<%@ include file="./include/menu.jsp" %>
	<img src="resources/img/cat.PNG"/>
	<br />
	<c:choose>
		<c:when test="${sessionScope.userName == null}">
			<h2>환영합니다.</h2>
		</c:when>
		<c:otherwise>
			<h2>${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>
