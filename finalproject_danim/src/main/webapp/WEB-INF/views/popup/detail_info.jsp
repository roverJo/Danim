<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
<!-- <style type="text/css">
.custab {
	border: 1px solid #ccc;
	padding: 5px;
	/* margin: 5% 0; */
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}
.custab tr>th{
	border: 1px solid white;
	color: white;
	text-align: center;
	background-color: #ec9e9e;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}
/* 테이블 색깔 지정 */
	.box-black {
	background-color: #ec9e9e;
	/* rgba(0, 0, 0, 0.7) */
	}
	/*********************/
	.box-col-top{
	background-color: #fdfdcc;
	color: #cc6262;
	}
	.box-col-bottom{
	background-color: #32d66c;
	color: #fffdfd;
	}
	/* 테이블 속성 길이 지정 */
	.box-time{
		width: 71px;
		color: white;
		text-align: center;
	}
	.box-notice{
		width: 60px;
		color: white;
		text-align: center;
	}
</style> -->

<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		 $("#pic1").click(function(){
			$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[0].lodgePictureVO.picture_name }'width=800 height=500>");
		});
		 $("#pic2").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[1].lodgePictureVO.picture_name }'width=800 height=500>");
			});
		 $("#pic3").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[2].lodgePictureVO.picture_name }'width=800 height=500>");
			});		
		 $("#pic4").click(function(){
				$("#pictureView").html("<img src='${initParam.root}${requestScope.lodgeVO[3].lodgePictureVO.picture_name }'width=800 height=500>");
			});	
		 
		 $("#foodpic1").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[0].food_picture}'width=100% height=500>");
			});
		 $("#foodpic2").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[1].food_picture}'width=100% height=500>");
			});
		 $("#foodpic3").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[2].food_picture}'width=100% height=500>");
			});		
		 $("#foodpic4").click(function(){
				$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[3].food_picture}'width=100% height=500>");
			});
	});
	
</script>

</head>
<body>
<!-- 버스상세정보 -->
<c:if test="${busVO != null }">
	<table border='1' class="table custab">
		<%-- <tr>
			<th>버스번호</th>
			<td>${busVO.bus_no }</td>
		</tr> --%>
		<tr>
			<th>출발시간</th>
			<td>${busVO.operation_time}</td>
		</tr>
		<tr>
			<th>출발터미널</th>
			<td>${busVO.terminalVO.terminal_name}</td>
		</tr>
		<tr>
			<th>도착지역</th>
			<td>${busVO.end_area}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${busVO.price}</td>
		</tr>
		<tr>
			<th>소요시간</th>
			<td>${busVO.leadTime}</td>
		</tr>
		<tr>
			<th>버스종류</th>
			<td>${busVO.busType}</td>
		</tr>
	</table>
</c:if>
<!-- 기차상세정보 -->
<c:if test="${trainVO != null }">
	<table border='1' class="table custab">
		<%-- <tr>
			<th>기차번호</th>
			<td>${trainVO.train_no }</td>
		</tr> --%>
		<tr>
			<th>출발시간</th>
			<td>${trainVO.operation_time}</td>
		</tr>
		<tr>
			<th>출발역</th>
			<td>${trainVO.stationVO.station_name}</td>
		</tr>
		<tr>
			<th>도착지역</th>
			<td>${trainVO.end_area}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${trainVO.price}</td>
		</tr>
		<tr>
			<th>소요시간</th>
			<td>${trainVO.leadTime}</td>
		</tr>
		<tr>
			<th>기차종류</th>
			<td>${trainVO.trainType}</td>
		</tr>
	</table>
</c:if>
<!-- 숙박상세정보 -->
<c:if test="${!empty lodgeVO }">
	<table class="table table-striped ">
	<tr>
	<td>
	<table class="table">
	<tr>
	<td width="50%"><br><br><div id="pictureView"><img src="${initParam.root}${requestScope.lodgeVO[0].lodgePictureVO.picture_name }" alt="..."  width=100% height=500 align="middle"></div><br><br></td>
	</tr>
	<tr>
	<td>
	<c:forEach var="list" items="${requestScope.lodgeVO}" varStatus="i">
	<img src="${initParam.root}${list.lodgePictureVO.picture_name }" alt="..."  width=24% height=150 id="pic${i.index+1}"></img>
	</c:forEach>
	<hr>
	</td>
	</tr>
	</table></td>
	<td rowspan=3 width="50%">
	<h2>${lodgeVO[0].lodgetype } 정보</h2>
	<hr>
	<br>
	지역 : ${requestScope.lodgeVO[0].local_area}
	<br><br>
	숙소 : ${requestScope.lodgeVO[0].shopname }
	<br><br>
	가격 : ${requestScope.lodgeVO[0].price}
	<br>
	<hr>
	<h4>상세정보</h4><br><br>
	${requestScope.lodgeVO[0].shopinfo}
</td>
</tr>
</table>
</c:if>
<!-- 음식상세정보 -->
<c:if test="${!empty dList }">
	<table class="table custab">
	<tr>
	<td>
	<table class="table custab">
	<tr>
	<td width="50%"><br><br><div id="pictureView"><img src="${initParam.root}resources/img/food/menu/${dList[0].food_picture}" alt="..."  width=100% height=500 align="middle"></div><br><br></td>
	</tr>
	<tr>
	<td>
	<c:forEach var="list" items="${requestScope.dList}" varStatus="i">
	<img src="${initParam.root }resources/img/food/menu/${list.food_picture}" alt="..."  width=24% height=150  id="foodpic${i.index+1}"></img>
	</c:forEach>
	<hr>
	
	</td>
	</tr>
	</table></td>
	<td rowspan=3 width="50%">
	<h2>정보</h2>
	<hr>
	<br>
	메뉴 : ${requestScope.dList[0].food_name }
	<br><br>
	가격 : ${requestScope.dList[0].price}
	<br>
	<hr>
	
	</td>
	</tr>
	</table>
</c:if>
</body>
</html>