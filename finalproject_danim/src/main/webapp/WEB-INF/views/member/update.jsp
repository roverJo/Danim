<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateForm :input[name=id]").click(function(){
			alert("아이디는 수정이 불가능합니다!");
		});
		$("#updateForm :input[name=nickname]").keyup(function(){
			var nick = $("#updateForm :input[name=nickname]").val();
			if(nick.length<2||nick.length>8){
				$("#nickView").empty();
				$("#nickView").html("닉네임은 2자 이상 8자 이하만 가능!").css("background","orange").css("color","white");
			}else{
				$("#nickView").empty();
				$.ajax({
					type:"post",
					url:"login_findJSONUpadteNick.do?nick="+nick,
					dataType:"json",
					success:function(jsonData){
						if(jsonData==0){
							$("#nickView").html("사용 가능!").css("background","#00ca65").css("color","white");
						}
						else if(jsonData==1){
							$("#nickView").html("사용 불가능!").css("background","#ff5555").css("color","white");
						}
					}
				});
			}
		});
		$("#updateForm :input[name=checkpass]").keyup(function(){
			var pass=$("#updateForm :input[name=password]").val();
			var checkPass=$("#updateForm :input[name=checkpass]").val();
			if(pass!=checkPass){
				$("#passView").empty();
				$("#passView").html("비밀번호 불일치!").css("background","#ff5555").css("color","white");
			}else{
				$("#passView").empty();
				$("#passView").html("비밀번호 일치!").css("background","#00ca65").css("color","white");
			}
		});
		$("#updateForm").submit(function(){
			if($("#updateForm :input[name=password]").val()==""){
				alert("패스워드를 입력하세요!");
				return false;
			}
			if($("#passView").html()!="비밀번호 일치!"){
				alert("비밀번호를 확인하세요!");
				return false;
			}
			
			if($("#nickView").html()!="사용 가능!"){
				alert("닉네임을 체크하세요!");
				return false;
			}
			if($("#updateForm :input[name=address]").val()==""){
				alert("주소를 선택하세요!");
				return false;
			}
			if($("#updateForm :input[name=email_add]").val()==""){
				alert("이메일을 입력하세요!")
				return false;
			}
		});
	});
</script>
<div class="container_12" align="center">
	<div class="addHeight"></div>
		<div id="contact-area" class="community">
				<form id="updateForm" action="login_updateResult.do" method="post" class="input_form">
				<div class="text-left">
				아이디 <input type="text" name="id" value="${mvo.id}" class="form-control" readonly><br>
				비밀번호 <input type="password" name="password" class="form-control" required><br>
				비밀번호 확인 <input type="password" name="checkpass" class="form-control" required>
				<!-- <span id="passView"></span><br> -->
				<div class="col-md-12" id="passView" aria-hidden="true"></div><br>
				닉네임 <input type="text" name="nickname" value="${mvo.nickname}" class="form-control" required>
				<!-- <span id="nickView"></span><br> -->
				<div class="col-md-12" id="nickView" aria-hidden="true"></div><br>
				주소 <select name="address" class="btn btn-default dropdown-toggle col-md-12" required>
				<option value="">----주소----</option>
				<c:forEach items="${area}" var="area">
				<option value="${area.area_name}">${area.area_name}</option>
				</c:forEach>
				</select>
				<br><br><br><br>
				이메일 <input type="email" name="email_add" value="${mvo.email_add}" class="form-control" required><br><br>
				</div>
				<input type="submit" value="정보수정" class="btn btn-info btn-md-4">
				</form>
		</div>
	<div class="clear"></div>
</div>