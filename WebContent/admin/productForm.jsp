<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
	function onOff(v,id){
 // 라디오 버튼 value 값 조건 비교
 	if(v == "t"){
 		 document.getElementById(id).style.display = ""; // 보여줌
 	}else{
 		 document.getElementById(id).style.display = "none"; // 숨김
 		}
	}

</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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


	<form method="post" name="inputform" action="productInput" enctype="multipart/form-data" >
	<input type="hidden" name="writerid" value="${writerid}">
	<input type="hidden" name="ip" value="${ip}">
	<table style="margin-left: 10%">
		<tr><td><h5><b>상품등록</b></h5></td></tr>
		<tr>
			<td class="tableline">상품명</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="productname"></td>
		</tr>
		<tr>
			<td class="tableline">카테고리</td>	
			<td class="tableline">
				<select name="boardid">
					<option value="0">선택하세요
					<option value="1">인테리어소품
					<option value="2">가구
					<option value="3">주방용품
					<option value="4">침구류
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableline">판매가격</td>
			<td class="tableline"><input type="text" size="30" maxlength="30" name="price"></td>
		</tr>
		<tr>
			<td class="tableline">배송비</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="shippingfee"></td>
		</tr>
		<tr>
			<td class="tableline">판매 여부</td>
			<td class="tableline">
			<input type="radio" name="exposure" value="t" >판매중&nbsp;
			<input type="radio" name="exposure" value="f" checked="checked">판매중지</td>
		</tr>
		<tr>
			<td class="tableline">Home 노출</td>
			<td class="tableline">
			<input type="radio" name="home" value="t" checked="checked">노출&nbsp;
			<input type="radio" name="home" value="f">노출하지 않음</td>
		</tr>
		<tr>
			<td class="tableline">New 노출</td>
			<td class="tableline">
			<input type="radio" name="newpage" value="t" checked="checked">노출&nbsp;
			<input type="radio" name="newpage" value="f">노출하지 않음</td>
		</tr>
		<tr>
			<td class="tableline">Sale 노출</td>
			<td class="tableline">
			<input type="radio" name="sale" value="t" onclick="onOff(this.value,'con')">노출&nbsp;
			<input type="radio" name="sale" value="f" checked="checked" onclick="onOff(this.value,'con')">노출하지 않음</td>
		</tr>
		<tr id="con" style="display: none">
			<td class="tableline" >할인율</td>
			<td class="tableline" ><input type="text" size="30" maxlength="10" name="salepercent"></td>
			<td class="tableline" >할인된금액</td>
			<td class="tableline" ><input type="text" size="30" maxlength="10" name="saleprice"></td>
		</tr>
		<tr>
			<td class="tableline">썸네일 등록</td>
			<td class="tableline">
				 <input type="file" size="40" maxlength="30" name="thumbnail" >
			</td>
		</tr>
			<tr>
			<td class="tableline">상품사진 등록</td>
			<td class="tableline">
				 <input type="file" size="40" maxlength="30" name="filename1" ><br>
				 <input type="file" size="40" maxlength="30" name="filename2" ><br>
				 <input type="file" size="40" maxlength="30" name="filename3" ><br>
				 <input type="file" size="40" maxlength="30" name="filename4" >

			</td>
		</tr>
		<tr>
			<td class="tableline">상품내용</td>
			<td class="tableline">
				<textarea name="content" rows="14" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="글쓰기" >  
	 			<input type="reset" value="다시작성">
	 			<input type="button" value="목록보기" OnClick="window.location='productList'">
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>