<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.root}resources/js/backfix.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectAll").click(function(){
			$("input[name=select]").prop("checked",this.checked);
		});
		$("#checkVal").click(function(){
		var rtn=[];
		$("input[name=select]:checkbox").each(function(){
			if($(this).is(":checked")){
				rtn.push($(this).val());
				}
			});
		if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type:"post",
			url:"login_message_selectDelete.do?no="+rtn,
			dataType:"text",
			success:function(jsonData){
				 if(jsonData=="Y"){
					alert("삭제되었습니다");
				}else if(jsonData=="N"){
					alert("체크된 값이 없습니다")
				} 
			}
			});
		}
		location.href="${initParam.root}login_message_index.do";
		});
		$("#checkRead").click(function(){
			var rtn=[];
			$("input[name=select]:checkbox").each(function(){
				if($(this).is(":checked")){
					rtn.push($(this).val());
					}
				});
			$.ajax({
				type:"post",
				url:"login_message_selectRead.do?no="+rtn,
				dataType:"text",
				success:function(jsonData){
					 if(jsonData=="Y"){
						alert("읽음표시 완료");
					}else if(jsonData=="N"){
						alert("체크된 값이 없습니다")
					} 
				}
				});
			location.href="${initParam.root}login_message_index.do";
			});
		/* $("#sendMessage").click(function(){
			$("div.myModal").modal({
				remote : "${initParam.root}message_send.do"
			});
			/*	
			window.open("${initParam.root}message_send.do",
						"popup","resizable=true,toolbar=no,width=500,height=400,left=300,top=150");
		}); */
		$('[data-load-remote]').on('click',function(e) {
		    e.preventDefault();
		    var $this = $(this);
		    var remote = $this.data('load-remote');
		    if(remote) {
		        $($this.data('remote-target')).load(remote);
		    }
		});
	});
</script>

<div class="addHeight"></div>
<div class="container" align="center">
	<h3 style="display:inline;"><a href="${initParam.root}login_message_index.do">받은 쪽지함</a></h3>
	| <a href="${initParam.root}login_message_sendIndex.do">보낸 쪽지함</a>
	<br><br><br>
	<table class="table custab" style="width:600px;">
		<thead align="center">
			<tr>
			<th><input type="checkbox" name="all" id="selectAll"> 전체선택</th>
			<th>보낸사람</th><th>제목</th><th>날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${lvo.messageList!=null}">
		<c:forEach items="${lvo.messageList}" var="list">
		<tr>
		<td><input type="checkbox" name="select" value="${list.message_no}"></td>
		<c:if test="${list.read_acc==0}">
<%-- <td><b><a href="#" onclick="window.open('${initParam.root}message_replyReady.do?sendId=${list.sendVO.id}', 'popup','resizable=true,toolbar=no,width=500,height=400,left=300,top=150');return false;" target="_blank">${list.sendVO.nickname}</a></b></td> --%>
		<td><a style="color: #2196F3;" data-toggle="modal" href="${initParam.root}login_message_replyReady.do?sendId=${list.sendVO.id}" data-target="#myModal"><b>${list.sendVO.nickname}</b></a></td>
		<td><a style="color: #2196F3;" href="${initParam.root}login_message_content.do?message_no=${list.message_no}"><b>${list.title}</b></a></td>
		<td><b style="font-family: sans-serif !important; color: #2196F3;">${list.mess_date}</b></td>
		</c:if>
		
		<c:if test="${list.read_acc>0}">
<%-- <td><a href="#" onclick="window.open('${initParam.root}message_replyReady.do?sendId=${list.sendVO.id}', 'popup','resizable=true,toolbar=no,width=500,height=400,left=300,top=150');return false;" target="_blank">${list.sendVO.nickname}</a></td> --%>
		<td><a data-toggle="modal" href="${initParam.root}login_message_replyReady.do?sendId=${list.sendVO.id}" data-target="#myModal">${list.sendVO.nickname}</a></td>
		<td><a href="${initParam.root}login_message_content.do?message_no=${list.message_no}">${list.title}</a></td>
<%-- <td><a data-toggle="modal" href="${initParam.root}message_content.do?message_no=${list.message_no}" data-target="#myModal">${list.title}</a></td> --%>
<%-- <td><a href="#myModal" data-toggle="modal" data-load-remote="${initParam.root}message_content.do?message_no=${list.message_no}" data-remote-target="#myModal .modal-content"><b>${list.title}</b></a></td> --%>
		<td>${list.mess_date}</td>
		</c:if>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		 	<td colspan="4" align="center">받은 쪽지가 없습니다</td>
		</tr>
		</c:otherwise>
		</c:choose>
		</tbody>
	</table>
<div align="center">
	<ul class="pagination">
		<p class="paging" >
				<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
				<!-- 
						step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
							   		페이징빈의 previousPageGroup 이용 
							   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
							   	    hint)   startPageOfPageGroup-1 하면 됨 		 
				 -->      
				<c:if test="${pb.previousPageGroup}">
				&nbsp;
				<li>
				<a href="login_message_index.do?pageNo=${pb.startPageOfPageGroup-1}">◀</a>&nbsp;
				</li>
				</c:if>
				<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
							   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
							      현 페이지이면 링크를 처리하지 않는다.  
							      PagingBean의 nowPage
							      jstl choose 를 이용  
							      예) <a href="list.do?pageNo=...">				   
				 -->		
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
				end="${pb.endPageOfPageGroup}">
					<c:choose>
					<c:when test="${pb.nowPage!=i}">
					<li>
					<a href="login_message_index.do?pageNo=${i}">${i}</a>
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
				<!-- 
						step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
							   		페이징빈의 nextPageGroup 이용 
							   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
							   	    hint)   endPageOfPageGroup+1 하면 됨 		 
				 -->   
				<c:if test="${pb.nextPageGroup}">
				&nbsp;
				<li>
				<a href="login_message_index.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>&nbsp;
				</li>
				</c:if>
			</p>
		  </ul>
	</div>
	<input type="button" value="읽음 표시" id="checkRead" class="btn btn-primary">
	<!-- <input type="button" value="쪽지보내기" id="sendMessage" class="btn btn-warning"> -->
	<a href="#myModal" role="button" class="btn btn-warning" data-toggle="modal" data-load-remote="${initParam.root}login_message_send.do" data-remote-target="#myModal .modal-content">쪽지보내기</a>
	<input type="button" value="삭제" id="checkVal" class="btn btn-danger">
	<div class="clear"></div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<c:if test="${sessionScope.mvo==null }">
	<script type="text/javascript">
		alert("로그인이 필요한 페이지입니다!");
		location.href="${initParam.root}home.do";
	</script>
</c:if>