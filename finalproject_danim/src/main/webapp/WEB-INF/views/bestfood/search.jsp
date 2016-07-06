<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	//alert(1);

	if($("#searchArea").html()==""){
		$.ajax({
			type:"get",
			url:"searchAreaFood.do",
			dataType:"json",
			success:function(area){
				var selectArea ="<select class='form-control' id='areaFoodName'>";
				selectArea += "<option value=''>지역을 선택하세요</option>";
				for(var i = 0 ; i < area.length; i++)
				{
					selectArea += "<option value="+area[i].area_name+">"+area[i].area_name+"</option>";
				}
				selectArea += "</select>";
				$("#searchArea").html(selectArea);
			}
		});
	}//처음 지역 선택
	
	//처음 지역 선택 후 세부 지역 선택
	$("#bestfoodForm").on("change", "#areaFoodName", function () {
		$("#searchDetailArea").html("");
		$("#searchFoodBtn").html("");
		$.ajax({
			type:"get",
			url:"searchFoodDetailArea.do?area_name="+$("#areaFoodName").val(),
			dataType:"json",
			success:function(detailAreaList){
				var selectFoodDetailArea ="<select class='form-control' id='DetailAreaName'>";
				selectFoodDetailArea += "<option value=''>세부지역을 선택하세요</option>";
				for(var i = 0 ; i < detailAreaList.length; i++)
				{
					selectFoodDetailArea += "<option value="+detailAreaList[i].detailarea_name+">"+detailAreaList[i].detailarea_name+"</option>";
				}
				selectFoodDetailArea += "</select>";
				$("#searchDetailArea").html(selectFoodDetailArea);
			}
		});
	});// 세부지역 선택 끝
	
	//세부지역 선택 후 음식종류 검색
	$("#bestfoodForm").on("change", "#DetailAreaName", function () {
		if($(this).val() != "")
		{
			var selectKind = "<select class='form-control' id='foodtype'>"
			selectKind += "<option value=''>음식종류를 선택하세요</option>"
			selectKind += "<option value='한식'>한식</option>";
			selectKind += "<option value='중식'>중식</option>";
			selectKind += "<option value='일식'>일식</option>";
			selectKind += "<option value='양식'>양식</option>";
			selectKind += "<option value='분식'>분식</option>";
			selectKind += "<option value='기타'>기타</option>";
			selectKind += "<option value='전체'>전체</option>";
			selectKind += "</select>";
			$("#searchFoodMenu").html(selectKind);
		}
	});//음식종류 선택 끝

	//검색버튼 생성
	$("#bestfoodForm").on("change", "#foodtype", function () {
		$("#searchFoodBtn").html("");
		if($(this).val() != ""){
			$("#searchFoodBtn").html("<input type='submit' id='searchBtn' class='btn btn-info btn-lg' value='검색'>");	
		}
	});
	//다 선택 후 넘어갈 때
	$("#bestfoodForm").submit(function(){
		$("#bestfoodForm :input[name=detailarea_name]").val($("#DetailAreaName").val());
		$("#bestfoodForm :input[name=foodtype]").val($("#foodtype").val());
	});
	
});
  </script>
<div class="addHeight"></div>
 <h3 align="center">음식검색</h3>
 <div class="container" align="center">
 <div class="addHeight"></div>
 <form id="bestfoodForm" method="get" action="searchBestFood.do">
 	<input type="hidden" name="area_name" value="">
 	<input type="hidden" name="foodtype" value="">
 	<input type="hidden" name="detailarea_name" value="">
	<!-- <input type="hidden" name="no" value=""> -->
	<div class="selectArea col-md-12">
		<!-- 지역검색 -->
		<div id="searchArea" class="col-md-6"></div><br><br><br>
		<!-- 세부지역검색 -->
		<div id="searchDetailArea" class="col-md-6"></div><br><br><br>
		<!-- 음식종류 검색 -->
		<div id="searchFoodMenu" class="col-md-6"></div><br><br><br>
		<!-- 검색 -->
		<div id="searchFoodBtn" class="col-md-6"></div><br><br><br>
		<!-- 장바구니버튼 -->
		<div id="basketTraffic" class="col-md-6"></div><br><br><br>
		<!-- 검색결과 보여주는 곳 -->
		<div id="searchFoodResult" class="col-md-6"></div><br><br><br><br>
	</div>
 </form>
 </div>