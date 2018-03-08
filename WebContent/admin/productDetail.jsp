
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script>
	window.onload=function(){
		var value ='${product.exposure}';	
		if(value=='t'){
			document.getElementById('et').checked=true;
		}else{
			document.getElementById('ef').checked=true;
		}
		
		var value ='${product.home}';	
		if(value=='t'){
			document.getElementById('ht').checked=true;
		}else{
			document.getElementById('hf').checked=true;
		}
		
		var value ='${product.newpage}';	
		if(value=='t'){
			document.getElementById('nt').checked=true;
		}else{
			document.getElementById('nf').checked=true;
		}
		
		var value ='${product.sale}';	
		if(value=='t'){
			document.getElementById('st').checked=true;
		}else{
			document.getElementById('sf').checked=true;
		}
		//boardid 선택
		var value ='${product.boardid}';
		var boardselect=document.getElementById('boardselect');	
		boardselect.selectedIndex = value;
		
	}
</script>
</head>
<body>


	<form method="post" name="updateform" action="productUpdate" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${product.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table style="margin-left: 10%">
		<tr><td><h5><b>상품 정보</b></h5></td></tr>
		<tr>
			<td class="tableline">상품번호</td>
			<td class="tableline">${product.num}</td>
			<td class="tableline">상품명</td>
			<td class="tableline">
				<input type="text" size="30" maxlength="30" name="productname" value="${product.productname}"></td>
		</tr>
		<tr>
			<td class="tableline">카테고리</td>
			<td class="tableline" colspan=3>
				<select id="boardselect" name="boardid">
					<option value="0">선택하세요
					<option value="1">인테리어소품
					<option value="2">가구
					<option value="3">주방용품
					<option value="4">침구류
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableline">썸네일</td>
			<td colspan=3 class="tableline">
			<img src="/ShopProject/filesave/${product.thumbnail}" height="300px" width="300px"> 
		</td>
		</tr>
		<tr>	
			<td class="tableline">판매가격</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="price" value="${product.price}"></td>
			<td class="tableline">배송비</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="shippingfee" value="${product.shippingfee}"></td>
		</tr>
		<tr>
			<td class="tableline">할인율</td>
			<td class="tableline">
				<input type="text" size="30" maxlength="10" name="salepercent" value="${product.salepercent}"></td>
			<td class="tableline">할인금액</td>
			<td class="tableline">
				<input type="text" size="30" maxlength="10" name="saleprice" value="${product.saleprice}"></td>
		</tr>
		<tr>
			<td class="tableline">판매여부</td>
			<td class="tableline">
				<input type="radio" name="exposure" value="t" id="et">판매중&nbsp;
				<input type="radio" name="exposure" value="f" id="ef">판매중지
			</td>
			<td class="tableline">Home 노출</td>
			<td class="tableline">
				<input type="radio" name="home" value="t" id="ht">노출&nbsp;
				<input type="radio" name="home" value="f" id="hf">노출하지 않음
			</td>
		</tr>
		<tr>
			<td class="tableline">New 노출</td>
			<td class="tableline">
				<input type="radio" name="newpage" value="t" id="nt">노출&nbsp;
				<input type="radio" name="newpage" value="f" id="nf">노출하지 않음
			</td>
			<td class="tableline">Sale 노출</td>
			<td class="tableline">
				<input type="radio" name="sale" value="t" onclick="onOff(this.value,'con')" id="st">노출&nbsp;
				<input type="radio" name="sale" value="f" onclick="onOff(this.value,'con')" id="sf">노출하지 않음
			</td>
		</tr>
		<tr>
			<td class="tableline">썸네일 등록</td>
			<td class="tableline" colspan="3">
				 <input type="file" size="40" maxlength="30" name="thumbnail" ">
			</td>
		</tr>
			<tr>
			<td class="tableline">상품사진 등록</td>
			<td class="tableline" colspan="3">
				 <input type="file" size="40" maxlength="30" name="filename1" >
				 	<br>
				 <input type="file" size="40" maxlength="30" name="filename2" >
				 	<br>
				 <input type="file" size="40" maxlength="30" name="filename3" >
				 	<br>
				 <input type="file" size="40" maxlength="30" name="filename4" >

			</td>
		</tr>
		
		<tr>
			<td class="tableline">상품내용</td>
			<td colspan=3 class="tableline">
			<textarea name="content" rows="14" cols="40">${product.content}</textarea></td>
		</tr>
		<tr>
			<td class="tableline">최근 수정인id</td>
			<td class="tableline">${product.writerid}</td>
			<td class="tableline">마지막 수정일</td>
			<td class="tableline">${product.regdate}</td>
		</tr>
		<tr>
	<td colspan=4 align="center">
				<input type="submit" value="글수정" >  
	 			<input type="button" value="목록보기" OnClick="window.location='productList?pageNum=${pageNum}'">
			</td>		
		</tr>
	</table>
	</form>		
		
		
</body>
</html>