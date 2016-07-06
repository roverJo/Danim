<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkForm").submit(function(){
			 	if($("#checkForm input[name=password]").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
		});
	});
</script>
<h3>관리자 비밀번호 확인</h3>
<form id="checkForm" action="admin_checkPass.do" method="post">
<input type="hidden" name="id" value="${id}">
비밀번호 <input type="password" class="form-con" name="password"><br>
<input type="submit" value="확인"> <input type=button value=창끄기 onclick='javascript:self.close()'>
</form>