<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</head>
<body>
<c:import url="/menuJsp/productVertMenu.jsp"></c:import>

<div style="margin-left: 10%">
	<input type="button" value="상품 등록" onclick="location.href='productForm'">

		<h5 style="padding-top:20px;padding-bottom:10px"><b>상품 리스트</b></h5>
	<form action="productList">
		<select name="boardidfilter">
					<option value="0">카테고리
					<option value="1">인테리어소품
					<option value="2">가구
					<option value="3">주방용품
					<option value="4">침구류
		</select>
		<select name="showfilter">
					<option value="0">추가 노출 여부
					<option value="1">HOME
					<option value="2">NEW
					<option value="3">SALE
		</select>
		<select name="exposurefilter">
					<option value="0">판매 여부
					<option value="t">판매중
					<option value="f">판매중지
		</select>
		상품명 :
		<input type="text" name="searchtext">
		<input type="submit" value="검색">
	</form>
	
	<c:if test="${count==0 }">
		<table>
			<tr>
				<td align="center">등록한 상품이 없습니다.</td>
			</tr>
		</table>

	</c:if>
	<c:if test="${count!=0 }">

	<table style="padding-top:10px;">
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">상품번호</td>
			<td class="tableline w3-center">카테고리</td>
			<td class="tableline w3-center">썸네일</td>	
			<td class="tableline w3-center">상품명</td>
			<td class="tableline w3-center">판매가격</td>
			<td class="tableline w3-center">배송비</td>
			<td class="tableline w3-center">Home 노출</td>
			<td class="tableline w3-center">New 노출</td>
			<td class="tableline w3-center">Sale 노출</td>
			<td class="tableline w3-center">할인가격</td>
			<td class="tableline w3-center">판매여부</td>
			<td class="tableline w3-center">등록일시</td>

		</tr>
		<c:forEach var="product" items="${productList}" >
	
		<tr>
			<td class="tableline w3-center">${number}</td>
			<c:set var="number" value="${number-1}"/>
		
			<td class="tableline w3-center">${product.num}</td>
			<td class="tableline w3-center">${product.boardtype}</td>
			<td class="tableline w3-center">
				<img src="/ShopProject/filesave/${product.thumbnail}" height="50px" width="50px"> 
			</td>
			<td class="tableline w3-center">
				<a href="productDetail?num=${product.num}&pageNum=${currentPage}">
				${product.productname}</a></td>
			<td class="tableline">${product.price}</td>
			<td class="tableline">${product.shippingfee}</td>
			<td class="tableline w3-center">${product.openhome}</td>
			<td class="tableline w3-center">${product.opennewpage}</td>
			<td class="tableline w3-center">${product.opensale}</td>
			<td class="tableline">${product.saleprice}</td>
			<td class="tableline w3-center">${product.openexposure}</td>
			<td class="tableline w3-center">${product.regdate}</td>
			
		</tr>
			
		</c:forEach>
	</c:if>
			
	<tr>
	<td colspan="9" class="w3-center" style="padding-top: 10px">
	<c:if test="${count>0 }">
	
		<c:if test="${startPage>bottomLine }">
			<a href="productList?pageNum=${startPage-bottomLine}"><b>&lt;</b></a>				
			
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">		
			<a href="productList?pageNum=${i}">
				<c:if test="${i!=currentPage} ">
					${i}
				</c:if>
				<c:if test="${i==currentPage} ">
					<font color='red'>${i}</font>
				</c:if>
			</a>
		</c:forEach>		
		<c:if test="${endPage<pageCount}">
			<a href="productList?pageNum=${startPage+bottomLine}">&gt;</a>	
		</c:if>
				
	</c:if>
		
		</td>
</tr>
	</table>
	
</div>

</body>
</html>