<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
/* var con_pic = confirm("사진 등록 성공! 사진을 계속 등록하시겠습니까?");
if(con_pic == true){ 
	location.href="${initParam.root}adminpage_lodge_picture_register.do?lodge_no=${lodge_no}";
}
else if(con_pic == false){
	location.href="${initParam.root}home.do";
} */
alert("사진등록 성공!");
location.href="${initParam.root}home.do";

</script>