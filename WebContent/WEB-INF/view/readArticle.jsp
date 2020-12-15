<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>게시글 읽기</title>
<script>
	function removeCheck() {
		if(confirm("정말 삭제하시겠습니까?")) {
			alert('삭제가 완료되었습니다.');
			location.href = "delete.do?no=${articleData.article.number }&writerId=${articleData.article.writer.id }";
		 } else {
		 	return;
		 }
	}
</script>
</head>
<body>
<div class="container">
	<table border="1" class="table" style="width:100%">
		<tr>
			<td>번호</td>
			<td>${articleData.article.number }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${articleData.article.writer.name }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><c:out value="${articleData.article.title }"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><u:pre value="${articleData.content }" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
				<a href="list.do?pageNo=${pageNo }" class="btn btn-primary">목록</a>
				<c:if test="${authUser.id == articleData.article.writer.id }">
				<a href="modify.do?no=${articleData.article.number }"  class="btn btn-success">게시글 수정</a>
				<input type="button" value="게시글 삭제" onclick="removeCheck()" class="btn btn-danger"/>
				</c:if>
			</td>
		</tr>
	</table>

	<u:listReply articleNo="${articleData.article.number }" pageNo="${pageNo }"/>
	
	<u:replyForm articleNo="${articleData.article.number }" pageNo="${pageNo }" modReply="${modReplys.body }"/>
	
</div>
</body>
</html>