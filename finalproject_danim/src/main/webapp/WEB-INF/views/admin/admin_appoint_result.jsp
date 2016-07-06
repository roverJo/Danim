<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
<c:choose>
<c:when test="${vo==null}">		
			alert("이미 운영진입니다");
			location.href = "${initParam.root}admin_appoint.do";	
</c:when>	
<c:otherwise>
			alert("성공적으로 적용되었습니다");
			location.href = "${initParam.root}admin_appoint.do";	
			
</c:otherwise>	
</c:choose>
</script>
