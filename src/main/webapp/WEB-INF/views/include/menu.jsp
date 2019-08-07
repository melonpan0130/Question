<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
</head>
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div id="menu" style="text-align : center;" >
	<div>
		<h1 id="logo">Q</h1>
		<form action="" name="search" id="search">
			<select name="searchOption" class="search">
				<option value="all" <c:out value="${map.searchOption=='all'?'selected':''}"/> >제목+이름+내용</option>
				<option value="writer" <c:out value="${map.searchOption=='writer'?'selected':''}"/> >이름</option>
				<option value="content" <c:out value="${map.searchOption=='content'?'selected':''}"/> >내용</option>
				<option value="title" <c:out value="${map.searchOption=='title'?'selected':''}"/> >제목</option>
			</select>
			<input name="keyword" value="${map.keyword}" class="search">
			<button name="submit" class="search"></button>
		</form>
		<c:choose>
			<c:when test="${sessionScope.userName == null}">
				<a href="${path}/login/login.do">Sign In</a>
				<a href="${path}/board/list.do">Question</a>
			</c:when>
			<c:otherwise>
				<a href="${path}/login/logout.do">Sign Out</a>
				<a href="${path}/board/list.do">Question</a>
				<ul id="userInfo">
					<li>
						<a href="#">
							<div id="menu_user"> <!--${path}/member/list.do-->
								<img src="${pageContext.request.contextPath}/resources/img/cat.PNG" />
								<span>${sessionScope.userName}</span>
							</div>
						</a>
					
					<ul>
						<li><a href="${path}/member/view.do?userId=${sessionScope.userId}">Informaion</a></li>
						<li><a href="">Friends</a></li>
						<li><a href="">My Board</a></li>
					</ul>
				</li>
				</ul>
			</c:otherwise>
		</c:choose>
		<!-- <a href="${path}">MAIN</a> -->
	</div>
</div>
</body>
</html>