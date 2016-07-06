<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#busModal").on("shown.bs.modal", function () {
			var bus_no = $(".cartDiv").parent().parent().find("input[name=bus_no]").val();
			$.ajax({
				type:"get",
				url:"cartDetailInfoByBus.do?bus_no="+bus_no,
				dataType:"json",
				success:function(jsonData){
					//alert(jsonData.bus_no);
					var busMessg = "<table border='1' class='table custab'>";
					/* busMessg += "<tr>";
					busMessg += "<th>버스번호</th>";
					busMessg += "<td>"+jsonData.bus_no+"</td>";
					busMessg += "</tr>"; */
					busMessg += "<tr>";
					busMessg += "<th>출발시간</th>";
					busMessg += "<td>"+jsonData.operation_time+"</td>";
					busMessg += "</tr>";
					busMessg += "<tr>";
					busMessg += "<th>출발터미널</th>";
					busMessg += "<td>"+jsonData.terminalVO.terminal_name+"</td>";
					busMessg += "</tr>";
					busMessg += "<tr>";
					busMessg += "<th>도착지역</th>";
					busMessg += "<td>"+jsonData.end_area+"</td>";
					busMessg += "</tr>";
					busMessg += "<tr>";
					busMessg += "<th>가격</th>";
					busMessg += "<td>"+jsonData.price+"</td>";
					busMessg += "</tr>";
					busMessg += "<tr>";
					busMessg += "<th>소요시간</th>";
					busMessg += "<td>"+jsonData.leadTime+"</td>";
					busMessg += "</tr>";
					busMessg += "<tr>";
					busMessg += "<th>버스종류</th>";
					busMessg += "<td>"+jsonData.busType+"</td>";
					busMessg += "</tr>";
					busMessg += "</table>";
					$(".modal-body").html(busMessg);
				}
			});
		});
	
		
		//기차
		$("#trainModal").on("shown.bs.modal", function () {
			var train_no = $(".cartDiv").parent().parent().find("input[name=train_no]").val();
			$.ajax({
				type:"get",
				url:"cartDetailInfoByTrain.do?train_no="+train_no,
				dataType:"json",
				success:function(jsonData){
					//alert(jsonData.bus_no);
					var trainMessg = "<table border='1' class='table custab'>";
					/* trainMessg += "<tr>";
					trainMessg += "<th>기차번호</th>";
					trainMessg += "<td>"+jsonData.train_no+"</td>";
					trainMessg += "</tr>"; */
					trainMessg += "<tr>";
					trainMessg += "<th>출발시간</th>";
					trainMessg += "<td>"+jsonData.operation_time+"</td>";
					trainMessg += "</tr>";
					trainMessg += "<tr>";
					trainMessg += "<th>출발역</th>";
					trainMessg += "<td>"+jsonData.stationVO.station_name+"</td>";
					trainMessg += "</tr>";
					trainMessg += "<tr>";
					trainMessg += "<th>도착지역</th>";
					trainMessg += "<td>"+jsonData.end_area+"</td>";
					trainMessg += "</tr>";
					trainMessg += "<tr>";
					trainMessg += "<th>가격</th>";
					trainMessg += "<td>"+jsonData.price+"</td>";
					trainMessg += "</tr>";
					trainMessg += "<tr>";
					trainMessg += "<th>소요시간</th>";
					trainMessg += "<td>"+jsonData.leadTime+"</td>";
					trainMessg += "</tr>";
					trainMessg += "<tr>";
					trainMessg += "<th>기차종류</th>";
					trainMessg += "<td>"+jsonData.trainType+"</td>";
					trainMessg += "</tr>";
					trainMessg += "</table>";
					$(".modal-body").html(trainMessg);
				}
			});
		});
		
		//숙박
		$("#lodgeModal").on("shown.bs.modal", function () {
			var lodge_no = $(".cartDiv").parent().parent().find("input[name=lodge_no]").val();
			$.ajax({
				type:"get",
				url:"cartDetailInfoByLodge.do?lodge_no="+lodge_no,
				dataType:"json",
				success:function(jsonData){
					//alert("lodge");
					//alert(jsonData[0].lodgePictureVO.picture_name);
					var lodgeMessg = "<table border='1' class='table custab'>";
					lodgeMessg += "<tr>";
					lodgeMessg += "<th>숙박정보</th>";
					lodgeMessg += "<td>"+jsonData[0].lodgetype+"</td>";
					lodgeMessg += "</tr>";
					lodgeMessg += "<tr>";
					lodgeMessg += "<th>지역</th>";
					lodgeMessg += "<td>"+jsonData[0].local_area+"</td>";
					lodgeMessg += "</tr>";
					lodgeMessg += "<tr>";
					lodgeMessg += "<th>숙소</th>";
					lodgeMessg += "<td>"+jsonData[0].shopname+"</td>";
					lodgeMessg += "</tr>";
					lodgeMessg += "<tr>";
					lodgeMessg += "<th>가격</th>";
					lodgeMessg += "<td>"+jsonData[0].price+"</td>";
					lodgeMessg += "</tr>";
					lodgeMessg += "<tr>";
					lodgeMessg += "<th>상세정보</th>";
					lodgeMessg += "<td>"+jsonData[0].shopinfo+"</td>";
					lodgeMessg += "</tr>";
					lodgeMessg += "<tr>";
					lodgeMessg += "<td colspan = '2' width='50%'><br><br><div id='pictureView'><img src='${initParam.root}resources/img/lodge/"+ jsonData[0].lodgePictureVO.picture_name +"' alt='...'  width=100% height=300 align='middle'></div><br><br></td>";
					lodgeMessg += "</tr>";
					lodgeMessg += "</table>";
					$(".modal-body").html(lodgeMessg);
				}
			});
		});
		
		//음식
		$("#foodModal").on("shown.bs.modal", function () {
			var foodshop_no = $(".cartDiv").parent().parent().find("input[name=foodshop_no]").val();
			$.ajax({
				type:"get",
				url:"cartDetailInfoByFood.do?foodshop_no="+foodshop_no,
				dataType:"json",
				success:function(jsonData){
					var foodMessg = "<table border='1' class='table custab'>";
					foodMessg += "<tr>";
					foodMessg += "<th>음식정보</th>";
					foodMessg += "<td>"+jsonData[0].bestFoodVO.foodtype+"</td>";
					foodMessg += "</tr>";
					foodMessg += "<tr>";
					foodMessg += "<th>지역</th>";
					foodMessg += "<td>"+jsonData[0].bestFoodVO.local_area+"</td>";
					foodMessg += "</tr>";
					foodMessg += "<tr>";
					foodMessg += "<th>음식점</th>";
					foodMessg += "<td>"+jsonData[0].bestFoodVO.shopname+"</td>";
					foodMessg += "</tr>";
					foodMessg += "<tr>";
					foodMessg += "<th>메뉴</th>";
					foodMessg += "<td>"+jsonData[0].food_name+"</td>";
					foodMessg += "</tr>";
					foodMessg += "<tr>";
					foodMessg += "<th>가격</th>";
					foodMessg += "<td>"+jsonData[0].price+"</td>";
					foodMessg += "</tr>";
					
					foodMessg += "<tr>";
					foodMessg += "<td colspan = '2' width='50%'><br><br><div id='pictureView'><img src='${initParam.root}resources/img/food/menu/"+ jsonData[0].food_picture +"' alt='...'  width=100% height=300 align='middle'></div><br><br></td>";
					foodMessg += "</tr>";
					foodMessg += "</table>";
					$(".modal-body").html(foodMessg);
				}
			});
		});
		
	});
</script>
<div class="container" align="center">
<div class="cartDiv">
<h2>장바구니</h2>
<hr>
<c:if test="${!empty cartListVO}">
	<c:forEach items="${cartListVO.cartList }" var="list" varStatus="stat">
	<table border="1" class="table custab">
	<div class="addHeight"></div>
		<c:if test="${!empty list.busVO }">
			<input type="hidden" name="bus_no" value="${list.busVO.bus_no }">
			<tr class="bus box-col-top" >
				<td>교통</td>
				<td>${list.busVO.terminalVO.terminal_name } --> ${list.busVO.end_area }</td>
				<td>${list.busVO.busType}</td>
				<td>${list.busVO.price } 원</td>
				<td width="60px"><input type="button" name="busBtn" value="상세보기" class="btn btn-warning" data-toggle="modal" data-target="#busModal"></td>
			</tr>
		
		</c:if>
		<c:if test="${!empty list.trainVO}">
			<input type="hidden" name="train_no" value="${list.trainVO.train_no }">
			<tr class="train box-col-top">
				<td>교통</td>
				<td>${list.trainVO.stationVO.station_name } --> ${list.trainVO.end_area }</td>
				<td>${list.trainVO.trainType}</td>
				<td>${list.trainVO.price }원</td>
				<td width="60px"><input type="button" name="busBtn" value="상세보기" class="btn btn-warning" data-toggle="modal" data-target="#trainModal"></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.lodgeVO }">
			<input type="hidden" name="lodge_no" value="${list.lodgeVO.lodge_no }">
			<tr class="lodge box-col-top">
				<td>숙박</td>
				<td>${list.lodgeVO.local_area }</td>
				<td>${list.lodgeVO.shopname }</td>
				<td>${list.lodgeVO.price }원</td>
				<td width="60px"><input type="button" name="busBtn" value="상세보기" class="btn btn-warning" data-toggle="modal" data-target="#lodgeModal"></td>
			</tr>
		</c:if>
		<c:if test="${!empty list.bestFoodVO }">
			<input type="hidden" name="foodshop_no" value="${list.bestFoodVO.foodshop_no }">
			<tr class="food box-col-top">
				<td>음식</td>
				<td>${list.bestFoodVO.local_area }</td>
				<td>${list.bestFoodVO.main_food }</td>
				<td>${list.bestFoodVO.main_price }원</td>
				<td width="60px"><input type="button" name="busBtn" value="상세보기" class="btn btn-warning" data-toggle="modal" data-target="#foodModal"></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" class="box-col-bottom">총금액 : ${list.totalPrice }원</td>
		</tr>
	</table>
	<div id="trafficDetail"></div>
	<hr>
	</c:forEach>
<div align="center">
	<ul class="pagination">			
		<p class="paging">
			<c:set var="pb" value="${cartListVO.pagingBean}"></c:set>
			<c:if test="${pb.previousPageGroup}">
				&nbsp;
				<li>
					<a href="${initParam.root }login_cartList.do?pageNo=${pb.startPageOfPageGroup-1}">◀</a>&nbsp;
				</li>
			</c:if>		
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li>
						<a href="${initParam.root }login_cartList.do?pageNo=${i}">${i}</a> 
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="#">${i}</a>
					</li>
				</c:otherwise>
				</c:choose>
				&nbsp;
			</c:forEach>	 			
			<c:if test="${pb.nextPageGroup}">
				&nbsp;
				<li>
					<a href="login_cartList.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>&nbsp;
				</li>
			</c:if>			 
		</p>
	</ul>
</div>
</c:if>
</div>
</div>

<div class="modal fade" id="busModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">버스정보</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
</div>

<div class="modal fade" id="trainModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
		<h4 class="modal-title" id="myModalLabel">기차정보</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
</div>

<div class="modal fade" id="lodgeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
		<h4 class="modal-title" id="myModalLabel">숙박정보</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
</div>

<div class="modal fade" id="foodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">닫기</span></button>
		<h4 class="modal-title" id="myModalLabel">음식정보</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
</div>
