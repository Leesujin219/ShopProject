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
		alert('�̹� ��ٱ��Ͽ� ��ǰ�� �ֽ��ϴ�.');
		history.go(-1); 
	}else{
		if(edit=='true'){
			alert('��ٱ��� ������ �����߽��ϴ�.');
			location.href="/ShopProject/product/cart";
		}else{
			alert('��ǰ�� ��ٱ��Ͽ� ��ҽ��ϴ�.');
			history.go(-1); 
		}
	}
	

</script>
</body>
</html>