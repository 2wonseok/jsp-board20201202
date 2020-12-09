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
<title>가입</title>
</head>
<body>
<div class="container">
	<form action="${root }/join.do" method="post">
		<p>
			아이디: <br /><input type="text" class="form-control" style="width:300px" name="id" id="" value="${param.id}" />
			<c:if test="${errors.id }">아이디를 입력하세요.</c:if>
			<c:if test="${errors.duplicateId }">이미 사용중인 아이디입니다.</c:if>
		</p>
		<p>
			이름: <br /><input type="text" class="form-control" style="width:300px" name="name" id="" value="${param.name}" />
			<c:if test="${errors.name }">이름을 입력하세요.</c:if>
		</p>
		<p>
			암호: <br /><input type="password" class="form-control" style="width:300px" name="password"/>
			<c:if test="${errors.password }">암호를 입력하세요.</c:if>
		</p>
		<p>
			확인: <br /><input type="password" class="form-control" style="width:300px" name="confirmPassword" />
			<c:if test="${errors.confirmPassword }">확인을 입력하세요.</c:if>
			<c:if test="${errors.notMatch }">암호와 확인이 일치하지 않습니다.</c:if>
		</p>
		<input type="submit" value="가입" class="btn btn-success"/>
	</form>
</div>
</body>
</html>