<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container_12" align="center">
<div class="addHeight"></div>
	<div id="notice-list">
		<h3>공지사항</h3>
		<table class="table custab">
			<thead>
			<tr class="box-black">
				<th class="box-notice">글번호</th>
				<th>제목</th>
				<th class="box-notice">작성자</th>
				<th class="box-time">작성일</th>
			</tr>
			</thead>
			<c:forEach var="nvo" items="${requestScope.lvo.list}">
			<tr align="center">
				<td>${nvo.noticeno}</td>
				<td align="left"><a href="${initParam.root}notice_content.do?no=${nvo.noticeno}">${nvo.title}</a></td>
				<td>${nvo.memberVO.nickname}</td>
				<td>${nvo.timePosted}</td>
			</tr>
			</c:forEach>
		</table>
		<c:if test="${sessionScope.mvo.admin==1||sessionScope.mvo.admin==99}">
		<div align="right">
		<a href="${initParam.root}notice_write.do" class="btn btn-warning btn-lg">글쓰기</a>
		</div>
		</c:if>
	</div>	
	<div class="addHeight"></div>	
		
	<div align="center">
		<ul class="pagination">
			<p class="paging">
				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
				<c:if test="${pb.previousPageGroup}">
				&nbsp;
				<li>
				<a href="notice_list.do?pageNo=${pb.startPageOfPageGroup-1}" class="owl-prev">◀</a>&nbsp;
				</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
					<c:when test="${pb.nowPage!=i}">
					<li>
					<a href="notice_list.do?pageNo=${i}">${i}</a> 
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
					<a href="notice_list.do?pageNo=${pb.endPageOfPageGroup+1}" class="owl-next">▶</a>&nbsp;
					</li>
				</c:if>
			</p>
		  </ul>
	</div>
	<div class="clear"></div>
</div>