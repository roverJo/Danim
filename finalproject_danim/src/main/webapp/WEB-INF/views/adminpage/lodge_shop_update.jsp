<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#lodgeManagementForm").submit(function(){
		if(isNaN($("#lodgeManagementForm :input[name=price]").val())==true){
			alert("가격은 숫자를 입력하세요");
			return false;
		}
	});
});

</script>
<div class="addHeight"></div>
<div class="container" align="center" id="contact-area">
	<form id="lodgeManagementForm" action="lodgeshopupdate.do">
	<div class="text-left">
	숙소 이름<br><input type="text" name="shopname" value="${lvo.shopname }" class="form-control" >  <br>
	가격<br><input type="text" name="price" value="${lvo.price }" class="form-control"><br><br>
	<c:set var="lodgetype" value="${lvo.lodgetype }" />
	<c:choose>
		<c:when test="${lodgetype eq'게스트하우스'}">
			<select class="form-control" name="lodgetype">
				<option value=''>음식종류를 선택하세요</option>
				<option value='게스트하우스' selected>게스트하우스</option>
				<option value='찜질방'>찜질방</option>
			</select>
		</c:when>
		<c:when test="${lodgetype eq'찜질방'}">
			<select class="form-control" name="lodgetype">
				<option value=''>음식종류를 선택하세요</option>
				<option value='게스트하우스' >게스트하우스</option>
				<option value='찜질방'selected>찜질방</option>
			</select>
		</c:when>
	</c:choose>
	<br>숙박 정보
	<textarea rows="5" cols="30" name="shopinfo"  class="form-control" >${lvo.shopinfo }</textarea>
	<br>지역 <input type="text" name="area_name" value="${lvo.area_name }" class="form-control" readonly><br>
	상세지역 <input type="text" name="detailarea_name" value="${lvo.detailarea_name }"  class="form-control" readonly><br>
	지역구 <input type="text" name="local_area" value="${lvo.local_area }"  class="form-control" readonly><br>
	</div>
	<input type="hidden" name="lodge_no" value="${lvo.lodge_no }"  ><br>
	<input type="submit" value="수정" class="btn btn-success btn-lg"><br>
	</form>
</div>