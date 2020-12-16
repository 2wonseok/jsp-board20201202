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
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
<u:navbar/>
<div class="row">
	<div class="container col-6 mt-1 main">
	<h2 class="sub-header">게시글 보기</h2>
		<table class="table" style="width:100%">
			<tbody>
				<tr>
					<th>NO</th>
					<td>${articleData.article.number }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${articleData.article.writer.name }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><c:out value="${articleData.article.title }"/></td>
				</tr>
				<tr>
					<th style="width:200px; height:150px;">내용</th>
					<td><u:pre value="${articleData.content }" /></td>
				</tr>
			</tbody>
		</table>
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<a href="list.do?pageNo=${pageNo }" class="btn btn-primary">목록</a>
		<c:if test="${authUser.id == articleData.article.writer.id }">
			<a href="modify.do?no=${articleData.article.number }"  class="btn btn-success">게시글 수정</a>
			<input type="button" value="게시글 삭제" onclick="removeCheck()" class="btn btn-danger"/>
		</c:if>
		
		<u:listReply articleNo="${articleData.article.number }" pageNo="${pageNo }"/>
		
		<u:replyForm articleNo="${articleData.article.number }" pageNo="${pageNo }" modReply="${modReplys.body }" replyId="${modReplys.id }"/>
		
	</div>
</div>
</body>
</html>