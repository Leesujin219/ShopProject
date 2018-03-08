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
<c:if test="${result eq '0' }">
	<script>
		alert("정보 수정 실패!")
		history.go(-1); 
	</script>
</c:if>
<c:if test="${result ne '0' }">
	<script>
		alert("정보를 수정했습니다.")
		var type='${type}';
		var login='${login}';
		if(type=='user'){
			if(login=='no'){
				location.replace("/ShopProject/login/noLoginDetail?ordernum=${ordernum}&orderCheck=true");
			}else{
				location.replace("/ShopProject/login/orderDetail?ordernum=${ordernum}");
	
			}
		}else{
			location.replace("/ShopProject/adm/orderDetail?ordernum=${ordernum}");

		}
	</script>
</c:if>
</body>
</html>