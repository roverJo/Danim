<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function loadData() {
	var loadNum = $("#moreList input[name=lodgeNum]").val();
	var endNum = Number(loadNum);
	endNum+=4;
	$("#lodgeNum").val(endNum);
	$("#moreList").submit();
}

function loadFoodData(){
	var loadNum = $("#moreList input[name=foodNum]").val();
	var endNum = Number(loadNum);
	endNum+=4;
	$("#foodNum").val(endNum);
	$("#moreList").submit();
}
function loadBusData(){
	var loadNum = $("#moreList input[name=busNum]").val();
	var endNum = Number(loadNum);
	endNum+=10;
	$("#busNum").val(endNum);
	$("#moreList").submit();
}

function loadTrainData(){
	var loadNum = $("#moreList input[name=trainNum]").val();
	var endNum = Number(loadNum);
	endNum+=10;
	$("#trainNum").val(endNum);
	$("#moreList").submit();
}

$(document).ready(function() {
	$("#busForm").on("change", "input[type='radio'][name=traffic_no]", function() {
		if($("#busForm input[type='radio'][name=traffic_no]:checked").length == 1){
			var flag = confirm("찜목록에 넣으시겠습니까?");
			if(flag == true){
				$("#busForm input[name=no]").val($("#busForm input[type='radio'][name=traffic_no]:checked").val());
				$("#busForm").submit();
			}else{
				$(this).prop("checked",false);
			}
		}
	});
	$("#trainForm").on("change", "input[type='radio'][name=traffic_no]", function() {
		if($("#trainForm input[type='radio'][name=traffic_no]:checked").length == 1){
			var flag = confirm("찜목록에 넣으시겠습니까?");
			if(flag == true){
				$("#trainForm input[name=no]").val($("#trainForm input[type='radio'][name=traffic_no]:checked").val());
				$("#trainForm").submit();
			}else{
				$(this).prop("checked",false);
			}
		}
	});
})
</script>
<div class="totalDiv">
	<div class="col-md-10">
<%--********************** 버스 List Start **********************--%>
		<div class="hiddenHeight" id="goToTraffic"></div>
		<h2>교통</h2>

		<form id="busForm" method="get" action="login_checkTypeByTraffic.do">
			<input type="hidden" name="no" value="">
			<input type="hidden" name="type" value="bus">
			<div class="hiddenHeight" id="goToBus"></div>
			<h3>버스</h3>
			<c:choose>
			<c:when test="${empty requestScope.busList }">
			'${param.totalSearch }'에 해당하는 결과가 없습니다
			</c:when>
			<c:otherwise>
			<table class="table custab">
				<tr class="box-black">
					<th>출발시간</th>
					<th>출발터미널</th>
					<th>도착지역</th>
					<th>가격</th>
					<th>소요시간</th>
					<th>좌석</th>
					<c:if test="${sessionScope.mvo!=null }">
					<th>선택</th>
					</c:if>
				</tr>
				<c:forEach items="${requestScope.busList }" var="list">
					<tr>
						<td>${list.operation_time}</td>
						<td>${list.terminalVO.terminal_name}</td>
						<td>${list.end_area}</td>
						<td>${list.price}</td>
						<td>${list.leadTime}</td>
						<td>${list.busType}</td>
						<c:if test="${sessionScope.mvo!=null }">
						<td align="center"><input type="radio" name ="traffic_no" value="${list.bus_no}"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${requestScope.busList.size()<busSize}">
				<input type="button" class="btn btn-danger btn-lg" value="더보기" onclick="loadBusData()">
			</c:if>
			</c:otherwise>
			</c:choose>
		</form>
<%--********************** 버스 List End **********************--%>

<%--********************** 기차 List Start **********************--%>
		<div class="hiddenHeight" id="goToTrain"></div>
		<h3>기차</h3>
		<form id="trainForm" method="get" action="login_checkTypeByTraffic.do">
			<input type="hidden" name="no" value="">
			<input type="hidden" name="type" value="train">
			<c:choose>
			<c:when test="${empty requestScope.trainList }">
			'${param.totalSearch }'에 해당하는 결과가 없습니다
			</c:when>
			<c:otherwise>
			<table class="table custab">
				<tr class="box-black">
					<th>출발시간</th>
					<th>출발역</th>
					<th>도착지역</th>
					<th>가격</th>
					<th>소요시간</th>
					<th>기차종류</th>
					<c:if test="${sessionScope.mvo!=null }">
					<th>선택</th>
					</c:if>
				</tr>
				<c:forEach items="${requestScope.trainList }" var="list">
					<tr>
						<td>${list.operation_time}</td>
						<td>${list.stationVO.station_name}</td>
						<td>${list.end_area}</td>
						<td>${list.price}</td>
						<td>${list.leadTime}</td>
						<td>${list.trainType}</td>
						<c:if test="${sessionScope.mvo!=null }">
						<td align="center"><input type="radio" name ="traffic_no" value="${list.train_no}"></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${requestScope.trainList.size()<testTrain.size()}">
				<input type="button" class="btn btn-danger btn-lg" value="더보기" onclick="loadTrainData()">
			</c:if>
			</c:otherwise>
			</c:choose>
		</form>
<%--********************** 기차 List End **********************--%>

<%--********************** 음식 List Start **********************--%>
		<div class="hiddenHeight" id="goToFood"></div>
		<h2>음식</h2>
		<form id="foodSearchList" action="totalSearch.do">
		<c:choose>
		<c:when test="${empty requestScope.foodList }">
		'${param.totalSearch }'에 해당하는 결과가 없습니다
		</c:when>
		<c:otherwise>
		<table class="table">
		<tr>
		<c:forEach var="list" items="${requestScope.foodList}" varStatus="i" end="${foodList.size()}">
			<c:if test="${i.index != 0 && i.index % 4  == 0}">
			</tr>
				<tr>
			</c:if>
				<td>
				<div class="searchForm">
				    <div class="thumbnail">
						<img src="${initParam.root }resources/img/food/${list.main_menu_picture}" alt="..."  class="thumimg">
							<h4>
								${list.detailarea_name }:${list.local_area }<br>
								${list.shopname }<br>
								${list.foodtype }<br>
								${list.main_food } : ${list.main_price }
							</h4>
							<p align="center">
								<a href="detailFood.do?foodshop_no=${list.foodshop_no }"
									class="btn btn-primary" role="button">상세보기</a>
							</p>
					</div>
				</div>
				</td>
		</c:forEach>
			</tr>
			<tr>
				<td>
					<c:if test="${requestScope.foodList.size()<testFood.size()}">
					<input type="button" class="btn btn-danger btn-lg" value="더보기" onclick="loadFoodData()">
					</c:if>
				</td>
			</tr>
		</table>
		</c:otherwise>
		</c:choose>
		</form>
	<!-- </div> -->
<%--********************** 음식 List End **********************--%>
	
	<!-- <div class="col-md-9" id="lodge"> -->
<%--********************** 숙박 List Start **********************--%>
		<div class="hiddenHeight" id="goToLodge"></div>
		<h2>숙박</h2>
		<form id="lodgeSearchList" action="totalSearch.do">
		<c:choose>
		<c:when test="${empty requestScope.lodgeList }">
		'${param.totalSearch }'에 해당하는 결과가 없습니다
		</c:when>
		<c:otherwise>
			<table class="table">
				<tr>
			<c:forEach var="list" items="${requestScope.lodgeList}" varStatus="i" end="${lodgeList.size()}">
			<c:if test="${i.index != 0 && i.index % 4  == 0}">
				</tr>
				<tr>
			</c:if>
				<td>
					<div class="searchForm">
					    <div class="thumbnail">
					      <img src="${initParam.root}resources/img/lodge/${list.lodgePictureVO.picture_name}" alt="..." class="thumimg">
					      <h4>${list.lodgetype }:  <br> ${list.shopname }</h4> <br>
					      <p align="center"><a href="${initParam.root}showlodge.do?no=${list.lodge_no}" class="btn btn-primary" role="button">상세보기</a>
					      </p>
					    </div>
					</div>    
				</td>
			</c:forEach>
				</tr>
				<tr>
				<td>
					<c:if test="${requestScope.lodgeList.size()<test.size()}">
					<input type="button" class="btn btn-danger btn-lg" value="더보기" onclick="loadData()">
					</c:if>
				</td>
				</tr> 
			</table>
		</c:otherwise>
		</c:choose>
		</form>
	</div>
<%--********************** 숙박 List End **********************--%>
	<div class="col-md-2" role="complementary">
	<nav class="hidden-print hidden-xs hidden-sm affix"  style="background-color: white;">
	<ul class="nav">
	<li class="active">
		<a href="#goToTraffic">교통</a>
		<ul class="nav">
		<li><a href="#goToBus">버스</a></li>
		<li><a href="#goToTrain">기차</a></li>
		</ul>
	</li>
	<li><a href="#goToFood">음식</a></li>
	<li><a href="#goToLodge">숙박</a></li>
	</ul>
	</nav>
	</div>
</div>
<form id="moreList" action="totalSearch.do">
		<input type="hidden" value="${lodgeList.size()}" name="lodgeNum" id="lodgeNum">
		<input type="hidden" value="${foodList.size()}" name="foodNum" id="foodNum">
		<input type="hidden" value="${busList.size()}" name="busNum" id="busNum">
		<input type="hidden" value="${trainList.size()}" name="trainNum" id="trainNum">
		<input type="hidden" value="${param.totalSearch }" name="totalSearch">
</form>