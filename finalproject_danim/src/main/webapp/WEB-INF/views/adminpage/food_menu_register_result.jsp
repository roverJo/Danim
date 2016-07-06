<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
/* var con_pic = confirm("메뉴 등록 성공! 메뉴를 계속 등록하시겠습니까?");
if(con_pic == true){ 
	location.href="${initParam.root}adminpage_food_menu_register.do?foodshop_no=${foodshop_no}";
}
else if(con_pic == false){
	location.href="${initParam.root}home.do";
} */

alert("메뉴등록 성공!");
location.href="${initParam.root}home.do";
</script>