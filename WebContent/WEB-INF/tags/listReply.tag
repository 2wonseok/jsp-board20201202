<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name ="articleNo" type="java.lang.Integer" %>
<%@ attribute name ="pageNo" type="java.lang.Integer" %>

<div>
	<c:forEach items="${replyList }" var="reply">
	<table class="table">
		<tr>
			<td style="width:40px;">${reply.id }</td>
			<td style="width:400px;">${reply.body}</td>
			<td style="width:100px;">${reply.memberId}</td>
	<c:if test="${reply.memberId == authUser.id }">
			<td style="width:50px;">
		 	 	<a href="${root }/reply/replyModify.do?no=${reply.id }&writerId=${reply.memberId}&articleNo=${articleNo}&pageNo=${pageNo}" >수정</a>
		  </td>
		  <td style="width:50px;">
				<a href="${root }/reply/replyDelete.do?no=${reply.id }&writerId=${reply.memberId}&articleNo=${articleNo}&pageNo=${pageNo}" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
			</td>
	</c:if>
	  </tr>
	</table>
	</c:forEach>
</div>

<%-- 		<input type="text" value="${reply.body}" readonly/>
		<span>${reply.memberId }</span><br /> --%>
