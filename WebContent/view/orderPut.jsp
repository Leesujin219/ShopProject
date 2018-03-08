<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
	if(${orderNum}==0){
		alert('주문실패');
		history.go(-1); 
	}else{
		alert('주문완료!');
	}
</script>
	<div class="w3-center w3-container">
		<h4>주문번호는 <b>${orderNum}</b> 입니다.</h4>
	</div>
</body>
</html>