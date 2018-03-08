<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	window.onload=function(){
		var orderCheck='${type}';
		if(orderCheck=='noOrder'){
			alert("잘못된 주문번호 입니다.")
			history.go(-1); 
		}else{
			var chk='${chk}';
			if(chk==0){
				alert("주문내역이 없습니다.")
				history.go(-1); 
			}else{
				location.replace("/ShopProject/login/noLoginDetail?ordernum=${ordernum}&orderCheck=true");
			}
		}
	}
</script>
</head>
<body>
ddd
</body>
</html>