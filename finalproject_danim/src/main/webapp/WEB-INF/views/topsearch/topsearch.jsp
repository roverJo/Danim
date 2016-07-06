<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="addHeight"></div>
<div class="container_12" align="center">
<form>
<h3>검색 순위</h3>
	<div class="col-md-6 text-left" align="center" id="rankTable">
		<h3>맛집</h3>
		<table border="1" class="table custab">
				<tr class="box-black">
					<th>위치</th>
					<th>이름</th>
					<th>종류</th>
				</tr>
			<c:forEach items="${foodlist }" var="foodlist">
				<tr>
					<td>${foodlist.detailarea_name }</td>
					<td>${foodlist.shopname }</td>
					<td>${foodlist.foodtype }</td>		
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-md-6 text-left" align="center" id="rankTable">
		<h3>숙박</h3>
		<table border="1" class="table custab">
				<tr class="box-black">
					<th>위치</th>
					<th>이름</th>
					<th>종류</th>
				</tr>
				<c:forEach items="${lodgelist }" var="lodgelist">
					<tr>
						<td>${lodgelist.detailarea_name }</td>
						<td>${lodgelist.shopname }</td>
						<td>${lodgelist.lodgetype }</td>
					</tr>
				</c:forEach>
		</table>
	</div>
</form>
</div>