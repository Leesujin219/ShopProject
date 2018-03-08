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
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1); 

	}else{
		if(idCheck==0){
			alert("회원가입이 완료되었습니다.");
			location.replace("/ShopProject/login/enter");

		}else{
			alert("중복된ID입니다!")
			history.go(-1); 
		}
	}


</script>

</body>
</html>