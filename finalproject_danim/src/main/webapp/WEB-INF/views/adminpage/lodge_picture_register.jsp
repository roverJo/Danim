<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("euc-kr"); %>
<%
 String lodge_no=request.getParameter("lodge_no");
%>

<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">

/* $(document).ready(function(){
	$("#lodgePicForm").submit(function(){
		if($("#file[0]").val()==""){
			alert("사진을 넣으세요");
			return false;
		}
		if($("#file[1]").val()==""){
			alert("사진을 넣으세요");
			return false;
		}
		if($("#file[2]").val()==""){
			alert("사진을 넣으세요");
			return false;
		}
		if($("#file[3]").val()==""){
			alert("사진을 넣으세요");
			return false;
		}		
	});
}); */


	function readURL0(input) {
	    if (input.files && input.files[0]) {
	       var reader = new FileReader();
	       reader.onload = function (e) {
	           $('#UploadedImg0').attr('src', e.target.result);
	       }
	       reader.readAsDataURL(input.files[0]); 
	   } 
	}
	function readURL1(input) {
	   if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	          $('#UploadedImg1').attr('src', e.target.result);
	      }
	      reader.readAsDataURL(input.files[0]); 
	  } 
	}
	function readURL2(input) {
	   if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	          $('#UploadedImg2').attr('src', e.target.result);
	      }
	      reader.readAsDataURL(input.files[0]); 
	  } 
	}
function readURL3(input) {
	  if (input.files && input.files[0]) {
	     var reader = new FileReader();
	     reader.onload = function (e) {
	         $('#UploadedImg3').attr('src', e.target.result);
	     }
	     reader.readAsDataURL(input.files[0]); 
	 } 
}


</script>
<div class="addHeight"></div>
<div class="container">
<div class="foodDiv">

	<form id="lodgePicForm" action="lodgepicture_fileupload.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
		<c:choose>
			<c:when test="${lodgePicList.size()==0 }">
				<% for(int i=0;i<4;i++){ %>
				<td>
					<img id="UploadedImg<%=i %>" src="" style="width: 180px; height: 180px;  border-radius: 100px; left: 220px;">
					<br><br><br>
					<input type="file" onchange="readURL<%=i %>(this);"  name="file[<%=i %>]"><br>
					
					<c:choose>
						<c:when test="${lvo==null }">
							<input type="hidden" name="lodge_no" value=<%=lodge_no %>>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="lodge_no" value="${lvo.lodge_no }">
						</c:otherwise>
					</c:choose>
				</td>
				<%} %>
			</c:when>
			<c:when test="${lodgePicList.size()==1 }">
				<% for(int i=0;i<3;i++){ %>
				<td>
					<img id="UploadedImg<%=i %>" src="" style="width: 180px; height: 180px;  border-radius: 100px; left: 220px;">
					<br><br><br>
					<input type="file"  onchange="readURL<%=i %>(this);"  name="file[<%=i %>]"><br>
					
					<c:choose>
						<c:when test="${lvo==null }">
							<input type="hidden" name="lodge_no" value=<%=lodge_no %>>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="lodge_no" value="${lvo.lodge_no }">
						</c:otherwise>
					</c:choose>
				</td>
				<%} %>
			</c:when>
			<c:when test="${lodgePicList.size()==2 }">
				<% for(int i=0;i<2;i++){ %>
				<td>
					<img id="UploadedImg<%=i %>" src="" style="width: 180px; height: 180px;  border-radius: 100px; left: 220px;">
					<br><br><br>
					<input type="file"  onchange="readURL<%=i %>(this);"  name="file[<%=i %>]"><br>
					
					<c:choose>
						<c:when test="${lvo==null }">
							<input type="hidden" name="lodge_no" value=<%=lodge_no %>>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="lodge_no" value="${lvo.lodge_no }">
						</c:otherwise>
					</c:choose>
				</td>
				<%} %>
			</c:when>
			<c:when test="${lodgePicList.size()==3 }">
				<td>
					<img id="UploadedImg0" src="" style="width: 180px; height: 180px;  border-radius: 100px; left: 220px;">
					<br><br><br>
					<input type="file"  onchange="readURL0(this);"  name="file[0]"><br>
					
					<c:choose>
						<c:when test="${lvo==null }">
							<input type="hidden" name="lodge_no" value=<%=lodge_no %>>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="lodge_no" value="${lvo.lodge_no }">
						</c:otherwise>
					</c:choose>
				</td>
			</c:when>
		</c:choose>
		
			</tr>
		</table>
		<input type="submit" value="등록" class="btn btn-warning btn-lg">
		<input type="hidden" name="lodgetype" value="${lvo.lodgetype}" >
	</form>
	
</div>
</div>