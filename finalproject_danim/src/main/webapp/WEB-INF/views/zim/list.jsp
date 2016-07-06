<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		////////////////////////////////////////////////교통관련 
		var cartForm = "<hr><input type='submit' class='btn btn-success btn-lg' value='장바구니에 담기'>&nbsp;&nbsp;&nbsp;<input type='button' class='btn btn-primary btn-lg' name='chogi' value='선택 초기화'>";
		//초기화버튼을 눌렀을때
		$("#cartForm").on("click", "input[name=chogi]",function(){
			$("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]").prop("checked",false);
			$("#foodZimForm input[type='radio'][name=insertcart_food_no]").prop("checked",false);
			$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]").prop("checked",false);
			$("#foodZimForm input[name=foodshop_no]").each(function () {
				$(this).prop("checked",false);
			});
			$("#trafficZimForm input[name=bus_no]").each(function () {
				$(this).prop("checked",false);
			});
			$("#trafficZimForm input[name=train_no]").each(function () {
				$(this).prop("checked",false);
			});
			$("#lodgeZimForm input[name=lodge_no]").each(function () {
				$(this).prop("checked",false);
			});
			$("#deleteTrafficBtnDiv").html("");
			$("#deleteFoodBtnDiv").html("");
			$("#deleteLodgeBtnDiv").html("");
			$("#cartDiv").html("");
		});
		
		////cart
		$("#cartForm").submit(function () {
			$("#cartForm input[name=traffic_no]").val($("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").val());
			$("#cartForm input[name=lodge_no]").val($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").val());
			$("#cartForm input[name=foodshop_no]").val($("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").val());
		});
		
		
		//////////////////////////////////////////////////////////////////////////////
		
		//음식라디오버튼을 눌렀을때
		$("#foodZimForm").on("click","input[name=insertcart_food_no]",function(){
			
			if($(this).prop("checked"))
			{
				$("input[name=foodshop_no]").each(function () {
					$(this).prop("checked",false);
				});
				 $("#deleteFoodBtnDiv").html("");
				 $("#cartDiv").html(cartForm);
			} 
		});
		// 숙박 라디오 버튼을 눌렀을때
		$("#lodgeZimForm").on("click","input[name=insertcart_lodge_no]",function(){
			if($(this).prop("checked"))
			{
				$("input[name=lodge_no]").each(function () {
					$(this).prop("checked",false);
				});
				 $("#deleteLodgeBtnDiv").html("");
				 $("#cartDiv").html(cartForm);
			} 
		});
		//교통 라디오 버튼을 눌렀을때
		$("#trafficZimForm").on("click","input[name=insertcart_traffic_no]",function(){
			if($(this).prop("checked"))
			{
				$("input[name=bus_no]").each(function () {
					$(this).prop("checked",false);
				});
				$("input[name=train_no]").each(function () {
					$(this).prop("checked",false);
				});
				 $("#deleteTrafficBtnDiv").html("");
				 $("#cartDiv").html(cartForm);
			} 
		});
		/////교통삭제checkbox을 눌렀을때
		$("#trafficZimForm").on("click", function () {
			var traFlag = false;
			$("input[name=bus_no]").each(function (index,item) {
				if(item.checked)
				{
					$("input[type='radio'][name=insertcart_traffic_no]").prop("checked",false);
					traFlag = true;	 
					if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
					$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
					$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
					{
							$("#cartDiv").html(cartForm);
					}
					else
					{
							$("#cartDiv").html("");	
					}
				}
			});
			$("input[name=train_no]").each(function (index,item) {
				if(item.checked)
				{
					$("input[type='radio'][name=insertcart_traffic_no]").prop("checked",false);
					traFlag = true;	 
					if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
					$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
					$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
					{
							$("#cartDiv").html(cartForm);
					}
					else
					{
							$("#cartDiv").html("");	
					}
				}
			});
			if(traFlag)
			{
				$("#deleteTrafficBtnDiv").html("<input type='submit' class='btn btn-danger btn-lg' value='교통삭제'>");
			}
			else
			{
				 $("#deleteTrafficBtnDiv").html("");
			}
		});
		/////숙박 삭제checkbox를 눌렀을때
		$("#lodgeZimForm").on("click", function () {
			var lodgFlag = false;
			$("input[name=lodge_no]").each(function (index,item) {
				if(item.checked)
				{
					
					$("input[type='radio'][name=insertcart_lodge_no]").prop("checked",false);
					lodgFlag = true;
					if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
					$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
					$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
					{
							$("#cartDiv").html(cartForm);
					}
					else
					{
							$("#cartDiv").html("");	
					}
				}
			});
			
			if(lodgFlag)
			{
				$("#deleteLodgeBtnDiv").html("<input type='submit' name='lodgeSubmit' class='btn btn-danger' value='숙박삭제'>");
			}
			else
			{
				 $("#deleteLodgeBtnDiv").html("");
			}
		});
		////음식 삭제 checkbox를 눌렀을때
		$("#foodZimForm").on("click", function () {
			var foodFlag = false;
			$("input[name=foodshop_no]").each(function (index,item) {
				if(item.checked)
				{
					$("input[type='radio'][name=insertcart_food_no]").prop("checked",false);
					foodFlag = true;	 
					if($("#lodgeZimForm input[type='radio'][name=insertcart_lodge_no]:checked").length == 1 ||
					$("#foodZimForm input[type='radio'][name=insertcart_food_no]:checked").length == 1 ||
					$("#trafficZimForm input[type='radio'][name=insertcart_traffic_no]:checked").length == 1)
					{
							$("#cartDiv").html(cartForm);
					}
					else
					{
							$("#cartDiv").html("");	
					}
				}
			});
			
			if(foodFlag)
			{
				$("#deleteFoodBtnDiv").html("<input type='submit' class='btn btn-danger' value='음식점삭제'>");
			}
			else
			{
				 $("#deleteFoodBtnDiv").html("");
			}
		});
		//////
		$("#trafficZimForm").on("click","#deleteTrafficBtnDiv input[type='submit']",function(){
			$("#trafficZimForm").submit();
		});
		$("#trafficZimForm").submit(function () {
			
			//alert($("#trafficZimForm input[name=bus_no]:checked").val());
			//$("#trafficZimForm input[type='radio'][name=traffic_no]:checked").val()
			var bus_no = [];
			var train_no = [];
			
			$("#trafficZimForm input[name=bus_no]:checked").each(function() {
				bus_no.push($(this).val());
			});
			
			$("#trafficZimForm input[name=train_no]:checked").each(function() {
				train_no.push($(this).val());
			});
			
			if(bus_no.length == 0 && train_no.length == 0)
			{
				alert("삭제할 교통을 선택하세요");
				return false;
			}
			
			var flag = confirm("선택한 교통을 삭제하시겠습니까?");
			if(flag == false)
			{
				return false;
			}
		});
		
		////////////////////////////////////////////////숙박관련
		$("#lodgeZimForm").on("click","#deleteLodgeBtnDiv input[type='submit']",function(){
			$("#lodgeZimForm").submit();
		});
		$("#lodgeZimForm").submit(function(){
			var lodge_no = [];
			$("#lodgeZimForm input[name=lodge_no]:checked").each(function() {
				lodge_no.push($(this).val());
			});
			if(lodge_no.length == 0){
				alert("삭제할 숙박지를 선택하세요");
				return false;
			}
			var flag = confirm("선택한 숙박지를 삭제하시겠습니까?");
			if(flag == false){
				return false;
			}
		});
		
		////////////////////////////////////////////////음식관련
		
		//음식
		$("#foodZimForm").on("click","#deleteFoodBtnDiv input[type='submit']",function(){
			$("#foodZimForm").submit();
		});
		$("#foodZimForm").submit(function(){
			var foodshop_no=[];
			$("#foodZimForm input[name=foodshop_no]:checked").each(function(){
				foodshop_no.push($(this).val());
			});
			if(foodshop_no.length==0){
				alert("삭제할 음식을 선택하세요");
				return false;
			}
			var flag = confirm("선택한 음식을 삭제하시겠습니까?");
			if(flag == false)
			{
				return false;
			}
		});//음식 끝
	});
</script>
<div class="container" align="center">
<h2>찜목록</h2>
<c:if test="${!empty trafficList.busList || !empty trafficList.trainList}">
<form id="trafficZimForm" action="login_deleteTrafficZim.do">
	<h3>교통</h3><br>
	
	<table border="1" class="table custab">
		<tr class="box-black">
			<th>출발터미널,역이름</th>
			<th>출발시간</th>
			<th>도착지점</th>
			<th>가격</th>
			<th>소요시간</th>
			<th>종류</th>
			<th>삭제</th>
			<th>담기</th>
		</tr>
		
		<c:if test="${!empty trafficList.busList}">
			<c:forEach items="${trafficList.busList }" var = "list">
			
			<tr>
				<td>${list.terminalVO.terminal_name }</td>
				<td>${list.operation_time }</td>
				<td>${list.end_area }</td>
				<td>${list.price }원</td>
				<td>${list.leadTime }</td>
				<td>${list.busType }</td>
				<td align="center"><input type="checkbox" name="bus_no" value="${list.bus_no }"></td>
				<td align="center"><input type="radio" name="insertcart_traffic_no" value="bus/${list.bus_no }"></td>
			</tr>
			
			</c:forEach>
		</c:if>
		<c:if test="${!empty trafficList.trainList}">
			<c:forEach items="${trafficList.trainList }" var = "list">
			<tr>
				<td>${list.stationVO.station_name }</td>
				<td>${list.operation_time }</td>
				<td>${list.end_area }</td>
				<td>${list.price }원</td>
				<td>${list.leadTime }</td>
				<td>${list.trainType }</td>
				<td align="center"><input type="checkbox" name="train_no" value="${list.train_no }"></td>
				<td align="center"><input type="radio" name="insertcart_traffic_no" value="train/${list.train_no }"></td>
			</tr>
			</c:forEach>
		</c:if>
		
	</table>
	
	<div id="deleteTrafficBtnDiv"></div>
	
</form>
</c:if>
<!-- 숙박 -->

<c:if test="${!empty lodgeList }">
<hr>
<form id="lodgeZimForm" action="login_deleteLodgeZim.do">
	<h3>숙박</h3><br>
	<table border="1" class="table custab">
		<tr class="box-black">
			<th>숙박지역</th>
			<th>숙박종류</th>
			<th>숙소이름</th>
			<th>가격</th>		
			<th>삭제</th>
			<th>담기</th>
		</tr>
		<c:forEach items="${lodgeList }" var = "list">
			<tr>
				<td>${list.local_area }</td>
				<td>${list.lodgetype }</td>
				<td>${list.shopname }</td>
				<td>${list.price }원</td>			
				<td align="center"><input type="checkbox" name="lodge_no" value="${list.lodge_no }"></td>
				<td align="center"><input type="radio" name="insertcart_lodge_no" value="${list.lodge_no }"></td>
			</tr>
		</c:forEach>		
	</table>
	<div id="deleteLodgeBtnDiv"></div>
	
</form>	
</c:if>
<!--  음식 찜리스트 -->

<c:if test="${!empty bestFoodList }">
<hr>
	<form id="foodZimForm" action="login_deleteFoodZim.do">
		<h3>음식</h3><br>
		<table border="1" class="table custab">
			<tr class="box-black">
				<th>가게명</th>
				<th>위치</th>
				<th>종류</th>
				<th>주소</th>
				<th>메인메뉴</th>
				<th>가격</th>
				<th>삭제</th>
				<th>담기</th>
			</tr>
			<c:forEach items="${bestFoodList }" var="bestFoodList">
			<tr>
				<td>${bestFoodList.shopname }</td>
				<td>${bestFoodList.local_area }</td>
				<td>${bestFoodList.foodtype }</td>
				<td>${bestFoodList.shop_add }</td>
				<td>${bestFoodList.main_food }</td>
				<td>${bestFoodList.main_price }원</td>
				<td align="center"><input type="checkbox" name="foodshop_no" value="${bestFoodList.foodshop_no }"></td>
				<td align="center"><input type="radio" name="insertcart_food_no" value="${bestFoodList.foodshop_no }"></td>
				</tr>
			</c:forEach>
		</table>
		<div id="deleteFoodBtnDiv"></div>
		
	</form>

</c:if>
<form id="cartForm" action="login_cartInsert.do">
	<input type="hidden" name="traffic_no" value="">
	<input type="hidden" name="lodge_no" value="">
	<input type="hidden" name="foodshop_no" value="">
	<div id = "cartDiv"></div>
</form>
</div>

