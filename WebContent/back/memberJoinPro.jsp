<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
	var idCheck='${idChk}';
	var pwdCheck='${pwdChk}';
	
	if(pwdCheck=='false'){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.go(-1); 

	}else{
		if(idCheck==0){
			alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
			location.replace("/ShopProject/login/enter");

		}else{
			alert("�ߺ���ID�Դϴ�!")
			history.go(-1); 
		}
	}


</script>

</body>
</html>