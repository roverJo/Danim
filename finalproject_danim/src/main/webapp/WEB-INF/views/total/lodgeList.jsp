<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- ${requestScope.lodgeList} --%>
    ${initParam.root}resources/img/lodge/${lodgeList[0].lodgePictureVO.picture_name}
<table class="table"  style="border: 1px solid;">
	<tr>
<c:forEach var="list" items="${requestScope.lodgeList}" varStatus="i">
<c:if test="${i.index != 0 && i.index % 4  == 0}">
	</tr>
	<tr>
</c:if>
		<td>
		<div class="">
		    <div class="thumbnail">
		      <img src="${initParam.root}resources/img/lodge/${list.lodgePictureVO.picture_name}" alt="..." class="thumimg">
		  <h4>${list.lodgetype }:  <br> ${list.shopname }</h4> <br>
		  <p align="center"><a href="${initParam.root}showlodge.do?no=${list.lodge_no}" class="btn btn-success" role="button">상세보기</a>
		        </p>
		      </div>
		    </div>    
		  </td>
	</c:forEach>
	</tr>
</table>
