<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type:"get",
			url:"searchAreaLodge.do",
			dataType:"json",
			success:function(areaList){
				var selectArea ="<select class='form-control' id='areaName'>";
				selectArea += "<option value=''>지역을 선택하세요</option>";
				for(var i = 0 ; i < areaList.length; i++)
				{
					selectArea += "<option value="+areaList[i].area_name+">"+areaList[i].area_name+"</option>";
				}
				selectArea += "</select>";
				$("#searchLodgeArea").html(selectArea);
				
			}
		});//지역 선택 끝
		//처음 지역 선택 후 세부 지역 선택
		$("#lodgeManagementForm").on("change", "#areaName", function () {
			$("#searchLodgeDetailArea").html("");
			$("#lodgelocalArea").html("");
			$("#lodgeKind").html("");
			$.ajax({
				type:"get",
				url:"searchLodgeDetailArea.do?area_name="+$("#areaName").val(),
				dataType:"json",
				success:function(detailAreaList){
					var selectFoodDetailArea ="<select class='form-control' id='detailareaName'>";
					selectFoodDetailArea += "<option value=''>세부지역을 선택하세요</option>";
					for(var i = 0 ; i < detailAreaList.length; i++)
					{
						selectFoodDetailArea += "<option value="+detailAreaList[i].detailarea_name+">"+detailAreaList[i].detailarea_name+"</option>";
					}
					selectFoodDetailArea += "</select>";
					
					$("#searchLodgeDetailArea").html(selectFoodDetailArea);
					
				}
			});
		});// 세부지역 선택 끝
		
		//숙박 타입
		$("#lodgeManagementForm").on("change", "#detailareaName", function () {
			$("#lodgelocalArea").html("");
			$("#lodgeKind").html("");
			if($(this).val() != "")	{
				var selectKind = "<select class='form-control' id='lodgeKind'>"
				selectKind += "<option value=''>숙박종류를 선택하세요</option>"
				selectKind += "<option value='게스트하우스'>게스트하우스</option>";
				selectKind += "<option value='찜질방'>찜질방</option>";
				selectKind += "</select>";		
				$("#searchLodgeType").html(selectKind);
			}
		});
		
		//지역 입력 텍스트창
		$("#lodgeManagementForm").on("change","#lodgeKind",function(){
			var inputFoodLocalArea="<input type='text' name='local_area' id='lodgelocalArea' class='form-control' placeholder='지역구를 입력하세요'>";
			$("#searchLodgeLocalArea").html(inputFoodLocalArea);
		});
		
		
		$("#lodgeManagementForm").submit(function () {
			$("#lodgeManagementForm :input[name=area_name]").val($("#areaName").val());
			$("#lodgeManagementForm :input[name=detailarea_name]").val($("#detailareaName").val());
			$("#lodgeManagementForm :input[name=lodgetype]").val($("#lodgeKind").val());
			
			if($("#lodgeManagementForm :input[name=shopname]").val()==""){
				alert("숙소 이름을 입력하세요");
				return false;
			}
			if($("#lodgeManagementForm :input[name=price]").val()==""){
				alert("숙소 가격을 입력하세요");
				return false;
			}
			if($("#lodgeManagementForm :input[name=shopinfo]").val()==""){
				alert("숙소 정보를 입력하세요");
				return false;
			}
			if($("#lodgeManagementForm :input[name=area_name]").val()==""){
				alert("지역을 선택하세요");
				return false;
			}
			if($("#lodgeManagementForm :input[name=detailarea_name]").val()==""){
				alert("상세지역을 선택하세요");
				return false;
			}
			if($("#lodgeManagementForm :input[name=lodgetype]").val()==""){
				alert("숙박종류를 선택하세요");
				return false;
			}
			if($("#lodgeManagementForm :input[name=local_area]").val()==""){
				alert("지역구를 입력하세요");
				return false;
			}
			if(isNaN($("#lodgeManagementForm :input[name=price]").val())==true){
				alert("숙박값은 숫자를 입력하세요");
				return false;
			}			
		});
		
	});
</script>

<div class="addHeight"></div>
<div class="container" align="center">
	<div id="contact-area">
	<!-- <h3>숙박 추가</h3> -->
		<form id="lodgeManagementForm" action="lodgeshopregister.do">
		<input type="text" name="shopname" placeholder="숙소 이름을 입력하세요" class="form-control"><br>
		<input type="text" name="price" placeholder="가격을 입력하세요" class="form-control"><br>
		<!-- <div id="h3r">숙소 정보</div> <br> -->
		<textarea rows="5" cols="30" name="shopinfo" class="form-control" style="height:250px;" placeholder="숙소 정보를 입력하세요"></textarea><br>
		<input type="hidden" value="" name="area_name">
		<input type="hidden" value="" name="detailarea_name">
		<input type="hidden" value="" name="lodgetype">
		
		<div id="searchLodgeArea"></div><br>
		<div id="searchLodgeDetailArea"></div><br>	
		<div id="searchLodgeType"></div><br>
		<div id="searchLodgeLocalArea"></div><br>
		<input type="submit" value="등록" class="btn btn-warning btn-lg">
		</form>
	</div>
</div>