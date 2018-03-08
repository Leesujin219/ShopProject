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
	var already="${already}";
	var edit="${edit}";

	if(already=='true'){
		alert('이미 장바구니에 상품이 있습니다.');
		history.go(-1); 
	}else{
		if(edit=='true'){
			alert('장바구니 정보를 수정했습니다.');
			location.href="/ShopProject/product/cart";
		}else{
			alert('상품을 장바구니에 담았습니다.');
			history.go(-1); 
		}
	}
	

</script>
</body>
</html>