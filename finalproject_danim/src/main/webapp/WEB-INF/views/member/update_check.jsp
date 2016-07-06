<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="addHeight"></div>
<div class="container" align="center">
	<h3>회원정보수정</h3>
	<form id="checkForm" action="member_updateCheckPass.do" method="post">
	<input type="hidden" name="id" value="${sessionScope.mvo.id}">
	비밀번호 <input type="password" class="form-con" name="password">
	<input type="submit" value="확인" class="btn btn-primary">
	</form>
</div>
<div class="addHeight"></div>