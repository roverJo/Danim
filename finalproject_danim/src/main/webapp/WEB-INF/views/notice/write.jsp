<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){
		//showObj($("#write_form input[name=content]"));
//	alert($("#write_form input[name=content]"))

	if($("#title").val()==""){
		alert("제목을 입력하세요!");
	}else if($("#noticeContent").val()==""){
		alert("본문을 입력하세요!");
	}else{
		$("#write_form").submit();
	}
	});
	$("#resetBtn").click(function(){
		$("#write_form")[0].reset();
	});
});
function showObj(obj) {
	var str = "";
	for(key in obj) {
		str += key+"="+obj[key]+"\n";
	}

	alert(str);
	return;
}
</script>
<c:if test="${sessionScope.mvo==null}">
<script type="text/javascript">
alert("관리자제한");
location.href="${initParam.root}home.do";
</script>
</c:if>

<div class="container_12" align="center">
<div class="addHeight"></div>
		<form method="post" action="${initParam.root}notice_write_ready.do" id="write_form">
		<div id="contact-area">		
			<table>
			<tbody class="text-left">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title" class="form-con" style="width: 333px;"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td align="center"><h4>${sessionScope.mvo.nickname}</h4></td>
			</tr>
			<tr>
				<td colspan="2" align="left">
				<textarea id="noticeContent" name="content" class="form-con" style="width: 369px; height: 200px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" class="btn btn-success" id="writeBtn" value="입력"/>
				<input type="reset" class="btn btn-default" id="resetBtn" value="취소"/>
				<!-- <img id="writeBtn" class="action" src="" alt="입력"  onclick="content_submit()">
				<img id="resetBtn" class="action" src="" alt="취소" onclick="cancel()"> -->
				</td>
			</tr>
			</tbody>
			</table>
		</div>
		</form>
	<div class="clear"></div>
</div>
