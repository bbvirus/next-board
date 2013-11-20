<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/form.css" />
</head>

<body>

	<div id="wrap">
		<header>
			<h1> 글쓰기 화면 임다</h1>
		</header>
		<div id="formArea">
			<form action="/board" method="post" enctype="multipart/form-data">
				 제목 : <input type="text" name="title" size=30 placeholder="title"> <br />
				<textarea name="contents" rows="10" cols="50"></textarea><br />
				<input type="file" name="file" size="50"><br />
				<input type="submit" value="보내기">
			</form>
		</div>
		
	</div>
	
</body>

</html>