<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">
function readURL(input) {
     if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]); 
    } 
}
$(document).ready(function(){
	$("#foodManagementForm").submit(function(){
		if(isNaN($("#foodManagementForm :input[name=main_price]").val())==true){
			alert("음식값은 숫자를 입력하세요");
			return false;
		}
	});
});
</script>
<div class="addHeight"></div>
<div class="container" align="center" id="contact-area">
<form id="foodManagementForm" action="foodshopupdate.do" method="post" enctype="multipart/form-data">
<div class="text-left">
<img id="UploadedImg" src="${initParam.root }/resources/img/food/${fvo.main_menu_picture}" style="width: 180px; height: 180px; margin-left: 100px;  border-radius: 100px; left: 220px;">
<br><br>
<input type="file"  onchange="readURL(this);"  name="uploadFile"><br>
음식점 이름 <input type="text" class="form-control" name="shopname" value="${fvo.shopname }">  <br>
음식점 주소 <input type="text" class="form-control" name="shop_add" value="${fvo.shop_add }" ><br>
주메뉴 <input type="text" class="form-control" name="main_food" value="${fvo.main_food }"><br>
주메뉴 가격 <input type="text" class="form-control" name="main_price" value="${fvo.main_price }"><br>
음식종류
<c:set var="foodtype" value="${fvo.foodtype }" />
<c:choose>
	<c:when test="${foodtype eq'한식'}">
		<select name="foodtype" class="form-control">
			<option value=''>음식종류를 선택하세요</option>
			<option value='한식' selected>한식</option>
			<option value='중식'>중식</option>
			<option value='일식'>일식</option>
			<option value='양식'>양식</option>
			<option value='분식'>분식</option>
			<option value='기타'>기타</option>
		</select>
	</c:when>
	<c:when test="${foodtype eq'중식'}">
		<select name="foodtype" class="form-control">
			<option value=''>음식종류를 선택하세요</option>
			<option value='한식' >한식</option>
			<option value='중식'selected>중식</option>
			<option value='일식'>일식</option>
			<option value='양식'>양식</option>
			<option value='분식'>분식</option>
			<option value='기타'>기타</option>
		</select>
	</c:when>
	<c:when test="${foodtype eq'일식'} ">
		<select name="foodtype" class="form-control">
			<option value=''>음식종류를 선택하세요</option>
			<option value='한식' >한식</option>
			<option value='중식'>중식</option>
			<option value='일식'selected>일식</option>
			<option value='양식'>양식</option>
			<option value='분식'>분식</option>
			<option value='기타'>기타</option>
		</select>
	</c:when>
	<c:when test="${foodtype eq'양식'}">
		<select name="foodtype" class="form-control">
			<option value=''>음식종류를 선택하세요</option>
			<option value='한식' >한식</option>
			<option value='중식'>중식</option>
			<option value='일식'>일식</option>
			<option value='양식'selected>양식</option>
			<option value='분식'>분식</option>
			<option value='기타'>기타</option>
		</select>
	</c:when>
	<c:when test="${foodtype eq'분식'}">
		<select name="foodtype" class="form-control">
			<option value=''>음식종류를 선택하세요</option>
			<option value='한식' >한식</option>
			<option value='중식'>중식</option>
			<option value='일식'>일식</option>
			<option value='양식'>양식</option>
			<option value='분식'selected>분식</option>
			<option value='기타'>기타</option>
		</select>
	</c:when>
	<c:when test="${foodtype eq'기타'}">
		<select name="foodtype" class="form-control">
			<option value=''>음식종류를 선택하세요</option>
			<option value='한식' >한식</option>
			<option value='중식'>중식</option>
			<option value='일식'>일식</option>
			<option value='양식'>양식</option>
			<option value='분식'>분식</option>
			<option value='기타'selected>기타</option>
		</select>
	</c:when>
</c:choose>

<br>지역 <input type="text" class="form-control" name="area_name" value="${fvo.area_name }" readonly><br>
상세지역 <input type="text" class="form-control" name="detailarea_name" value="${fvo.detailarea_name }"  readonly><br>
지역구 <input type="text" class="form-control" name="local_area" value="${fvo.local_area }"  readonly><br>
</div>
<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }"  ><br>

<input type="submit" value="수정" class="btn btn-success btn-lg">
</form>
</div>