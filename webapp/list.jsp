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
				
				<div class="commentWrite">
					<form action = "/board/${board.id}/comment" method="post">
					<input type="hidden" name="id" value="${board.id}">
					<input type="hidden" name="commentId" value="${comment.id}">
					<input type="text" name="contents"></input>
					<input type="submit" value="댓글쓰기" class="button">
				</form>
				</div>
				<a href="/board/${board.id}/modify"><button class="button">수정</button></a>
				<a href="/board/${board.id}/delete"><button class="button">삭제</button></a>
				
			</div>
			
		</c:forEach>
	</table>
	<script src="/javascripts/list.js"></script>
</body>
</html>