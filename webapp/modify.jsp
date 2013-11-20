<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 페이지</title>
</head>
<body>
	<h1>modifyForm</h1>
	<div>
		<h2>수정 전</h2>
		제목 : ${board.title} <br />
		내용 : ${board.contents } <br />
		이미지 : <img src="/images/${board.fileName}">
		
		<h2>수정 사항</h2>
		<form action="/board/${board.id}/modifyForm" method="post" enctype="multipart/form-data">
			제목 : <input type="text" name="title" size=40><br />
			<textarea name="contents" rows="10" cols="50"></textarea><br />
			<input type="file" name="file" size="50"><br />
			<input type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>