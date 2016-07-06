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
			url:"login_message_selectSendDelete.do?no="+rtn,
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
		location.href="${initParam.root}login_message_sendIndex.do";
		});
		$("#sendMessage").click(function(){
			$("div.modal").modal({
				remote : "${initParam.root}login_message_send.do"
			});
			/*	
			window.open("${initParam.root}message_send.do",
						"popup","resizable=true,toolbar=no,width=500,height=400,left=300,top=150");
			 */
		});
	});
</script>

<div class="addHeight"></div>
<div class="container" align="center">
	<a href="${initParam.root}login_message_index.do" style="display:inline;">받은 쪽지함</a> 
	| <h3 style="display:inline;"><a href="${initParam.root}login_message_sendIndex.do">보낸 쪽지함</a></h3>
	<br><br><br>
	<table class="table custab" style="width:600px;">
		<thead align="center">
			<tr>
			<th><input type="checkbox" name="all" id="selectAll"> 전체선택</th>
			<th>받은사람</th><th>제목</th><th>날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${lvo.messageList!=null}">
		<c:forEach items="${lvo.messageList}" var="list">
		<tr>
		<td><input type="checkbox" name="select" value="${list.message_no}"></td>
		
		<td>${list.recvVO.nickname}</td>
		<td><a href="${initParam.root}login_message_sendContent.do?message_no=${list.message_no}">${list.title}</a></td>
		<td>${list.mess_date}</td>
		
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		 	<td colspan="4" align="center">보낸 쪽지가 없습니다</td>
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
				<a href="login_message_sendIndex.do?pageNo=${pb.startPageOfPageGroup-1}">◀</a>&nbsp;
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
					<a href="login_message_sendIndex.do?pageNo=${i}">${i}</a>
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
				<a href="login_message_sendIndex.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>&nbsp;
				</li>
				</c:if>
				</p>
		  </ul>
	</div>
	<input type="button" value="쪽지보내기" id="sendMessage" class="btn btn-warning">
	<input type="button" value="삭제" id="checkVal" class="btn btn-danger">
	<div class="clear"></div>
</div>

<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
 </div>