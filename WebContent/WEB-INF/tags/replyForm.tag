<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name ="articleNo" type="java.lang.Integer" %>
<%@ attribute name ="pageNo" type="java.lang.Integer" %>
<%@ attribute name ="modReply" type="java.lang.String" %>
<%@ attribute name ="replyId" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.lws {
		display: flex;
	}
</style>
<c:if test="${not empty sessionScope.authUser }">
	<div>
		<form action="${root }/reply/add.do" method="post">
			<input type="hidden" name="replyId" value="${replyId }" />
			<input type="hidden" name="modReply" value="${modReply}" />
			<input type="hidden" name="pageNo" value="${pageNo }" />
			<input type="hidden" name="no" value="${articleNo }"/>
			<table class="table">
			<col width='25%'>
			<col width='85%'>
			  <tr>
					<td style="width:100px;" colspan="2">
						<div class="lws">
							<textarea name="body" class="form-control"  placeholder="40글자 까지 입력 가능합니다." maxlength="40" style="width:95%; height:80px; display:flex">${modReply }</textarea>&nbsp;
						  <input type="submit"  value="등록" onclick="return confirm('등록하시겠습니까?')" class="btn btn-primary">
						 </div>
					</td>
			  </tr>
			</table>
		</form>
	</div>	
	
</c:if>

<!-- 			<textarea name="body" cols="60" rows="5"></textarea>
			<input type="text" name="body" />
			<input type="submit" value="등록" /> -->