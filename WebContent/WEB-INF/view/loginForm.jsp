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
<title>로그인</title>
</head>
<body>
<form action="login.do" method="post">
	<c:if test="${eroors.idOrPwNotMatch }">\
		아이디와 암호가 일치하지 않습니다.
	</c:if>
	<p>
		아이디: <br /><input type="text" class="form-control" style="width:300px" name="id" id="" value="${param.id}" />
		<c:if test="${errors.id }">아이디를 입력하세요.</c:if>
	</p>
	<p>
		암호: <br /><input type="password" class="form-control" style="width:300px" name="password"  />
		<c:if test="${errors.password }">암호를 입력하세요.</c:if>
	</p>
	<input type="submit" value="로그인" class="btn btn-primary"/>
</form>
</body>
</html>