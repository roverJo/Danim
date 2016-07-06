<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	///////////////////////////////////////////////
	//처음 area지역 select에 넣음
	if($("#searchArea").html()==""){
		$.ajax({
			type:"get",
			url:"searchAreaLodge.do",
			dataType:"json",
			success:function(area){
				var selectArea ="<select class='form-control' id='areaLodgeName'>";
				selectArea += "<option value=''>지역을 선택하세요</option>";
				for(var i = 0 ; i < area.length; i++)	{
					selectArea += "<option value="+area[i].area_name+">"+area[i].area_name+"</option>";
				}
				selectArea += "</select>";			
				$("#searchArea").html(selectArea);
			}
		});
	}//처음 지역 선택
	/////////////////////////////////////////////
	//처음 지역 선택 후 세부 지역 선택
	$("#lodgeForm").on("change", "#areaLodgeName", function () {
		$("#searchDetailArea").html("");
		$("#searchLodgeKind").html("");
		$("#searchLodgeBtn").html("");
		$.ajax({
			type:"get",
			url:"searchLodgeDetailArea.do?area_name="+$("#areaLodgeName").val(),
			dataType:"json",
			success:function(detailAreaList){
				var selectLodgeDetailArea ="<select class='form-control' id='detailAreaName'>";
				selectLodgeDetailArea += "<option value=''>세부지역을 선택하세요</option>";
				for(var i = 0 ; i < detailAreaList.length; i++)	{
					selectLodgeDetailArea += "<option value="+detailAreaList[i].detailarea_name+">"+detailAreaList[i].detailarea_name+"</option>";
				}
				selectLodgeDetailArea += "</select>";		
				$("#searchDetailArea").html(selectLodgeDetailArea);
			}
		});
	});// 세부지역 선택 끝
	//세부지역 선택 후 숙박종류 선택
	$("#lodgeForm").on("change", "#detailAreaName", function () {
		$("#searchLodgeKind").html("");
		$("#searchLodgeBtn").html("");
		if($(this).val() != "")	{
			var selectKind = "<select class='form-control' id='lodgeKind'>"
			selectKind += "<option value=''>숙박종류를 선택하세요</option>"
			selectKind += "<option value='게스트하우스'>게스트하우스</option>";
			selectKind += "<option value='찜질방'>찜질방</option>";
			selectKind += "</select>";		
			$("#searchLodgeKind").html(selectKind);
		}
	});
	$("#lodgeForm").on("change", "#lodgeKind", function () {
		if($(this).val() != ""){
			$("#searchLodgeBtn").html("<input type='submit'class='btn btn-info btn-lg' value='검색'>");	
		}
	});
	//다 선택 후 넘어갈 때
	$("#lodgeForm").submit(function(){
		$("#lodgeForm :input[name=detailarea_name]").val($("#detailAreaName").val());
		$("#lodgeForm :input[name=lodgetype]").val($("#lodgeKind").val());
	});
});
</script>
	
<div class="container" align="center">
<div class="addHeight"></div>
<h3 align="center">숙소검색</h3><br>
	<form id="lodgeForm" method="get" action="searchLodgeByNameAndKind.do">
	<input type="hidden" name="detailarea_name" value="">
	<input type="hidden" name="lodgetype" value="">
		<div class="selectArea col-md-12">
			<!-- 지역검색 -->
			<div id="searchArea" class="col-md-6"></div><br><br><br>
			<!-- 세부지역검색 -->
			<div id="searchDetailArea" class="col-md-6"></div><br><br><br>
			<!-- 숙박종류검색 -->
			<div id="searchLodgeKind" class="col-md-6"></div><br><br><br>
			<!-- 검색 -->
			<div id="searchLodgeBtn" class="col-md-6"></div><br><br><br>
	 	</div>
	</form>
 </div> 
