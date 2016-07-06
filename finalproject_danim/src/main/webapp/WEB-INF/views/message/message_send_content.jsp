<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="${initParam.root}resources/js/backfix.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#listMessage").click(function(){
			location.href="${initParam.root}login_message_sendIndex.do";
		});
		$("#delContent").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="${initParam.root}login_message_contentSendDel.do?no=${mvo.message_no}";
			}
		});
	});
	
	 bajb_backdetect.OnBack = function(){
		window.history.back=function(){
			document.location="${initParam.root}login_message_sendIndex.do";
		}
	} 
</script>
<!-- header -->
<div class="modal-header" align="center">
    <!-- 닫기(x) 버튼
  <button type="button" class="close" data-dismiss="modal">×</button>
  header title -->
  <h3 class="modal-title">보낸쪽지 상세보기</h3>
</div>
<!-- body -->
<div class="modal-body" align="center">
	<table class="table custab" style="width:350px;">
	<tr>
	<th>받는사람</th><td>${mvo.recvVO.nickname}</td>
	</tr>
	<tr>
	<th>보낸날짜</th><td>${mvo.mess_date}</td>
	</tr>
	<tr>
	<th>제목</th><td>${mvo.title}</td>
	</tr>
	<tr>
	<td colspan="2" height="100"><pre>${mvo.content}</pre></td>
	</tr>
	</table>
	<input type="button" value="목록보기" id="listMessage" class="btn btn-primary">
	<input type="button" value="삭제" id="delContent" class="btn btn-danger">
</div>