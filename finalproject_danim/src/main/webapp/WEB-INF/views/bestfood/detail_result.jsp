<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){	
	var setInfo="메뉴 : ${requestScope.dList[0].food_name }<br><br>";
	setInfo+= "가격 : ${requestScope.dList[0].price}";
	$("#infoMenu").html(setInfo);
	 $("#pic1").click(function(){
		$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[0].food_picture}'width=100% height=500>");
		var menuInfo="메뉴 : ${requestScope.dList[0].food_name }<br><br>";
		menuInfo += "가격 : ${requestScope.dList[0].price}";
		$("#infoMenu").html(menuInfo);
	});
	 $("#pic2").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[1].food_picture}'width=100% height=500>");
			var menuInfo="메뉴 : ${requestScope.dList[1].food_name }<br><br>";
			menuInfo += "가격 : ${requestScope.dList[1].price}";
			$("#infoMenu").html(menuInfo);
		});
	 $("#pic3").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[2].food_picture}'width=100% height=500>");
			var menuInfo="메뉴 : ${requestScope.dList[2].food_name }<br><br>";
			menuInfo += "가격 : ${requestScope.dList[2].price}";
			$("#infoMenu").html(menuInfo);
		});		
	 $("#pic4").click(function(){
			$("#pictureView").html("<img src='${initParam.root}resources/img/food/menu/${requestScope.dList[3].food_picture}'width=100% height=500>");
			var menuInfo="메뉴 : ${requestScope.dList[3].food_name }<br><br>";
			menuInfo += "가격 : ${requestScope.dList[3].price}";
			$("#infoMenu").html(menuInfo);
		});
	 
	 /* 한줄평 */
	 $("#cmt").keydown(function(key){
			if(key.keyCode ==13){
				key.cancelBubble=true;
				$("#cmtSubmit").click();
				return false;
			} 
		 });
		 $("#cmtSubmit").click(function(event){
			var pText = $("#cmt");
			if($.trim(pText.val())==""){
				alert("내용을 입력하세요.");
				pText.focus();
				return;
			}
			$.ajax({
				type: "post",
				url: "login_regCmt.do",
				data: $("#cmtForm").serialize()+"&foodshop_no=${requestScope.dList[0].foodshop_no}",
				success: function(result){
					var cmtAdd='<table id="commentTable" class="table table-condensed">';/* id="cmtTable"   */
					$.each(result,function(index, comment){
						cmtAdd += '<tr id="r1" name="cmtCode" title="'+comment.foodcmt_no+'">';
						cmtAdd += '<td>';
						cmtAdd += '<strong style="color: #009688;">'+comment.memberVO.nickname+'</strong>';
						if("${sessionScope.mvo!=null }"){
							if(comment.memberVO.id=="${sessionScope.mvo.id}"){
								cmtAdd+=' <a id="pEdit" title="'+comment.foodcmt_no+'">수정</a> ';
								cmtAdd+='| <a id="pDel" title="'+comment.foodcmt_no+'">삭제</a>';
							}
						}
						cmtAdd += '<p>'+comment.content+'</p>';
						cmtAdd += '</td></tr>';
					});
						cmtAdd += '</table>';
						$("#cmtTarget").html(cmtAdd);
				}//success
			});//ajax
			$("#cmt").val("");
		 });
		 $("#cmtTarget").on("click", "#pEdit", function () {
			 var $commentNo = $(this).attr('title');
			 var content = $(this).siblings().filter("p");
			 var parentElement = $(this).parent();
			 var commentEditor='<tr id="commentEditor">'+'<td>'+
			 '<textarea id="commentEditText" name="commentEditText"  style="width:100%" rows="4">'+content.text()+
			 '</textarea>'+'<div>'+'<button type="button" id="commentEditSubmit" title='+$commentNo+'>확인</button>'+
			 '</div>'+'</td>'+'</tr>';
			 parentElement.html(commentEditor);
		});
		 
		 $("#cmtTarget").on("click", "#pDel", function () {
			 if (confirm("정말로 삭제하시겠습니까?") == true) {
					var $commentNo = $(this).attr('title');
					$.ajax({
						type: "post",
						url: "delCmt.do",
						data: "foodcmt_no="+$commentNo,
						success: function(result) {								
						}//success
					});//ajax
					 var delComment = $(this).parent().parent();
					 var nextTr = delComment.next();
					 var delTr;
					 delComment.remove();
			 }
			});		 
		 $("commentEditText").keydown(function(key){
			if(key.keyCode==13){
				key.cancelBubble = true;
				$("#commentEditSubmit").click();
				return false;
			} 
		 });
		 $(document).on("click","#commentEditSubmit", function(){
			var commentNo = $(this).attr("title");
			var content = $(this).parent().parent().children().eq(0);
			$('[type=text], textarea').each(function() { this.defaultValue = this.value;	});
			$.ajax({
				type: "post",
				url: "upCmt.do",
				data: "foodcmt_no="+commentNo+"&content="+content.text()+"&foodshop_no=${requestScope.dList[0].foodshop_no}",
				dataType:"json",
				success: function(result) {	
					var cmtAdd='<table>';
					$.each(result, function(index, comment) {
						cmtAdd+= '<tr id="r1" name="cmtCode" title="'+comment.foodcmt_no+'">';
						cmtAdd+='<td>';
						cmtAdd+='<strong style="color: #009688;">'+comment.memberVO.nickname+'</strong> ';
					if("${sessionScope.mvo!=null }"){						
						if(comment.memberVO.id=="${sessionScope.mvo.id}"){
							cmtAdd+=' <a id="pEdit" title="'+comment.foodcmt_no+'"> 수정</a> ';
							cmtAdd+='| <a id="pDel" title="'+comment.foodcmt_no+'"> 삭제</a>';
						}
					}	
						cmtAdd+='<p>'+comment.content+'</p>'
						cmtAdd+='</td></tr>';					
					});//each	
					cmtAdd += '</table>';
					$("#cmtTarget").html(cmtAdd);
				}//success
			});//ajax
		 });//on
});
</script>

<form id="addLodgeForm" action="login_checkZimByLodge.do" method="get">
	<input type="hidden" name="lodge_no"
		value="${requestScope.list[0].lodge_no }">
	<table class="table table-striped ">
		<tr>
			<td>
				<table class="table">
					<tr>
						<td width="50%"><br>
						<br>
						<div id="pictureView">
								<img
									src="${initParam.root}resources/img/food/menu/${dList[0].food_picture}"
									alt="..." width=100% height=500 align="middle">
							</div>
							<br>
						<br></td>
					</tr>
					<tr>
						<td><c:forEach var="list" items="${requestScope.dList}" varStatus="i">
								<img
									src="${initParam.root }resources/img/food/menu/${list.food_picture}"
									alt="..." width=24% height=150 id="pic${i.index+1}"></img>
							</c:forEach>
							<hr></td>
					</tr>
				</table>
			</td>
			<td rowspan=3 width="50%">
				<h2>정보</h2>
				<div id="infoMenu"></div>
				<hr> 
				<br><br><br><br><br><br><br><br><br>
			 <a href="#" onClick="history.back(-1);"><i class="fa fa-arrow-left" aria-hidden="true"></i> 결과페이지로 돌아가기</a>			
			</td>
		</tr>
	</table>
</form>

<div class="container_12" align="center">
<div id="commentDiv">
<div>
	<form id="cmtForm">
	<div>
		<h5>Comments <i class="fa fa-comment-o" aria-hidden="true"></i></h5>
<c:if test="${sessionScope.mvo!=null }">
		<input type="text" id="cmt" style="width: 50%; display: inline;" name="cmt" class="form-control" placeholder="한줄평을 입력하세요">
        <input type="button" value="댓글달기" id="cmtSubmit" name="cmtSubmit" class="btn" style="background-color:#3db39e; color:white;">
</c:if>
    </div>
	</form>
</div>
<div id="cmtTarget">
	<table id="commentTable" class="table table-condensed" >
		<c:forEach items="${cmtList }" var="cmtList">
		<tr>
			<td>
				<strong style="color: #009688;">${cmtList.memberVO.nickname }</strong>
				<c:if test="${sessionScope.mvo!=null }">
					<c:if test="${cmtList.memberVO.id==sessionScope.mvo.id }">
						 <a id="pEdit" title="${cmtList.foodcmt_no}">수정</a> 
						| <a id="pDel" title="${cmtList.foodcmt_no}">삭제</a>
					</c:if>
				</c:if>
				<p>${cmtList.content }</p>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
</div>
</div>