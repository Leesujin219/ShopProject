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
	<c:import url="/menuJsp/memberVertMenu.jsp"></c:import>

<div class="mpedit">
	<form method="post" name="delform" action="deletePro">
		<input type="hidden" name="type" value="guest">
		<table class="jointable w3-table">
		<tr class="jointablesize">
			<td class="w3-center">
			<h4>정말로 탈퇴하시겠습니까?</h4>
			</td>
		</tr>
		<tr class="jointablesize">
			<td class="w3-center">비밀번호&nbsp;
			<input type="password" size="15" maxlength="12" name="password" >
			</td>	
		</tr>
		<tr class="jointablesize">
		<td class="w3-center">
		<input class="w3-button w3-gray" type="submit" value="회원탈퇴" style="width:172px"></td>
		</tr>
		</table>	
	</form>
</div>
	
		
</body>
</html>