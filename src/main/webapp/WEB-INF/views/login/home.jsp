<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
	window.onload = function() {
		location.href = "${path}/board/list.do";
	}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<c:if test="${msg == 'success'}">
		<p>${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</p>
	</c:if>
</body>
</html>