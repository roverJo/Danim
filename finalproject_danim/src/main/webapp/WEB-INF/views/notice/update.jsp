<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#updateBtn").click(function(){ 
	if($("#title").val()==""){
		alert("제목을 입력하세요!");
		return false;
	}
	if($("#noticeContent").val()==""){
		alert("본문을 입력하세요!");
		return false;
	}else{
		$("#update_form").submit();
	}
	});
	/* $("#returnBtn").click(function(){
		location.href="${initParam.root}notice_content.do?no=${requestScope.nvo.noticeno}"
	}); */
	$("#resetBtn").click(function(){
		$("#update_form")[0].reset();
		$("#update_form input[name=title]").value("");
	});
})
</script>
<c:if test="${sessionScope.mvo==null}">
	<script type="text/javascript">
	alert("관리자제한");
	location.href="${initParam.root}home.do";
	</script>
</c:if>

<div class="container_12" align="center">
<div class="addHeight"></div>
		<form method="post" id="update_form" 
		action="${initParam.root}noticeupdate.do?noticeno=${requestScope.nvo.noticeno}">
		<div id="contact-area">
			<table>
			<tbody class="text-left">
			<tr>
				<td>
				<%-- 글번호:<input type="text" name="noticeno" value="${requestScope.nvo.noticeno}"  readonly></input> | --%> 
				제목
				</td>
				<td><input type="text" id="title" name="title" value="${requestScope.nvo.title}" class="form-con" style="width: 333px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="left">
				<textarea id="noticeContent" name="content" class="form-con" style="width: 369px; height: 200px;">${requestScope.nvo.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" class="btn btn-success" id="updateBtn" value="수정"/>
				<input type="reset" class="btn btn-default" id="resetBtn" value="취소"/>
				<!-- <img id="updateBtn" class="action btn-info" src="" alt="수정"  onclick="content_submit()">
				<img id="returnBtn" class="action" src="" alt="취소" onclick="cancel()"> -->
				</td>
			</tr>
			</tbody>
			</table>
		</div>
		</form>
	<div class="clear"></div>
</div>