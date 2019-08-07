<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/write.css" />
<script>
	$(document).ready(function() {
		$("#btnSave").click(function() {
			var title = $("#insertBoard input[name='title']");
			var content = $("#insertBoard textarea[name='content']");
			console.log(title);
			console.log(content);
			
			if(title.val() == "")
			{
				alert('제목을 입력하세요');
				title.focus();
				
				return;
			}
			else if(content.val() == "")
			{
				alert('내용을 입력하세요');
				content.focus();
				return;
			}
			
			document.getElementById("insertBoard").submit();
		});
	})
</script>
</head>
<body>

<div class="board" class="trigger">
	<div class="user">
		<img src="../resources/img/cat.PNG" />
		<span>${sessionScope.userName}</span>
		<span></span>
	</div>
	<p style="font-size: 20px" class="trigger">${sessionScope.userName}님, 오늘은 어떤 하루를 보냈나요?</p>
</div>

<div class="popup">
	<form id="insertBoard" class="popupItem" method="post" action="${path}/board/insert.do">
		<div class="board">
			<span class="close-button">&times;</span>
			<div class="user">
				<img src="../resources/img/cat.PNG" />
				<span>${sessionScope.userName}</span>
				<span></span>
			</div>
			<input name="title" id="insertTitle" placeholder="제목을 작성해 주세요.">
			<textarea name="content" id="insertContent" placeholder="내용을 작성해 주세요."></textarea>
			<input type="button" id="btnSave" value="게시">
		</div>
	</form>
</div>
<script type="text/javascript"> 
	var modal = document.querySelector(".popup"); 
	var trigger = document.querySelector(".trigger"); 
	var closeButton = document.querySelector(".close-button");

   function toggleModal() { 
		modal.classList.toggle("popupShow"); 
	}

   function windowOnClick(event) { 
		if (event.target === modal) { 
			toggleModal(); 
		} 
	}

	function c() {
		console.log('clicked');
	}

	trigger.addEventListener("click", toggleModal); 
	closeButton.addEventListener("click", toggleModal);
	window.addEventListener("click", windowOnClick); 
</script>

</body>
</html>