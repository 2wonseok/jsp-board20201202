<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>게시글 수정</title>
<script>
	function modifyCheck() {
		if(confirm("수정을 완료하시겠습니까?")) {
			alert('수정이 완료되었습니다.');
			document.modifyForm.submit();
		 } else {
		 	return;
		 }
	}
</script>
</head>
<body>
<div class="container">
	<form action="modify.do" name="modifyForm" method="post" onsubmit="return check()">
		<p>
			번호: <br /><input type="hidden" name="no" value="${modReq.articleNumber}"/>${modReq.articleNumber}
		</p>
		<p>
			제목: <br /><input type="text" name="title" class="form-control" value="${modReq.title}" />
			<c:if test="${errors.title }">제목을 입력하세요</c:if>
		</p>
		<p>
			내용: <br />
			<textarea name="content" id="" cols="30" rows="5">${modReq.content }</textarea>
		</p>
	<input type="button" onclick="modifyCheck()" value="글 수정" />	
	</form>
</div>
</body>
</html>