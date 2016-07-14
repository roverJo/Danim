<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <div id="home"> -->
  <!--==============================
              Stuck menu
  =================================-->
<section id="stuck_container">
    <div class="container_12">
        <div class="grid_12">          
          <div class="navigation">
            <nav>
              <ul class="sf-menu">
               <li id="home"><a href="${initParam.root }home.do#home">Home</a></li>
               <li id="notice"><a href="${initParam.root }notice_list.do?pageNo=1#notice">Notice</a></li>
               <li id="community1"><a href="${initParam.root }community_list.do?rownum=5">Community</a></li>
             <c:if test="${sessionScope.mvo!=null }">
               <li id="zzim"><a href="${initParam.root}login_zimList.do#zzim">ZZim</a></li>
               <li id="cart"><a href="${initParam.root}login_cartList.do#cart">Cart</a></li>
             </c:if>
               <li><a href="#" class="dropdown-toggle">Search
               <i class="fa fa-caret-down" aria-hidden="true" title="Toggle dropdown menu"></i>
               </a>
             	 	<ul>
					    <li><a href="${initParam.root}traffic_search.do">교통검색</a></li>
					    <li><a href="${initParam.root}lodge_lodge.do">숙박검색</a></li>
					    <li><a href="${initParam.root }bestfood_search.do">음식검색</a></li>
					    <li><a href="${initParam.root }toplist.do">검색순위</a></li>
             		</ul>
               </li>
               <li>
	            <form action="totalSearch.do" id="searchForm">
	              	<input type="text" name="totalSearch" class="form-con" style="width: 70%;" placeholder="검색어를 입력하세요"> 
					<button class="btn fa fa-search" style="width: 50px; height: 34px; background-color: #ec9e9e; color: white;"></button>
	            </form>
               </li>
             </ul>
            </nav>	
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
     </div> 
     <div class="clear"></div>
    </div> 
</section>
<div class="addHeight"></div>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sessionScope.mvo==null}">
		<a href="${initParam.root }notice_list.do?pageNo=1">공지사항</a><br>
		<a href="${initParam.root }community_list.do?rownum=5">게시판</a><br>
		<a href="${initParam.root}traffic_search.do">교통검색</a><br>
		<a href="${initParam.root}lodge_lodge.do">숙박검색</a><br>
		<a href="${initParam.root }bestfood_search.do">음식검색</a><br>
	</c:when>
	<c:otherwise>
		<a href="${initParam.root }notice_list.do?pageNo=1">공지사항</a><br>
		<a href="${initParam.root }community_list.do?rownum=5">게시판</a><br>
		<a href="${initParam.root}traffic_search.do">교통검색</a><br>
		<a href="${initParam.root}lodge_lodge.do">숙박검색</a><br>
		<a href="${initParam.root }bestfood_search.do">음식검색</a><br>
		<a href="${initParam.root}zim_list.do">찜목록</a><br>
		<a href="${initParam.root}login_cartList.do">장바구니</a><br>
	</c:otherwise>
</c:choose>
 --%>