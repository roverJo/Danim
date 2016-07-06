<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "ir1",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI: "${initParam.root}resources/editor/SmartEditor2Skin.html",	
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : false,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : false,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : false,			
							fOnBeforeUnload : function(){
								
							}
						}, 
						fOnAppLoad : function(){
							//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
							//oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
						},
						fCreator: "createSEditor2"
					});
	$("#save").click(function(){
		//var sHTML = document.getElementById("ir1").value;
		var sHTML = oEditors.getById["ir1"].getIR();
		$("#contentCheck").html(sHTML)
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		if($("#contentCheck").text() == "<p><br></p>" ) { 
			alert("내용을 입력하세요!");
			return false;
		}
		$("#updateForm").submit();
	});//save click
	
	$("#reset").click(function() {
		var sHTML = oEditors.getById["ir1"].getIR();
		if(sHTML != "") { 
			oEditors.getById["ir1"].exec("SET_CONTENTS", [""]); 
		}//if(내용이 공백이 아니라면 공백으로 초기화)
	});//reset click
});
</script>
<div class="addHeight"></div>
<div id="layer" class="container" align="center">
    <div id="contact-area">
	<!-- <div id="h3r">글수정</div> -->
		<c:choose>
			<c:when test="${sessionScope.mvo!=null }">
				<form action="comm_update.do" method="post" id="updateForm">
				<input type="hidden" name="comm_no" value="${commVO.comm_no }">
				<textarea hidden="contentCheck" id="contentCheck"></textarea>
				<table width="100%">
						<tr>
							<th>작성자</th>
							<td><input type="text" name="id" value="${sessionScope.mvo.nickname}" class="form-con" style="width:100%;" readonly></td>
						</tr>
						<!-- <tr>
							<th colspan="2">내용</th>
						</tr> -->
						<tr>
							<td colspan="2">
								<textarea rows="10" cols="30" id="ir1" name="content" style="width:766px; height:412px; " class="form-con">
								${commVO.content }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" class="btn btn-success" id="save" value="확인"/>
								<input type="button" class="btn btn-default" id="reset" value="초기화"/>
							</td>
						</tr>
				</table>
				</form>	
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("로그인이 필요한 페이지입니다!");
				location.href="${initParam.root}home.do";
			</script>
			<%-- <c:redirect url="home.do" />
			<c:import url="home.do" /> --%>
		</c:otherwise>
	</c:choose>
	<div class="clear"></div>
	</div>	
  <div class="clear"></div>
</div>