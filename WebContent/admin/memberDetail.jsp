<%@page import="login.LoginDataBean" %>
<%@page import="login.LoginDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	window.onload=function(){
		var gender ='${member.gender}';	
		//	alert(gender);
		
		if(gender=='f'){
			document.getElementById('f').checked=true;
	
		}else{
			document.getElementById('m').checked=true;
		}
	}
</script>
<style type="text/css">
	.tableline{
		border: 1px gray dotted;
		padding: 5px;
		padding-left: 10px;
		padding-right:10px;
	}
</style>
</head>
<body>

<form method="post" name="updateform" action="/ShopProject/login/updatePro" >
<table style="margin-left: 10%">
	<tr><td><h5><b>고객 정보</b></h5></td></tr>
	<tr>
		<td class="tableline">고객번호</td><td class="tableline">${member.num}</td>
		<td  class="tableline">회원등급</td><td  class="tableline">${member.memberlev}
			<input type="button" value="등급관리" onclick="document.location.href=''">
		</td>
	</tr>
	<tr>
		<td  class="tableline">ID</td><td  class="tableline"><input class="w3-border" type="text" size="30" maxlength="12" name="id" value="${member.id }"
			readOnly style="background-color:lightgray"></td>
		<td  class="tableline">비밀번호</td><td  class="tableline"><input type="password" size="30" maxlength="12" name="password" value="${member.password }"
			readOnly style="background-color:lightgray" ><input type="button" value="초기화" onclick="document.location.href=''"></td>
	</tr>

	<tr>
		<td  class="tableline">이름</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="name" value="${member.name}" ></td>
		<td  class="tableline">이메일</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="email" value="${member.email}"></td>
	</tr>
	<tr>
		<td  class="tableline">전화번호</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="phone" value="${member.phone}"></td>
		<td  class="tableline">성별</td><td  class="tableline">
		<input id="f" type="radio" name="gender" value="f">여성&nbsp;
		<input id="m" type="radio" name="gender" value="m">남성	
	</td>
	</tr>
	<tr>
		<td  class="tableline">생일</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="birthday" value="${member.birthday}"></td>
		<td  class="tableline">나이</td><td  class="tableline"><input type="text" size="30" maxlength="12" name="age" value="${member.age}"></td>
	</tr>
	<tr>
		<td  class="tableline">우편번호</td><td  class="tableline" colspan="3"><input type="text" size="30" maxlength="12" name="addrnum" value="${member.addrnum}">
</td>
	</tr>
	<tr>
		<td  class="tableline">주소</td><td class="tableline">	<input type="text" size="50" maxlength="12" name="address1" value="${member.address1}">
</td>
		<td  class="tableline"></td><td class="tableline"><input type="text" size="50" maxlength="12" name="address2" value="${member.address2}">
</td>
	</tr>
	<tr>
		<td class="tableline">가입일자</td><td class="tableline" colspan="3">${member.reg_date}</td>
	</tr>
	<tr>
		<td class="tableline">주문횟수</td><td class="tableline">${member.buynum}</td>		
		<td class="tableline">구매상품수</td><td class="tableline">${member.productnum}</td>
	</tr>
	<tr>
		<td class="tableline">구입 금액</td><td  class="tableline" colspan="3"></td>
	</tr>

	<tr><td style="padding-top: 10px"><h5><b>주문 리스트</b></h5></td></tr>

<tr><td colspan="4" class="w3-center"><input type="submit" value="정보수정">
				&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="회원삭제"
				onclick="document.location.href='/ShopProject/login/deletePro?type=admin&id=${member.id }&adminPw=${adminpwd}&pageNum=${pageNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="회원목록"
				onclick="document.location.href='/ShopProject/memberList?pageNum=${pageNum}'">	</td></tr>

</table>
</form>		

</body>
</html>