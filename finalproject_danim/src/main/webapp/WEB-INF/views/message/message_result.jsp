<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("쪽지 전송 완료!");
	//opener.document.location.href = "${initParam.root}message_index.do";	
	//self.close();
	location.href = "${initParam.root}login_message_index.do";
</script>
