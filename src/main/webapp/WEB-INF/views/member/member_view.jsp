<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 페이지</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function() {
		$("#BtnUpdate").click(function() {
			document.form1.action = "${path}/member/updateProc.do";
			document.form1.submit();	
		})
		
		$("#BtnDelete").click(function() {
			alert('삭제하시겠습니까?');
			document.form1.action = "${path}/member/delete.do";
			document.form1.submit();
		})
	})
</script>
<link rel="stylesheet" href="../resources/css/mypage.css" />
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<form id="memberView" name="form1" method="post">
	<h1>My Information</h1>
	<table width="400px">
		<tr>
			<td>ID</td>
			<td><input name="userId" value="${dto.userId}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input name="userName" value="${dto.userName}"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input name="userEmail" value="${dto.userEmail}"></td>
		</tr>
		<tr>
			<td>Register Date</td>
			<td><fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td>CHECK PW</td>
			<td><input type="password" name="userPw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<a id="BtnDelete">Cancel my Membership</a>
				<a id="BtnUpdate">Modify Information</a><br>
				<span>${message}</span>
			</td>
		</tr>
	</table>
</form>
</body>
</html>