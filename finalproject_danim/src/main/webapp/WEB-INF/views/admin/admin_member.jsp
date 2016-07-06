<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
/* function winOpen(kind){	
	window.open("${initParam.root}board/"+kind+"_popup.jsp?no=${requestScope.bvo.no }","popup",
			"resizable=true,toolbar=no,width=300,height=200,left=150,top=150");
} */
$(document).ready(function(){
	$("#memberTable input[name=fireBtn]").click(function(){
		window.open("${initParam.root}admin_popup.do?id="+$(this).attr("title"),
				"popup","resizable=true,toolbar=no,width=300,height=200,left=150,top=150");
		/* alert($(this).attr("title")); */
	});
});
</script>
<div class="container_12">
<div class="addHeight"></div>
		<c:if test="${sessionScope.mvo.admin>=1}">
		<h3 align="center">회원명단</h3>
		<table border="1" id="memberTable" class="table custab">
			<thead>
			<tr class="box-black">
				<th>아이디</th>
				<th>닉네임</th>
				<th>주소</th>
				<th>이메일</th>
				<th>회원권한</th>
				<th>탈퇴</th>
			</tr>
			</thead>
			<c:forEach items="${lvo.list}" var="list">
				<tr>
				<td>${list.id}</td><td>${list.nickname}</td><td>${list.address}</td><td>${list.email_add}</td>
				<c:if test="${list.admin==0}">
				<td>회원</td>
				</c:if>
				<c:if test="${list.admin==1}">
				<td>운영진</td>
				</c:if>	
				<td align="center">
				<c:if test="${sessionScope.mvo.admin>list.admin}">
				<input type="button" value="탈퇴" name="fireBtn" title="${list.id}" class="btn btn-danger">
				</c:if>
				</td>
				</tr>	
			</c:forEach>
		</table>
		
		<div class="addHeight"></div>
<div align="center">
	<ul class="pagination">
		<p class="paging">
			<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
			<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
			<!-- 
					step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
						   		페이징빈의 previousPageGroup 이용 
						   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
						   	    hint)   startPageOfPageGroup-1 하면 됨 		 
			 -->      
			<c:if test="${pb.previousPageGroup}">
			<li>
			<a href="admin_member.do?pageNo=${pb.startPageOfPageGroup-1}">
			<!-- <img src="img/left_arrow_btn.gif"> -->
			◀&nbsp; </a>	
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
			<a href="admin_member.do?pageNo=${i}">${i}</a> 
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
			<li>
			<a href="admin_member.do?pageNo=${pb.endPageOfPageGroup+1}">
			▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
			</li>
			</c:if>
		</p>
	</ul>
	</div>
		</c:if>
		<c:if test="${sessionScope.mvo.admin==0}">
		<script type="text/javascript"> 
		alert("관리자만 입장가능한 페이지입니다!");
		location.href="${initParam.root}home.do";
		</script>
		</c:if>
	<div class="clear"></div>
</div>