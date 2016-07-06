<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#listImg").click(function(){
		location.href="notice_list.do";
	});
	$("#deleteImg").click(function(){ 
		if(confirm("게시물을 삭제하시겠습니까?"))
		location.href="notice_delete.do?&no=${requestScope.nvo.noticeno}";
	});
	$("#updateImg").click(function(){  
		if(confirm("게시물을 수정하시겠습니까?"))
		location.href="notice_update_view.do?no=${requestScope.nvo.noticeno}";
	});
});
</script>

<div class="container_12" align="center">
<div class="addHeight"></div>
	<h3>상세보기</h3>
	<table class="table custab" style="width: 700px;">
	<c:set var="nvo" value="${requestScope.nvo}"/>
	<tr>
		<th>글번호</th><td>${nvo.noticeno}</td>
		<th align="right">제목</th><td>${nvo.title}</td>
	</tr>
	<tr>
		<th>작성자</th><td>${nvo.memberVO.nickname}</td>
		<th align="right">작성일시</th><td>${nvo.timePosted}</td>
	</tr>
	<tr>
		<td colspan="4"><pre>${nvo.content}</pre></td>
	</tr>
	<tr>
		<td valign="middle" align="center" colspan="4">
		<input type="button" class="btn btn-primary" id="listImg" value="목록"/>
		<c:if test="${sessionScope.mvo!=null && sessionScope.mvo.admin>=1}">
		<input type="button" class="btn btn-success" id="updateImg" value="수정"/>
		<input type="button" class="btn btn-danger" id="deleteImg" value="삭제"/>
		</c:if>
	<%-- 
		<img id="listImg" class="action" src="" alt="목록" onclick="notice_list()">
	 <c:if test="${requestScope.nvo.memberVO.id==sessionScope.mvo.id}">
		<img id="deleteImg" class="action" src="" alt="삭제" onclick="notice_delete()">
		<img id="updateImg" class="action" src="" alt="수정" onclick="notice_update()">
	 </c:if>
	--%>
	

		</td>
		</tr>
	</table>
	<div class="clear"></div>
</div>
