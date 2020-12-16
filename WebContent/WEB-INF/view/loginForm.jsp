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
<title>로그인</title>
</head>
<style>
	.form-control {
		width:350px;
	}
</style>
<body>
<u:navbar/>
<div class="container col-3">
	<form action="login.do" method="post">
		<div class="form-group">
	    <label for="input1-id">아이디</label>
	    <input type="text" class="form-control"  name="id" id="input1-id" value="${param.id}" />
	    <c:if test="${errors.id }">
		    <small class="form-text text-primary">아이디를 입력하세요.</small>
	    </c:if>
	  </div>
	  <div class="form-group">
	    <label for="input2-password">패스워드</label>
	    <input type="password" class="form-control" name="password" id="input2-password" />
	    <c:if test="${errors.password }">
		    <small class="form-text text-primary">패스워드를 입력하세요.</small>
	    </c:if>
	    <c:if test="${errors.idOrPwNotMatch }">
		    <small class="form-text text-danger">아이디가 없거나 패스워드가 일치하지 않습니다.</small>
	    </c:if>
	  </div>
	 	<input type="submit" value="로그인" class="btn btn-primary"/> 
	  <a href="join.do" class="btn btn-success">회원가입</a>
	</form>
</div>
</body>
</html>