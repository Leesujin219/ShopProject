<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.detailbutton{
		width:150px;
		margin-top: 5px
	}
	ul{
		margin: 0;  padding: 0;padding-top:10px;
		list-style:none;
	}
	.pdetail{
		margin-bottom: 10px;
	}
</style>
<script>
	window.onload=function(){
		var price='${product.price}';
		var count=document.getElementById("count").value;
	 	var total=document.getElementById("totalPrice");

		total.innerHTML=price*count; 
		
	}
	function cal(i){
		var countvalue=document.getElementById("count").value*1;

		if(i=='+' && countvalue<10){
			countvalue+=1;
		}else if(i=='-' && countvalue>1){
			countvalue-=1;
		}
		document.getElementById("count").value=countvalue;
		var price='${product.price}';
		var count=document.getElementById("count").value;
	 	var total=document.getElementById("totalPrice");

		total.innerHTML=price*count; 
		
	}
	
	function submitclick(str){
		if(str=="cart"){
			buyform.action="cart";
		}else if(str=="buy"){
			buyform.action="buyOnly"
		}else if(str=="wish"){
			buyform.action="wish";
		}
	
	}
</script>
</head>
<body>
<!-- <div style="margin-left: 200px">	
	<input class="w3-button w3-orange w3-wide" type="button" value="BACK" style="width:172px"
	onclick="history.back()">
</div> -->

<!-- 상단 영역 -->
<div style="margin:0 auto; width:900px;">
	<!-- 이미지 -->
	<div style="float:left; margin-right:20px; height:400px">
	<img src="/ShopProject/filesave/${product.thumbnail}" height="400px" width="400px"> 
	</div>
	<form method="post" name="buyform">
	<input type="hidden" name="num" value="${product.num }">
	<input type="hidden" name="edit" value="${edit}">
	<!-- 상단 설명 -->
	<div style="height: 400px; float: left; border-top: 1px dotted gray;
		border-bottom: 1px dotted gray; padding:10px">
	
		<ul style="height: 250px">
			<li class="pdetail">상품명&nbsp;&nbsp;${product.productname }</li>
			<li class="pdetail">판매가&nbsp;&nbsp;<b>${product.price }</b>원</li>
			<li class="pdetail">배송비&nbsp;&nbsp;${product.shippingfee} 원</li>
			<li class="pdetail">구매수량<br>
			<input id="count" name="count" type="text" size="5" value="1" readonly="readonly">
			<input  type="button" name="plus" size="1" value="+" onclick="cal(this.value);" style="height:30px;width:30px" >
			<input  type="button" name="plus" size="1" value="-" onclick="cal(this.value);" style="height:30px;width:30px">
			</li>
			<li class="pdetail">합계금액<br><b id="totalPrice"></b></li>
			
			
		</ul>
		<input class="w3-button w3-orange w3-wide detailbutton" type="submit" value="BUY" onclick="submitclick('buy');">
		<input class="w3-button w3-amber w3-wide detailbutton" type="submit" value="CART" onclick="submitclick('cart');">
		<br>
		<input class="w3-button w3-amber w3-wide detailbutton" type="submit" value="WISH" onclick="submitclick('wish')">
		<input class="w3-button w3-light-grey w3-wide detailbutton" type="button" value="BACK" onclick="history.back()">	
	</div>
	</form>
	
</div>
<!-- 하단 상품 디테일 -->
<div class="w3-container" style="margin:0 auto; width:900px;">
	<table style="margin: auto;text-align: center;">
	<c:if test="${product.filename1 != '' && product.filename1 ne null}">
		<tr><td style="padding-top: 30px;">
			<img src="/ShopProject/filesave/${product.filename1}" height="400px" width="400px"></td></tr>
	</c:if>
	<c:if test="${product.filename2 != '' && product.filename2 ne null}">
		<tr><td style="padding-top: 30px;">
			<img src="/ShopProject/filesave/${product.filename2}" height="400px" width="400px"></td></tr>
	</c:if>
	<c:if test="${product.filename3 != '' && product.filename3 ne null}">
		<tr><td style="padding-top: 30px;">
			<img src="/ShopProject/filesave/${product.filename3}" height="400px" width="400px"></td></tr>
	</c:if>
	<c:if test="${product.filename4 != '' && product.filename4 ne null}">
		<tr><td style="padding-top: 30px;">
			<img src="/ShopProject/filesave/${product.filename4}" height="400px" width="400px"></td></tr>
	</c:if>
		<tr><td style="padding-top: 30px;">${product.content }</td></tr>
		
	</table>
</div>


</body>
</html>