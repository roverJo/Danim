<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	//alert("음식점 등록 성공!");
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
		$("#lodgeFindForm").on("change", "#areaName", function () {
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
		$("#lodgeFindForm").on("change", "#detailareaName", function () {
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
		
		
		$("#lodgeFindForm").submit(function () {
			$("#lodgeFindForm :input[name=area_name]").val($("#areaName").val());
			$("#lodgeFindForm :input[name=detailarea_name]").val($("#detailareaName").val());
			$("#lodgeFindForm :input[name=lodgetype]").val($("#lodgeKind").val());
		});
	
	
});
	
</script>

<div class="addHeight"></div>
<div class="container" align="center" id="contact-area">
	<form id="lodgeFindForm" action="lodgefind2.do">
		<input type="text" name="shopname" placeholder="숙박이름을 입력하세요" class="form-control"> <br> 
		<input type="hidden" value="" name="area_name" class="form-control"> 
		<input type="hidden"  value="" name="detailarea_name" class="form-control">
		<input type="hidden" value="" name="lodgetype" class="form-control">
	<div id="searchLodgeArea"></div><br>
	<div id="searchLodgeDetailArea"></div><br>	
	<div id="searchLodgeType"></div><br>
		 
		<input type="submit" value="검색" class="btn btn-primary btn-lg">
	</form>
</div>