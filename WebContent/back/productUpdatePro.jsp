<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${chk eq '1' }">
	<script>
		alert("정보를 수정했습니다.")
		location.replace("/ShopProject/adm/productDetail?num=${num}&pageNum=${pageNum}");
	</script>
</c:if>
<c:if test="${chk ne '1' }">
	<script>
		alert("수정 실패")
		history.go(-1); 
	</script>
</c:if>

</body>
</html>