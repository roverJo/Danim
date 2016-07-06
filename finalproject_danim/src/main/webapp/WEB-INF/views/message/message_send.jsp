<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendMessForm :input[name=recv_id]").keyup(function(){
			var id = $("#sendMessForm :input[name=recv_id]").val();
				$("#idView").empty();
				$.ajax({
					type:"post",
					url:"findJSONId.do?id="+id,
					dataType:"json",
					success:function(jsonData){
						if(jsonData==0){
							$("#idView").html("존재하지 않는 사용자입니다").css("color","red");
						}else if(jsonData==1){
							$("#idView").html("존재하는 사용자입니다").css("color","blue");
						}
					}
			});
		});
		$("#sendMessForm").submit(function(){
			if($("#idView").html()!="존재하는 사용자입니다"){
				alert("받는 사람을 확인하세요");
				return false;
			}
			if($("#sendMessForm :input[name=title]").val().trim()==""){
				alert("제목을 입력하세요");
				return false;
			}
			if($("#sendMessForm :input[name=content]").val().trim()==""){
				alert("내용을 입력하세요");
				return false;
			}
		});
	});
</script>
<!-- header -->
<div class="modal-header">
    <!-- 닫기(x) 버튼 -->
  <button type="button" class="close" data-dismiss="modal">×</button>
  <!-- header title -->
  <h3 class="modal-title">쪽지 보내기</h3>
</div>
<!-- body -->
<div class="modal-body" align="center">
	<form action="login_sendMessage.do" id="sendMessForm">
	<table class="table custab">
	<tr>
	<th align="center">받는사람</th>
	<td><input type="text" name="recv_id" class="form-con" style="width:482px;"><br><span id="idView"></span></td>
	</tr>
	<tr><th align="center">제목</th>
	<td><input type="text" name="title" class="form-con" style="width:482px;"></td></tr>
	<tr><th align="center">내용</th>
	<td>
	<textarea cols="43" rows="10" name="content" class="form-con" style="width:482px; height:200px;"></textarea></td>
	</tr>
	<!-- <tr>
	<td colspan="2" align="center">
	<input type="button" value="취소" onclick='javascript:self.close()'>
	</td>
	</tr> -->
	</table>
	<input type="submit" value="보내기" class="btn btn-warning">&nbsp;&nbsp;
	</form>
</div>
<!-- Footer -->
<!-- <div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div> -->
