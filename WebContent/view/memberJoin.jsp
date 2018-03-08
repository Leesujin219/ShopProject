<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
 	function checkValue(){
		var form=document.joinform;		
		if(!form.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}

		if(!form.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(!form.name.value){
			alert("이름을 입력하세요.");
			return false;
		}
		if(isNaN(form.birthday.value)){
			alert("숫자 ex)19900101 형태로 입력하세요");
			return false;
		}
		if(isNaN(form.phone.value)){
			alert("-를 제외한 숫자만 입력하세요");
			return false;
		}
		if(!form.email.value){
			alert("메일 주소를 입력하세요.");
			return false;
		}
		if(!form.addrnum.value){
			alert("우편번호를 입력하세요");
			return false;
		}
		if(!form.address1.value){
			alert("주소를 입력하세요");
			return false;
		}
		
		
	}

</script>
</head>
<body>
		<h4 class="w3-font w3-wide w3-center">JOIN</h4>
		<hr class="login">
	<form method="post" name="joinform" action="joinPro" onsubmit="return checkValue()">
	<input type="hidden" name="memberlev" value="1">	
	
	
	<table class="jointable w3-table w3-bordered w3-small" style="width:500px">
	 <tr class="jointablesize">
		<td>아이디</td>
		<td width="350px"><input type="text" size="30" maxlength="15" name="id">
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>비밀번호</td>
		<td><input type="password" size="30" maxlength="12" name="password" >
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>비밀번호확인</td>
		<td><input type="password" size="30" maxlength="12" name="password2">
	 	</td>
	 </tr>
	 <tr class="jointablesize">
		<td>이름</td>
		<td><input type="text" size="30" maxlength="12" name="name" >
		</td>	
	 </tr>
	 <tr class="jointablesize">
		<td>이메일</td>
		<td><input type="text" size="30" maxlength="30" name="email" ></td>	
	 </tr>
	 <tr class="jointablesize">
		<td>휴대폰번호</td>
		<td><input type="text" size="30" maxlength="11" name="phone" ></td>	
	 </tr>
	  <tr class="jointablesize">
		<td>성별</td>
		<td><input type="radio" name="gender" value="f">여성&nbsp;
		<input type="radio" name="gender" value="m">남성</td>	
	 </tr>
	  <tr class="jointablesize">
		<td>생년월일</td>
		<td><input type="text" size="30" maxlength="8" name="birthday" ></td>	
	 </tr>
	 <tr class="jointablesize" style="border-bottom:none">
		<td>주소</td>
		<td><input type="text" size="30" maxlength="8" name="addrnum" >
		&nbsp;
		<input class="w3-button w3-orange " type="button" onclick="" value="우편번호찾기" style="width:110px">
		</td>	
	</tr>
	 <tr class="jointablesize" style="border-bottom:none"><td></td>
		 <td><input type="text" size="50" maxlength="50" name="address1" ></td>	
	 </tr>
	 <tr class="jointablesize" ><td></td>
		 <td><input type="text" size="50" maxlength="50" name="address2" ></td>	


	 </tr>
	</table>
	<div class="w3-container w3-center" style="padding: 20px">
		<input class="w3-button w3-gray" type="button" value="취소" style="width:100px"
		onclick="location.href='/ShopProject/member/login'">&nbsp;
		<input class="w3-button w3-black" type="submit" value="회원가입" style="width:100px">
	</div>	
	</form>
	
</body>
</html>