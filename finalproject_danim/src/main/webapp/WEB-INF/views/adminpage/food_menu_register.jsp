<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <% request.setCharacterEncoding("euc-kr"); %>
<%
 String foodshop_no=request.getParameter("foodshop_no");
%>
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

$(document).ready(function(){
	
	//submit
	$("#food_menu_regiForm").submit(function(){
		
		//메뉴의 음식 이름 값
		var food_name_list = "";
		$.each($(this).parent().parent().find("input[name=food_name]"),function(index,items) {
			food_name_list +=  $(this).val()+",";
		});
		//div 영역에 menu_name 값을 히든으로 컨트롤러로 넘긴다.
		$("#viewHiddenFoodName").html("<input type='hidden' name='food_list' value='"+food_name_list+"'>");	
		//음식 이름 값 끝
		
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
<div class="container">
<div class="foodDiv">

<form id="food_menu_regiForm" action="foodmenu_multi_fileupload.do" method="post" enctype="multipart/form-data" class="community">
	<table class="table">
		<tr>
<c:choose>
	<c:when test="${menuList.size()==0 }">
		<% for(int i=0;i<4;i++){ %>
	<td>		
			<img id="UploadedImg<%=i %>" src="" style="width: 180px; height: 180px; border-radius: 100px; left: 220px;">
			<br><br><br>
			<input type="file"  onchange="readURL<%=i %>(this);" name="file[<%=i %>]"><br>
			<input type="text" name="food_name" placeholder="메뉴를 입력하세요" class="form-control"><br>
			<input type="text" name="price" placeholder="가격을 입력하세요" class="form-control"><br>
			<c:choose>
				<c:when test="${fvo==null }">
				<input type="hidden" name="foodshop_no" value=<%=foodshop_no%>>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }">
				</c:otherwise>
			</c:choose>
		</td>
		<%} %>
	</c:when>
	<c:when test="${menuList.size()==1 }">
		<% for(int i=0;i<3;i++){ %>
	<td>
			<img id="UploadedImg<%=i %>" src="" style="width: 180px; height: 180px; border-radius: 100px; left: 220px;">
			<br><br><br>
			<input type="file"  onchange="readURL<%=i %>(this);" name="file[<%=i %>]"><br>
			<input type="text" name="food_name" placeholder="메뉴를 입력하세요" class="form-control"><br>
			<input type="text" name="price" placeholder="가격을 입력하세요" class="form-control"><br>
			<c:choose>
				<c:when test="${fvo==null }">
				<input type="hidden" name="foodshop_no" value=<%=foodshop_no %>>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }">
				</c:otherwise>
			</c:choose>
		</td>
		<%} %>
	</c:when>
	<c:when test="${menuList.size()==2 }">
		<% for(int i=0;i<2;i++){ %>
	<td>
			<img id="UploadedImg<%=i %>" src="" style="width: 180px; height: 180px; border-radius: 100px; left: 220px;">
			<br><br><br>
			<input type="file"  onchange="readURL<%=i %>(this);" name="file[<%=i %>]"><br>
			<input type="text" name="food_name" placeholder="메뉴를 입력하세요" class="form-control"><br>
			<input type="text" name="price" placeholder="가격을 입력하세요" class="form-control"><br>
			<c:choose>
				<c:when test="${fvo==null }">
				<input type="hidden" name="foodshop_no" value=<%=foodshop_no %>>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }">
				</c:otherwise>
			</c:choose>
		</td>
		<%} %>
	</c:when>
	<c:when test="${menuList.size()==3 }">
	<td>
		<img id="UploadedImg0" src="" style="width: 180px; height: 180px; border-radius: 100px; left: 220px;">
			<br><br><br>
			<input type="file"  onchange="readURL0(this);" name="file[0]"><br>
			<input type="text" name="food_name" placeholder="메뉴를 입력하세요" class="form-control"><br>
			<input type="text" name="price" placeholder="가격을 입력하세요" class="form-control"><br>
			<c:choose>
				<c:when test="${fvo==null }">
					<input type="hidden" name="foodshop_no" value=<%=foodshop_no %>>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="foodshop_no" value="${fvo.foodshop_no }">
				</c:otherwise>
			</c:choose>
			</td>
	</c:when>
</c:choose>
	</tr>
	</table>
<input type="submit" value="등록" class="btn btn-warning btn-lg">
	<div id="viewHiddenFoodName"></div>
	<div id="viewHiddenPrice"></div>
</form>

</div>
</div>