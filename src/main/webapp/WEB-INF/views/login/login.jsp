<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../resources/css/login.css" />
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			
			if(userId == "")
			{
				alert("아이디를 입력하세요.");
				$("#userId").focus();
				return;
			}
			else if (userPw == "")
			{
				alert("비밀번호를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			document.form1.submit();
		})
	})
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form id="loginForm" name="form1" action="${path}/login/loginCheck.do">
	<h1>Sign In</h1>
	<table>
		<tr>
			<td><label for="userId">ID</label></td>
			<td><input name="userId" id="userId"></td>
		</tr>
		<tr>
			<td><label for="userPw">PW</label></td>
			<td><input type="password" name="userPw" id="userPw"></td>
		</tr>
	</table>
	<c:if test="${meg=='failure'}">
		<div>아이디 또는 비밀번호가 맞지 않습니다.</div>
	</c:if>
	<c:if test="${msg=='logout'}">
		<div>로그아웃 되었습니다.</div>
	</c:if>

	<a id="btnLogin">Sign In</a>
</form>
</body>
</html>