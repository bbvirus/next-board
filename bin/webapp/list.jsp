<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>닥전닥후</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/list.css" />
<script>

	function initPage(){
		countComments();
		registerEvents();
	}
	
	function countComments(){
		var commentAreaList = document.querySelectorAll('.commentArea');
		for(var i=0; i<commentAreaList.length; i++){
			var currentNode = commentAreaList[i];
			var numOfEachComment = currentNode.querySelectorAll('#eachComment').length;
			currentNode.parentNode.childNodes[12].textContent = numOfEachComment + "개의 댓글";
		}
	}
	
	function registerEvents(){
		var eleList = document.getElementsByClassName("numOfComment");
		for(var i=0; i<eleList.length; i++){
			eleList[i].addEventListener('click', toggleComments, false);
		}	
	}
	
	function toggleComments(e){
		var commentBodyNode = e.target.nextElementSibling;
		var currentStyle = window.getComputedStyle(commentBodyNode).getPropertyValue("display");
		if(currentStyle === "none"){
			commentBodyNode.style.display = "inline";
		}
		else if(currentStyle === "inline"){
			commentBodyNode.style.display = "none";
		}
	}
	
	window.onload = initPage;
	
	var formList = document.querySelectorAll('.commentWrite input[type=submit]');!
	for ( var j=0 ; j < formList.length ; j++) {
		formList[j].addEventListener('click', writeComments, false);
	}
	
	function writeComments(e){
		e.preventDefault(); //submit 이 자동으로 동작하는 것을 막는다.
		var eleForm = e.currentTarget.form; //form element
		var oFormData = new FormData(eleForm); //form data들을 자동으로 묶어준다.
		var sID = eleForm[0].value;
		var url = "/board/" +sID + "/comments.json";
		var request = new XMLHttpRequest();
		request.open("POST" , url, true);
		request.send(oFormData);
	}
	</script>

</head>

<body>

	<!-- 화면 상단의 메뉴 바 -->
	<div id="menu">
		<img src="/images/versus.png" height="40">
	</div>
	
	<!-- 글쓰기 기능을 제공하는 영역 -->
	<div class="formArea">
		<form action="/board" method="post" enctype="multipart/form-data">
			<input type="text" name="title" size=41 placeholder="제목" id="createBox"> <br />
			
			<label class="fileUploadButton">
				<span>
					<input type="file" id="firstFile" name="firstFile"> versus
					<input type="file" id="secondFile" name="secondFile"><br />
				</span>
			</label>
			
			<textarea name="contents" rows="5" cols="40" placeholder="내용" id="createBox"></textarea><br />
			<input type="submit" value="Post">
		</form>
	</div>
	
	<!-- 글의 리스트를 보여주는 영역 -->
	<table>
		<c:forEach items="${boardList}" var="board">
			
			<div class="eachArticle">
				<a href="/board/${board.id}" id="title">${board.getTitle()}</a><br />
				
				<span class="image">
					<c:if test="${not empty board.getFirstFileName()}">
						<img src="/images/${board.getFirstFileName()}" class="image">
					</c:if>
				</span>
				vs
				<span class="image">
					<c:if test="${not empty board.getSecondFileName()}">
						<img src="/images/${board.getSecondFileName()}" class="image">
					</c:if>
				</span>	<br />
				
				<div>${board.getContents()}</div>
				
				
				<div class="numOfComment"></div>
				
				<div class="commentArea">
					<c:forEach items="${board.commentList}" var="commentList">
						<div id="eachComment">
							${commentList.contents}
							<form action = "/board/${board.id}/comment/${comment.id}/delete" method="post">
								<input type="submit" value="댓글삭제">
							</form>
							<br />
						</div>
					</c:forEach>
				</div>
				
				<form action = "/board/${board.id}/comment" name=commentWrite method="post">
					<input type="hidden" name="id" value="${board.id}">
					<input type="text" name="contents"></input>
					<input type="submit" value="댓글쓰기" class="button">
				</form>
				
				<a href="/board/${board.id}/modify"><button class="button">수정</button></a>
				<a href="/board/${board.id}/delete"><button class="button">삭제</button></a>
				
			</div>
			
		</c:forEach>
	</table>
</body>
</html>