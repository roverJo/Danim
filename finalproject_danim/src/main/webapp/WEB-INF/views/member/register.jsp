<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#registerForm :input[name=id]").keyup(function(){
			var id = $("#registerForm :input[name=id]").val();
			if(id.length<4||id.length>10){
				$("#idView").empty();
				$("#idView").html("아이디는 4자 이상 10자 이하만 가능합니다!").css("background","orange").css("color","white");
			}else{
				$("#idView").empty();
				$.ajax({
					type:"post",
					url:"findJSONId.do?id="+id,
					dataType:"json",
					success:function(jsonData){
						if(jsonData==0){
							$("#idView").html("사용 가능!").css("background","#00ca65").css("color","white");
						}else if(jsonData==1){
							$("#idView").html("사용 불가능!").css("background","#ff5555").css("color","white");
						}
					}
				});
			}
		});
		$("#registerForm :input[name=nickname]").keyup(function(){
			var nick = $("#registerForm :input[name=nickname]").val();
			if(nick.length<2||nick.length>8){
				$("#nickView").empty();
				$("#nickView").html("닉네임은 2자 이상 8자 이하만 가능!").css("background","orange").css("color","white");
			}else{
				$("#nickView").empty();
				$.ajax({
					type:"post",
					url:"findJSONNick.do?nick="+nick,
					dataType:"json",
					success:function(jsonData){
						if(jsonData==0){
							$("#nickView").html("사용 가능!").css("background","#00ca65").css("color","white");
						}else if(jsonData==1){
							$("#nickView").html("사용 불가능!").css("background","#ff5555").css("color","white");
						}
					}
				});
			}
		});
		$("#registerForm :input[name=checkpass]").keyup(function(){
			var pass=$("#registerForm :input[name=password]").val();
			var checkPass=$("#registerForm :input[name=checkpass]").val();
			if(pass!=checkPass){
				$("#passView").empty();
				$("#passView").html("비밀번호 불일치!").css("background","#ff5555").css("color","white");
			}else{
				$("#passView").empty();
				$("#passView").html("비밀번호 일치!").css("background","#00ca65").css("color","white");
			}
		});
		$("#registerForm").submit(function(){
			if($("#idView").html()!="사용 가능!"){
				alert("아이디를 체크하세요!");
				return false;
			}
			if($("#registerForm :input[name=password]").val()==""){
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
			if($("#registerForm :input[name=address]").val()==""){
				alert("주소를 선택하세요!");
				return false;
			}
			if($("#registerForm :input[name=email_add]").val()==""){
				alert("이메일을 입력하세요!")
				return false;
			}
		});
	});
</script>
<div class="container" align="center">
	<div class="addHeight"></div>
		<div id="contact-area" class="transparencyBG">
			<form id="registerForm" action="register.do" method="post" class="input_form">
			<input type="text" name="id" class="form-control" placeholder="아이디" required>
			<!-- <span id="idView"></span> -->
			<div class="col-md-12" id="idView" aria-hidden="true"></div><br>
			<input type="password" name="password" class="form-control" placeholder="비밀번호" required><br>
			<input type="password" name="checkpass" class="form-control" placeholder="비밀번호 확인" required>
			<!-- <span id="passView"></span> -->
			<div class="col-md-12" id="passView" aria-hidden="true"></div><br>
			<input type="text" name="nickname" class="form-control" placeholder="닉네임" required>
			<!-- <span id="nickView"></span><br> -->
			<div class="col-md-12" id="nickView" aria-hidden="true"></div><br>
			<select name="address" class="btn btn-default dropdown-toggle col-md-12" required>
			<option value="">----주소----</option>
			<c:forEach items="${area}" var="area">
			<option value="${area.area_name}">${area.area_name}</option>
			</c:forEach>
			</select>
			<br><br><br>
			<input type="email" name="email_add" class="form-control" placeholder="email" required><br><br>
			<input type="submit" value="회원가입" class="btn btn-info btn-md-4">
			</form>
		</div>
	<div class="clear"></div>
</div>