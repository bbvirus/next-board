<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/index.css" />
</head>
<body>
	<form action="/login" class=loginForm>
		<div class=inputBox>
			ID : <input type="text" name="userId" size="15"><br />
		</div>
		<div class=inputBox>
			PW : <input type = "text" name="password" size="15"><br />
		</div>
		<input type="submit" value="로그인">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>