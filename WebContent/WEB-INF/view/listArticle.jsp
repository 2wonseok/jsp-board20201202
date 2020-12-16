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
<title>게시글 목록</title>
<style>
	.col-no {
		width:15%px;
	}
	
	.col-title {
		width:50%;
		text-align:center;
	}
	
	.col-writer {
		width:20%;
	}
	
	.col-read {
		width:15%;
	}
</style>
</head>
<body>
<u:navbar/>
<div class="row">
	<div class="container col-6 mt-1">
	<h2 class="sub-header">자유게시판</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-no">NO</th>
					<th class="col-title">제목</th>
					<th class="col-writer">작성자</th>
					<th class="col-read">조회수</th>
				</tr>
			</thead>
		<c:if test="${articlePage.hasNoArticles() }">
			<tr>
				<td colspan="4">게시글이 없습니다.</td>
			</tr>
		</c:if>
			<tbody>
				<c:forEach items="${articlePage.content }" var="article" >
					<tr>
						<td>${article.number }</td>
						<td style="text-align:center;">
							<a href="read.do?no=${article.number }&pageNo=${articlePage.currentPage}">
								<c:out value="${article.title }"/>
							</a>
						</td>
						<td>${article.writer.name }</td>
						<td>${article.readCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="write.do" class="btn btn-success">글쓰기</a>
		<div class="pagenation-container d-flex justify-content-center">
		<c:if test="${articlePage.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${articlePage.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="list.do?pageNo=${articlePage.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
			    	<li class="page-item"><a class="page-link" href="list.do?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${articlePage.endPage < articlePage.totalPages }">
			    	<li class="page-item"><a class="page-link" href="list.do?pageNo=${articlePage.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
				<%-- <tr>
					<td colspan="4">
						<c:if test="${articlePage.startPage } > 5">
							<a href="list.do?pageNo=${articlePage.startPage - 5 }">[이전]</a>
						</c:if>
						<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
							<a href="list.do?pageNo=${pNo }">[${pNo }]</a>
						</c:forEach>
						<c:if test="${articlePage.endPage < articlePage.totalPages }">
							<a href="list.do?pageNo=${articlePage.startPage + 5 }">[다음]</a>
						</c:if>
					</td>
				</tr> --%>
		</c:if>	
		</div>
	</div>
</div>
</body>
</html>