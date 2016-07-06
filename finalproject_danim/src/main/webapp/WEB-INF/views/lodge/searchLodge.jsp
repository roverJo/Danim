<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="addHeight"></div>
<c:if test="${empty list.lodgeList}">
	<script>
		alert("정보가 없습니다");
		location.href = "${initParam.root}home.do";
	</script>
</c:if>
<table class="table">
<tr>
<c:forEach var="list" items="${requestScope.list.lodgeList}" varStatus="i">
  <c:if test="${i.index != 0 && i.index % 4  == 0}">
	</tr>
	<tr>
	</c:if>
<td>
<div class="searchForm">
    <div class="thumbnail">
      <img src="${initParam.root}resources/img/lodge/${list.lodgePictureVO.picture_name}" alt="..." class="thumimg">
        <h4>${list.lodgetype }:  <br> ${list.shopname }</h4> <br>
        <p align="center"><a href="${initParam.root}showlodge.do?no=${list.lodge_no}" class="btn btn-primary" role="button">상세보기</a>
        &nbsp;&nbsp;&nbsp;
	        <c:choose>
				<c:when test="${sessionScope.mvo!=null}">
	      			<a href="login_checkZimByLodge.do?lodge_no=${list.lodge_no}" class="btn btn-danger" role="button">찜하기</a>
	        	</c:when>
			</c:choose>
        </p>
      </div>
    </div>    
  </td>
</c:forEach>
</tr> 
</table>

<div align="center">
	<ul class="pagination">
		<p class="paging">
			<c:set var="pb" value="${list.pagingBean}"></c:set>
			<c:if test="${pb.previousPageGroup}">
				&nbsp;
				<li>
					<a href="${initParam.root }searchLodgeByNameAndKind.do?pageNo=${pb.startPageOfPageGroup-1}&detailarea_name=${list.lodgeList[0].detailarea_name}&lodgetype=${list.lodgeList[0].lodgetype}">◀</a>&nbsp;
				</li>
			</c:if>		
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li>
						<a href="${initParam.root }searchLodgeByNameAndKind.do?pageNo=${i}&detailarea_name=${list.lodgeList[0].detailarea_name}&lodgetype=${list.lodgeList[0].lodgetype}">${i}</a> 
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
					<a href="${initParam.root }searchLodgeByNameAndKind.do?pageNo=${pb.endPageOfPageGroup+1}&detailarea_name=${list.lodgeList[0].detailarea_name}&lodgetype=${list.lodgeList[0].lodgetype}">▶</a>&nbsp;
				</li>
			</c:if>	 
		</p>
	</ul>
</div>
