<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
</head>
<body>
	<c:import url="/menuJsp/memberVertMenu.jsp"></c:import>

		
	<div class="mpedit">
		
	<form method="post" name="writeform" action="updatePro">
	<table class="jointable w3-table w3-bordered w3-small" style="width:500px">
	 <tr class="jointablesize">
	 	<td class="w3-center" colspan="2">
	 		<h4 class="w3-font w3-wide w3-center">MYPAGE</h4>
		<hr class="login">
	 	</td>
	 </tr>
	 <tr class="jointablesize">
		<td>아이디</td>
		<td width="350px">
			<input class="w3-border" type="text" size="30" maxlength="12" name="id" value="${member.id }"
			readOnly style="background-color:lightgray">
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>현재 비밀번호</td>
		<td>
			<input type="password" size="30" maxlength="12" name="password" >
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>새 비밀번호</td>
		<td>
			<input type="password" size="30" maxlength="12" name="password2" >
	 	</td>
	 </tr>
	 <tr class="jointablesize">
		<td>이름</td>
		<td>
			<input type="text" size="30" maxlength="12" name="name" value="${member.name }" >
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>이메일</td>
		<td>
			<input type="text" size="30" maxlength="12" name="email" value="${member.email }">
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>휴대폰번호</td>
		<td>
			<input type="text" size="30" maxlength="12" name="phone" value="${member.phone }">
		</td>	
	 </tr>
	  <tr class="jointablesize">
		<td>성별</td>
		<td>
		<input id="f" type="radio" name="gender" value="f">여성&nbsp;
		<input id="m" type="radio" name="gender" value="m">남성</td>	
	 </tr>
	  <tr class="jointablesize">
		<td>생년월일</td>
		<td><input type="text" size="30" maxlength="12" name="birthday" value="${member.birthday }"></td>	
	 </tr>
	 <tr class="jointablesize" style="border-bottom:none">
		<td>주소</td>
		<td>
			<input type="text" size="30" maxlength="12" name="addrnum" value="${member.addrnum }">
			&nbsp;
			<input class="w3-button w3-orange " type="button" onclick="" value="우편번호찾기" style="width:110px">
		</td>	
	</tr>
	 <tr class="jointablesize" style="border-bottom:none"><td></td>
		 <td>
		 	<input type="text" size="50" maxlength="12" name="address1" value="${member.address1 }">
		 </td>	
	 </tr>
	 <tr class="jointablesize" ><td></td>
		 <td>
		 	<input type="text" size="50" maxlength="12" name="address2" value="${member.address2 }">
		 </td>	
	 </tr>
	</table>
	
	<div class="w3-container w3-center" style="padding-top: 20px;padding-bottom: 100px">
		<input class="w3-button w3-gray" type="button" value="취소" style="width:100px"
		onclick="location.href='/ShopProject/product/list'">&nbsp;
		<input class="w3-button w3-black" type="submit" value="수정" style="width:100px">
	</div>	
	</form>
	</div>
</body>
</html>