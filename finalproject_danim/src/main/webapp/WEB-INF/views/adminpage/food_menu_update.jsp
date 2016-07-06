<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">

function readURL0(input) {
     if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#UploadedImg0').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]); 
    } 
}
function readURL1(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg1').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}
function readURL2(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg2').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}
function readURL3(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
           $('#UploadedImg3').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]); 
   } 
}

	$(document).ready(function () {
		
		//submit 할때 동작
		$("#foodUpdateForm").submit(function () {
			//메뉴의 음식 이름 값
			var food_name_list = "";
			$.each($(this).parent().parent().find("input[name=food_name]"),function(index,items) {
				food_name_list +=  $(this).val()+",";
			});
			//div 영역에 menu_name 값을 히든으로 컨트롤러로 넘긴다.
			$("#viewHiddenFoodName").html("<input type='hidden' name='food_list' value='"+food_name_list+"'>");	
			//음식 이름 값 끝
			
			//메뉴의 고유 PK
			var food_menuNo_list="";
			$.each($(this).parent().parent().find("input[name=menu_no]"),function(index,items){
				food_menuNo_list += $(this).val()+",";
			});
			$("#viewHiddenMenuNo").html("<input type='hidden' name='menuNo_list' value='"+food_menuNo_list+"'>");	
			//메뉴 PK 끝
			
			//메뉴의 가격
			var food_menuPrice_list="";
			$.each($(this).parent().parent().find("input[name=price]"),function(index,items){
				food_menuPrice_list += $(this).val()+",";
			});
			$("#viewHiddenPrice").html("<input type='hidden' name='price_list' value='"+food_menuPrice_list+"'>");	
			//메뉴 가격 끝
		
			
		});
	});
</script>


<div class="addHeight"></div>
<div class="container" align="center">
<form id = "foodUpdateForm" action="food_menu_update_list.do" method="post" enctype="multipart/form-data" class="community" >
	<input type="hidden" name="food_name_list" value="">
	<table class="table">
		<tr>
			<c:forEach	items="${menuList }" var="menuList" varStatus="status">			
				<td>
					<br><br>
					<img id="UploadedImg${status.index }" src="${initParam.root }/resources/img/food/menu/${menuList.food_picture}" style="width: 180px; height: 180px; margin-left: 35px;  border-radius: 100px; left: 220px;">
					<br><br><br>
					<input type="file" onchange="readURL${status.index }(this);" name="file[${status.index }]" id="uploadFile" class="text-center"><br>
					<!-- <div id="fileuploadDiv"></div> -->
					<input type="hidden" name="menu_no" value="${menuList.menu_no }">
					<input type="hidden" name="foodshop_no" value="${menuList.foodshop_no }">
					메뉴 : <input type="text" class="form-control" name="food_name" value="${menuList.food_name }"><br>
					가격 : <input type="text" class="form-control" size="7" name="price" value="${menuList.price }"><br>
				</td>			
			</c:forEach>
		<tr>
	</table>

	<input type="submit" value="수정" class="btn btn-success btn-lg"><br><br>
	<div id="viewHiddenFoodName"></div>
	<div id="viewHiddenMenuNo"></div>
	<div id="viewHiddenPrice"></div>
</form>
</div>
