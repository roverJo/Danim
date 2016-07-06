<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<c:choose>
<c:when test="${check==0}">		
			alert("비밀번호가 일치하지 않습니다!");				
</c:when>	
<c:otherwise>
			if(confirm("탈퇴시키겠습니까?")){
			opener.document.location.href = "${initParam.root}admin_delete.do?id=${id}";	
			}
</c:otherwise>	
</c:choose>
	self.close();
</script>
