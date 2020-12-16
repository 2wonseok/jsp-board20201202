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
<title>암호 변경</title>
</head>
<style>
	.form-control {
		width:350px;
	}
</style>
<body>
<u:navbar/>
<div class="container col-3">
	<form action="changePwd.do" method="post">
		<div class="form-group">
	    <label for="input1-nowPwd">현재 암호</label>
	    <input type="password" class="form-control"  name="curPwd" id="input1-nowPwd" />
	    <c:if test="${errors.curPwd }">
		    <small class="form-text text-primary">현재 암호를 입력하세요.</small>
	    </c:if>
	    <c:if test="${errors.badCurPwd }">
		    <small class="form-text text-primary">현재 암호가 일치하지 않습니다.</small>
	    </c:if>
	  </div>
	  <div class="form-group">
	    <label for="input2-changePwd">새 암호</label>
	    <input type="password" class="form-control" name="newPwd" id="input2-changePwd" />
	    <c:if test="${errors.newPwd }">
		    <small class="form-text text-primary">변경할 암호를 입력하세요.</small>
	    </c:if>
	  </div>
		<input type="submit" value="변경" class="btn btn-primary" />
	</form>
</div>
</body>
</html>