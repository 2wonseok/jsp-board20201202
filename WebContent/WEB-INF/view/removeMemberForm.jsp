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
<title>회원 탈퇴</title>
</head>
<body>
<div class="container">
	<form action="remove.do" method="post">
		<input type="hidden" name="id" value="${authUser.id }"/>
		<p>
			현재 암호: <br /><input type="password" class="form-control" style="width:300px" name="password">
			<c:if test="${errors.PwNotMatch }">암호가 일치하지 않습니다.</c:if>
		</p>
		<input type="submit" value="회원탈퇴" class="btn btn-primary" />
	</form>
</div>
</body>
</html>