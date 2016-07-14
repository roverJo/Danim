<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container sitemap" align="center">
	<div class="col-md-4">
	<h3><a href="${initParam.root }notice_list.do?pageNo=1#notice">공지사항</a></h3>
	<div class="addHeight"></div>
	<div class="addHeight"></div>
	<div class="addHeight"></div>
	<div class="addHeight"></div>
	<div class="addHeight"></div>
	<h3><a href="${initParam.root }community_list.do?rownum=5#community">커뮤니티</a></h3>
	</div>
	<div class="col-md-4">
	<h3>검색</h3>
	<h4><a href="${initParam.root}traffic_search.do">교통검색</a></h4>
	<h4><a href="${initParam.root}lodge_lodge.do">숙박검색</a></h4>
	<h4><a href="${initParam.root }bestfood_search.do">음식검색</a></h4>
	<h4><a href="${initParam.root }toplist.do">검색순위</a></h4>
	</div>
	<div class="col-md-4">
	<h3>내 서비스</h3>
	<h4><a href="${initParam.root}login_message_index.do">쪽지함</a></h4>
	<h4><a href="${initParam.root}login_zimList.do#zzim">찜리스트</a></h4>
	<h4><a href="${initParam.root}login_cartList.do#cart">통합카트</a></h4>
	</div>
</div>