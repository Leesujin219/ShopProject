<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		var	each=document.getElementsByClassName("eachPrice");
		var sum=0;
		var numList=document.getElementsByName("numList");
		
		for(var i=0;i<numList.length;i++){
				if(numList[i].checked==true){
					sum+=parseInt(each[i].innerHTML);
				}
		}
		
		document.getElementById("totalPrice").innerHTML=sum;
		document.getElementById("totalPrice2").value=sum;
	}	
	
	function checkChange(checkbox){
		var	each=document.getElementsByClassName("eachPrice");
		var sum=parseInt(document.getElementById("totalPrice").innerHTML);

		var i=checkbox.id;
		if(checkbox.checked==true){
			sum+=parseInt(each[i].innerHTML);
		}else{
			sum-=parseInt(each[i].innerHTML);
		}
		document.getElementById("totalPrice").innerHTML=sum;
		document.getElementById("totalPrice2").value=sum;
		
	}
	
</script>
</head>

<body>
<c:if test="${cart==null||cart==''||cart.size()==0}">
	<div class="w3-container w3-center">장바구니가 비어있습니다.</div>
</c:if>
<c:if test="${cart!=null&&cart!=''&&cart.size()!=0}">
<form name="cartForm" method="post" action="buy">
	<input type="hidden" id="totalPrice2" name="totalPrice" value="">
<table style="padding-top:10px; margin: auto;">
	<tr>
		<td colspan=10 style="padding:10px" class="w3-right-align">
			<input class=" w3-button w3-black"type="submit" value="주문하기">
		</td>
	<tr>
	<tr>
		<td colspan=9 style="padding-bottom:10px ;font-size:15pt"><b>장바구니</b></td>
	</tr>
	<tr>
		<td class="tableline w3-center">선택</td>
		<td class="tableline w3-center">미리보기</td>
		<td class="tableline w3-center">상품명</td>
		<td class="tableline w3-center">가격</td>
		<td class="tableline w3-center">할인금액</td>
		<td class="tableline w3-center">개당 금액</td>
		<td class="tableline w3-center">구매수량</td>
		<td class="tableline w3-center">총 금액</td>
		<td class="tableline w3-center"></td>
	</tr>
<c:set var="cartMap" value="${cart}"/>
<c:set var="chknum" value="0" />

<c:forEach var="product" items="${cartNumList }">
	<tr>
		<td class="tableline w3-center">
			<input id="${chknum }" type="checkbox" name="numList" value="${product.num}" checked onclick="checkChange(this)">
			<!-- string[]로 서블릿에서 값 받을 수 있음 -->
		</td>
<c:set var="chknum" value="${chknum+1}" />

<fmt:parseNumber var="priceNum" type="number" value="${product.price}" />
<fmt:parseNumber var="salePriceNum" type="number" value="${product.saleprice}" />
<c:set var="count" value="${cart[product.num]}"/>
		<td class="tableline w3-center"><img src="/ShopProject/filesave/${product.thumbnail}" height="50px" width="50px"></td>
		<td class="tableline w3-center">${product.productname}</td>
		<td class="tableline w3-center">${product.price}</td>
		<td class="tableline w3-center"><div style="color:red">${product.saleprice }</div></td>
		<td class="tableline w3-center">${priceNum-salePriceNum}</td>
		<c:set var="i" value="${product.num }"/>
		<td class="tableline w3-center"><c:out value="${count}"/></td>
		<td class="tableline w3-center eachPrice" style="font-style: bold">${(priceNum-salePriceNum)*count}</td>
		<td class="tableline w3-center">
			<input type="button" value="삭제" onclick="location.href='/ShopProject/product/cartDelete?numdel=${product.num}'">
			<input type="button" value="수정" onclick="location.href='/ShopProject/product/detail?num=${product.num}&edit=true'">
		</td>		
	</tr>
</c:forEach>
	<tr>
		<td>총 금액:</td>
		<td id="totalPrice" colspan=9></td>
	</tr>
</table>
</form>
</c:if>

</body>
</html>