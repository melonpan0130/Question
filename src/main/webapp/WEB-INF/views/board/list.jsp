<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp" %>
<title>Question</title>
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			location.href="${path}/board/write.do";
		});
	});
	
	function list(page) {
		location.href="${path}/board/list.do?curPage="+page+"&searchOption=${map.seachOption}&keyword=${map.keyword}";
	}
</script>
<link rel="stylesheet" type="text/css" href="../resources/css/list.css" />
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div id="content">
<!-- <table border="1" width="700px">
	<tr>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>

	<c:forEach var="row" items="${map.list}">
	<tr>
		<td><a href="${path}/board/view.do?bno=${row.bno}
			&curPage=${map.boardPager.curPage}
			&searchOption=${map.searchOption}
			&keyword=${map.keyword}">${row.title}</a>
			<c:if test="${row.recnt>0}">
				<span style="color:red">[${row.recnt}]</span>
			</c:if>
		</td>
		<td>${row.writer}</td>
		<td>${row.content}</td>
		<td>${row.regdate}</td>
		<td>${row.viewcnt}</td>
	<tr>
	</c:forEach>
	
	<tr>
		<td colspan="5">
			<c:if test="${map.boardPager.curBlock>1}">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.boardPager.curBlock>1}">
				<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.boardPager.blockBegin}"
				end="${map.boardPager.blockEnd}">
				<c:choose>
					<c:when test="${num==map.boardPager.curPage}">
						<span style="color:red">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
				<a href="javascript:list('${map.boardPager.nextPage }')">[다음]</a>
			</c:if>
			<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
				<a href="javascript:list('${map.boardPager.totPage }')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table> -->

	<c:if test="${sessionScope.userId != null }">
		<%@ include file="write.jsp" %>
	</c:if>
	
	<c:forEach var="row" items="${map.list}">
		<div class="board">
			<a href="${path}/board/view.do?bno=${row.bno}
			&curPage=${map.boardPager.curPage}
			&searchOption=${map.searchOption}
			&keyword=${map.keyword}">
				<div class="user">
					<img src="../resources/img/cat.PNG" />
					<span>${row.writer}</span>
					<span>${row.regdate}</span>	
				</div>
				<h2>${row.title}</h2>
				<p>${row.content}</p>
				<div class="foot">
					<span><img src="../resources/img/flag.png">조회수 ${row.viewcnt}회</span>
					<span>댓글 ${row.recnt}개</span>
				</div>
			</a>
		</div>
	</c:forEach>
</div>
</body>
</html>