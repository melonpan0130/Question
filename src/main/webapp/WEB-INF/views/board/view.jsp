<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp" %>
<title>게시글 보기</title>
<script>

$(document).ready(function() {
	listReply2();
	
	// 게시글 수정
	$("#BtnUpdate").click(function() {
		var title = $("#title").val();
		var content = $("#content").val();
		var writer = $("#writer").val();
		
		if(title == "")
		{
			alert("제목이 없습니다.");
			document.form1.title.focus();
			return;
		}
		else if(content == "")
		{
			alert("내용이 없습니다.");
			doucment.form1.content.focus();
			return;
		}
		else if(writer == "")
		{
			alert("작성자가 없습니다.");
			document.form1.writer.focus();
			return;
		}
		
		document.form1.action = "${path}/board/update.do";
		document.form1.submit();	
	})
	
	// 게시글 삭제
	$("#BtnDelete").click(function() {
		alert('삭제하시겠습니까?');
		document.form1.action = "${path}/board/delete.do";
		document.form1.submit();
	})
	
	// 댓글 작성 (ajax)
	$('#btnReply').click(function() {
		var replytext = $("#replytext").val();
		var bno = "${dto.bno}";
		var secret = $("#secret").val()?"1":"0";
		var param = "replytext="+replytext+"&bno="+bno+"&secret="+secret;
		$.ajax({
			type : "post",
			url : "${path}/reply/insert.do",
			data : param,
			success : function() {
				alert('댓글이 등록 되었습니다.');
				listReply2();
			}
		});
	});
	
	$("#btnList").click(function() {
		location.href="${path}/board/list.do?";
		history.back();
	});
	
	$("#replyDelete").click(function() {
		
	});
})

function listReply2() {
	$.ajax({
		type:"post",
		url : "${path}/reply/listJson.do?bno=${dto.bno}",
		success : function(result) {
			var output = "<table border='1'>";
			for(var i in result) {
				output += "<tr>";
				output += "<td>" + result[i].userName;
				output += "("+changeDate(result[i].regdate)+")<br>";
				output += result[i].replytext;
				output += "&nbsp";
				output += "<a href='${path}/reply/modify.do?rno=" + result[i].rno + "'>수정</a>";
				output += "&nbsp";
				output += "<a href='${path}/reply/delete.do?rno=" + result[i].rno + "' >삭제</a>";
				output += "</td>";
				output += "</tr>";
			}
			output += "</table>"
			$("#replytext").val("");
			
			$("#secret").prop('checked', false);
			$("#listReply").html(output);
		}
	})
}

function changeDate(date) {
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth();
	day = date.getDate();
	hour = date.getHours();
	minute = date.getMinutes();
	second = date.getSeconds();
	strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return strDate;
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시글 보기</h2>
<form name="form1">
<table width="700px">
	<tr>
		<th>작성일자</th>
		<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy MM-dd a HH:mm:SS" /></td>
	<tr>
	<tr>
		<th>조회수</th>
		<td>${dto.viewcnt}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input name="title" id="title" value="${dto.title}"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="4" cols="80" name="content" id="content">${dto.content }</textarea></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><!-- <input name="writer" value="${dto.writer}" id="writer">--><c:out value="${sessionScope.userId}" /></td>
		<input type="hidden" name="writer" value="${dto.writer}" id="writer">
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="bno" value="${dto.bno }">
			
			<c:if test="${sessionScope.userId==dto.writer}">
				<button id="BtnUpdate">수정</button>
				<button id="BtnDelete">삭제</button><br>
			</c:if>
			
			<button type="button" id="btnList">목록</button>
		</td>
	</tr>
</table>
</form>
	<div style="width:650px; text-align:center">
		<c:if test="${sessionScope.userId != null}">
			<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해 주세요"></textarea>
			<input type="checkbox" name="secret" id="secret" value="1"><label name="secret">비밀 댓글</label><br>
			<button type="button" id="btnReply">댓글 작성</button>
		</c:if>
	</div>
	<div id="listReply"></div>
</body>
</html>