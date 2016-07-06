<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function () {
		///////////////////////////////////////////////
		//처음 area지역 select에 넣음
		if($("#searchArea").html() == "")
		{
			$.ajax({
				type:"get",
				url:"searchArea.do",
				dataType:"json",
				success:function(area){
					//alert(jsonData[0].area_name);
					var selectArea ="<select class='form-control' id='areaName'>";
					selectArea += "<option value=''>출발지를 선택하세요</option>";
					for(var i = 0 ; i < area.length; i++)
					{
						selectArea += "<option value="+area[i].area_name+">"+area[i].area_name+"</option>";
					}
					selectArea += "</select>";
					$("#searchArea").html(selectArea);
				}
			});
		}
		///////////////////////////////////////////////////////////////
		//areaName의 option이 선택됬을경우
		$("#trafficForm").on("change", "#areaName", function () {
			$("#searchKind").html("");
			$("#searchTerminalorStation").html("");
			$("#searchEndArea").html("");
			$("#basketTraffic").html("");
			$("#searchResult").html("");
			if($(this).val() != "")
			{
				var selectKind = "<select class='form-control' id='kind'>"
				selectKind += "<option value=''>수단을 선택하세요</option>"
				selectKind += "<option value='버스'>버스</option>";
				selectKind += "<option value='기차'>기차</option>";
				selectKind += "</select>";
				$("#searchKind").html(selectKind);
			}
		});
		//////////////////////////////////////////////////////////////
		//kind의 option이 선택됬을경우
		$("#trafficForm").on("change", "#kind", function () {
			$("#searchTerminalorStation").html("");
			$("#searchEndArea").html("");
			$("#basketTraffic").html("");
			$("#searchResult").html("");
			if($(this).val() == "버스")
			{
				$.ajax({
					type:"get",
					url:"searchTerminal.do?area_name="+$("#areaName").val(),
					dataType:"json",
					success:function(terminalList){
						var selectTerminal ="<select class='form-control' id='terminalName'>";
						selectTerminal += "<option value=''>터미널을 선택하세요</option>";
						for(var i = 0 ; i < terminalList.length; i++)
						{
							selectTerminal += "<option value="+terminalList[i].terminal_no+">"+terminalList[i].terminal_name+"</option>";
						}
						selectTerminal += "</select>";
						$("#searchTerminalorStation").html(selectTerminal);
					}
				});
			}
			else if($(this).val() == "기차")
			{
				$.ajax({
					type:"get",
					url:"searchStation.do?area_name="+$("#areaName").val(),
					dataType:"json",
					success:function(stationList){
						var selectStation ="<select class='form-control' id='stationName'>";
						selectStation += "<option value=''>역을 선택하세요</option>";
						for(var i = 0 ; i < stationList.length; i++)
						{
							selectStation += "<option value="+stationList[i].station_no+">"+stationList[i].station_name+"</option>";
						}
						selectStation += "</select>";
						$("#searchTerminalorStation").html(selectStation);
					}
				});
			}
		});
		/////////////////////////////////////////////////////////////
		//terminalName의 option이 선택됬을경우
		$("#trafficForm").on("change", "#terminalName", function () {
			$("#searchEndArea").html("");
			$("#basketTraffic").html("");
			$("#searchResult").html("");
			if($(this).val() != "")
			{
				$.ajax({
					type:"get",
					url:"searchEndAreaByTer.do?terminalName="+$("#terminalName").val(),
					dataType:"json",
					success:function(endAreaList){
						var selectEndArea ="<select class='form-control' id='endAreaName'>";
						selectEndArea += "<option value=''>도착지를 선택하세요</option>";
						for(var i = 0 ; i < endAreaList.length; i++)
						{
							selectEndArea += "<option value="+endAreaList[i]+">"+endAreaList[i]+"</option>";
						}
						selectEndArea += "</select>";
						$("#searchEndArea").html(selectEndArea);
					}
				});
			}
		});
		//////////////////////////////////////////////////////////////
		//stationName의 option이 선택됬을경우
		$("#trafficForm").on("change", "#stationName", function () {
			$("#searchEndArea").html("");
			$("#basketTraffic").html("");
			$("#searchResult").html("");
			if($(this).val() != "")
			{
				$.ajax({
					type:"get",
					url:"searchEndAreaBySta.do?stationName="+$("#stationName").val(),
					dataType:"json",
					success:function(endAreaList){
						var selectEndArea ="<select class='form-control' id='endAreaName'>";
						selectEndArea += "<option value=''>도착지를 선택하세요</option>";
						for(var i = 0 ; i < endAreaList.length; i++)
						{
							selectEndArea += "<option value="+endAreaList[i]+">"+endAreaList[i]+"</option>";
						}
						selectEndArea += "</select>";
						$("#searchEndArea").html(selectEndArea);
					}
				});
			}
		});
		////////////////////////////////////////////////////////////////
		//endAreaName의 option이 선택됬을경우
		$("#trafficForm").on("change", "#endAreaName", function () {
			$("#basketTraffic").html("");
			$("#searchResult").html("");
			if($(this).val() != "")
			{
				$("#basketTraffic").html("<input type='button' class='btn btn-info btn-md-4' id='searchBtn' value='검색'>");	
			}
		});
		//////////////////////////////////////////////////////////////////
		//검색버튼을 눌렀을경우
		$("#trafficForm").on("click", "#searchBtn", function () {
			$.ajax({
				type:"get",
				url:"chkLogging.do",
				dataType:"json",
				success:function(flag){
					//로그인 상태면 false
					//로그아웃 상태면 true
					$.ajax({
						type:"get",
						url:"searchTraffic.do?kind="+$("#kind").val()+"&end_area="+$("#endAreaName").val()+"&terminal_no="+$("#terminalName").val()+"&station_no="+$("#stationName").val(),
						dataType:"json",
						success:function(trafficVO){
							var result = "<table border='1' class='table custab'><tbody>";
							if(trafficVO.busList != null)
							{
								result += "<input type='hidden' name='type' value='bus'>";
								result += "<tr class='box-black'>";
								/* result +="<th>버스번호</th>"; */
								result +="<th>출발시간</th>";
								result +="<th>출발터미널</th>";
								result +="<th>도착지역</th>";
								result +="<th>가격</th>";
								result +="<th>소요시간</th>";
								result +="<th>좌석</th>";
								if(!flag)
								{
									result +="<th>선택</th>";
								}
								result +="</tr>";
								for(var i = 0; i < trafficVO.busList.length; i++)
								{
									result += "<tr>";
									/* result +="<td>"+trafficVO.busList[i].bus_no+"</td>"; */
									result +="<td>"+trafficVO.busList[i].operation_time+"</td>";
									result +="<td>"+trafficVO.busList[i].terminalVO.terminal_name+"</td>";
									result +="<td>"+trafficVO.busList[i].end_area+"</td>";
									result +="<td>"+trafficVO.busList[i].price+"</td>";
									result +="<td>"+trafficVO.busList[i].leadTime+"</td>";
									result +="<td>"+trafficVO.busList[i].busType+"</td>";
									if(!flag)
									{
										result +="<td align='center'><input type='radio' name ='traffic_no' class='radio' value='"+trafficVO.busList[i].bus_no+"'></td>";	
									}
									result +="</tr>";									
								}
							}
							else if(trafficVO.trainList != null)
							{
								result += "<input type='hidden' name='type' value='train'>";
								result += "<tr class='box-black'>";
								/* result +="<th>기차번호</th>"; */
								result +="<th>출발시간</th>";
								result +="<th>출발역</th>";
								result +="<th>도착지역</th>";
								result +="<th>가격</th>";
								result +="<th>소요시간</th>";
								result +="<th>기차종류</th>";
								if(!flag)
								{
									result +="<th>선택</th>";
								}
								result +="<tr>";
								for(var i = 0; i < trafficVO.trainList.length; i++)
								{
									result += "<tr>";
									/* result +="<td>"+trafficVO.trainList[i].train_no+"</td>"; */
									result +="<td>"+trafficVO.trainList[i].operation_time+"</td>";
									result +="<td>"+trafficVO.trainList[i].stationVO.station_name+"</td>";
									result +="<td>"+trafficVO.trainList[i].end_area+"</td>";
									result +="<td>"+trafficVO.trainList[i].price+"</td>";
									result +="<td>"+trafficVO.trainList[i].leadTime+"</td>";
									result +="<td>"+trafficVO.trainList[i].trainType+"</td>";
									if(!flag)
									{
										result +="<td align='center'><input type='radio' name ='traffic_no' value="+trafficVO.trainList[i].train_no+"></td>";
									}
									result +="</tr>";
								}
							}
							result += "</tbody></table>";
							$("#searchResult").html(result);
						}
					});
				}
			});
		});
		///////////////////////////////////////////////////////////
		$("#trafficForm").on("change", "input[type='radio'][name=traffic_no]", function () {
			if($("#trafficForm input[type='radio'][name=traffic_no]:checked").length == 1)
			{
				var flag = confirm("찜목록에 넣으시겠습니까?");
				if(flag == true)
				{
					$("#trafficForm input[name=no]").val($("#trafficForm input[type='radio'][name=traffic_no]:checked").val());
					$("#trafficForm").submit();
				}
				else
				{
					$(this).prop("checked",false);
				}
			}
		});
		
		//////////////////////////////////////////////////////////////////
		//모든옵션이 선택되서 sumbit을 할때
		
		
	});
</script>
<div class="addHeight"></div>
<div class="container" align="center">
<h3 align="center">교통검색</h3><br>
<form id="trafficForm" method="get" action="login_checkTypeByTraffic.do">
	<input type="hidden" name="no" value="">
	<!-- 출발지역검색 -->
	<span id="searchArea" class="col-md-6"></span>
	<!-- 교통수단검색 -->
	<span id="searchKind" class="col-md-6"></span><br><br><br>
	<!-- 터미널검색or역검색 -->
	<span id="searchTerminalorStation" class="col-md-6"></span>
	<!-- 도착지역검색 -->
	<span id="searchEndArea" class="col-md-6"></span><br><br><br>
	<!-- 장바구니버튼 -->
	<span id="basketTraffic"></span><br><br><br>
	<hr>
	<div class="addHeight"></div>
	<!-- result -->
	<span id="searchResult"></span>
</form>
</div>
