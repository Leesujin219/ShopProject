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
	var check='${x}';
	if(check==1){
		alert("��ǰ�� �����߽��ϴ�.")
		location.replace("/ShopProject/login/wishList");
	}else{
		alert("���� ����")
		history.go(-1); 
	}

</script>
</body>
</html>