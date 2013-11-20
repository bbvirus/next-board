<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	제목 : ${board.title}<br />
	내용 : ${board.contents }<br />
	
	<c:if test="${not empty board.fileName}">
		파일이름 : ${board.fileName}<br />
		<img src="/images/${board.fileName}" width=640 height=480><br />
	</c:if>
	
	<a href="/board/${board.id}/modify"><button>수정</button></a>
	<a href="/board/${board.id}/delete"><button>삭제</button></a>
	<a href="/board/form"><button>글쓰기</button></a>
	<a href="/board/list"><button>목록으로</button></a><br />
	
	<table>
		<c:forEach items="${board.commentList}" var="commentList">
			${commentList.contents}<br />
		</c:forEach>
	</table>
	
	<form action = "/board/${board.id}/comment" method="post">
		<textarea name="contents" rows="5" cols="60"></textarea>
		<input type="submit" value="댓글쓰기">
	</form>

</body>
</html>