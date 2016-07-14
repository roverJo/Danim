<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script> --%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectForm :input[name=inputVal]").keydown(function (key) {
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	key.cancelBubble = true;
	            $("#clickBtn").click();
	            return false;
	        }
	    });
			$("#clickBtn").click(function(){
			var administer=$("#selectForm :input[name=administer]").val();
			var inputVal=$("#selectForm :input[name=inputVal]").val()
			$("#submitView").empty();
			$.ajax({
				type:"post",
				url:"findJSONAdmin.do?administer="+administer+"&inputVal="+inputVal,
				dataType:"json",
				success:function(jsonData){
					if(jsonData==""){
						$("#memberView").html("검색결과가 없습니다");
					}else{					
					var table = "<div class='addHeight'></div><table border='1' class='table custab'><tr  class='box-black'>"+
						"<th>아이디</th><th>닉네임</th><th>주소</th><th>이메일</th>";
					table+= "<th>회원권한</th><th>권한부여</th></tr>";
					for(var i=0;i<jsonData.length;i++){
						table+= "<tr><td>"+jsonData[i].id+"</td><td>"+jsonData[i].nickname+"</td><td>"+jsonData[i].address;
						table+= "</td><td>"+jsonData[i].email_add+"</td>";
						if(jsonData[i].admin>=1){
							table+="<td>운영진</td>";
						}else if(jsonData[i].admin==0){
							table+="<td>회원</td>";
						}
						table+="<td align='center'><input type='radio' name='appoint' value='"+jsonData[i].id+"'</td></tr>";
					}
					table+= "</table>";
					$("#memberView").html(table);
					if($("#memberView").html()!=""){
						$("#submitView").html("<input type='submit' value='권한부여' id='subBtn' class='btn btn-success'><div class='addHeight'></div>");
					}
					}
				}
			});
		});
		$("#selectForm").submit(function () {
			if($("#selectForm :checked[name=appoint]").val()==null){
				alert("선택하세요");
				return false;
			}
		});
		$("#adminTable input[name=fireBtn]").click(function(){
			if(confirm("권한을 해제하시겠습니까?")){
				location.href="${initParam.root}admin_fireAdmin.do?id="+$(this).attr("title");
			}
		});
	});
</script>
<div class="container_12" align="center">
<div class="addHeight"></div>
	<div class="">
		<c:if test="${sessionScope.mvo.admin==99}">
		<h3>운영진 관리</h3>
		<form id="selectForm" action="admin_appointMember.do">
		운영진 추가 <select name="administer">
		<option value="id">아이디</option>
		<option value="nickname">닉네임</option>
		</select>
		<input type="text" class="form-con" name="inputVal" >
		<input type="button" value="검색" id="clickBtn" class="btn btn-primary">
		<div id="memberView"></div>
		<div id="submitView" align="center"></div>
		</form>
		</c:if>
		
		<div class="addHeight"></div>
		
		<c:if test="${sessionScope.mvo.admin>=1}">
		<h3>운영진명단</h3>
		<table border="1" id="adminTable" class="table custab">
			<thead>
			<tr class="box-black">
				<th>아이디</th>
				<th>닉네임</th>
				<th>주소</th>
				<th>이메일</th>
				<th>회원권한</th>
				<c:if test="${sessionScope.mvo.admin==99}">
				<th>권한해제</th>
				</c:if>
			</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
				<td>${list.id}</td><td>${list.nickname}</td><td>${list.address}</td><td>${list.email_add}</td>
				<c:if test="${list.admin==1}">
				<td>운영진</td>
				</c:if>
				<c:if test="${sessionScope.mvo.admin==99}">
				<td align="center"><input type="button" value="권한해제" name="fireBtn" title="${list.id}" class="btn btn-default"></td>
				</c:if>
				</tr>	
			</c:forEach>
		</table>
		</c:if>
		<c:if test="${sessionScope.mvo.admin==0}">
		<script type="text/javascript">
		alert("관리자만 입장가능한 페이지입니다!");
		location.href="${initParam.root}home.do";
		</script>
		</c:if>
	</div>
	<div class="clear"></div>
</div>