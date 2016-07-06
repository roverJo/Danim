<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	if(confirm("쪽지함으로 이동하시겠습니까?")){
		location.href = "${initParam.root}login_message_index.do";
	}else{
		location.href = "${initParam.root}community_list.do?rownum=5";
	}
	//opener.document.location.href = "${initParam.root}message_index.do";	
	//self.close();
</script>
