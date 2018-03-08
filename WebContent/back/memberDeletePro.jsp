<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${check ==1 }">
	<script language="JavaScript">
		alert("정상적으로 탈퇴 되었습니다.");
	</script>	
	<c:if test="${type eq 'admin' }">
		<c:redirect url="/adm/memberList" />
	</c:if>
	<c:if test="${type ne 'admin' }">
		<c:redirect url="/login/enter" />
	</c:if>
</c:if>
<c:if test="${check !=1 }">
	<script language="JavaScript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>	
</c:if>

</body>
</html>