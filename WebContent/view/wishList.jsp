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
<c:import url="/menuJsp/memberVertMenu.jsp"></c:import>
<c:if test="${count==0 }">
			<div style="padding-left:100px">���� ��ǰ�� �����ϴ�.</div>		
</c:if>
<c:if test="${count!=0 }">

<div >

	<table style="padding-left:15%">
		<tr>
			<td colspan=6 ><h5 class="w3-wide w3-center"><b>WISHLIST</b></h5></td>
		</tr>
		
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">��ǰ��ȣ</td>
			<td class="tableline w3-center">�̸�����</td>
			<td class="tableline w3-center">��ǰ��</td>
			<td class="tableline w3-center">����</td>
			<td class="tableline w3-center"></td>
		</tr>
		<c:set var="i" value="0"/>		
		<c:forEach var="product" items="${productList }" >
		<tr>
			<td class="tableline w3-center">${number}</td>
			<c:set var="number" value="${number-1}"/>
			<!-- ������ �� number�� ����. number�� ��� number-1�� �ٽ� number�� ���� -->
			<td class="tableline w3-center">${product.num}</td>
			<td class="tableline w3-center"><img src="/ShopProject/filesave/${product.thumbnail}" height="50px" width="50px"> </td>
			<td class="tableline w3-center">
				<a href="/ShopProject/product/detail?num=${product.num}">${product.productname}</a></td>
			<td class="tableline">${product.price-product.saleprice}</td>
			<td class="tableline">
				<input type="button" value="����" onclick="location='/ShopProject/login/wishDelete?wishnum=${wishList[i].wishnum}'">
			</td>
		</tr>
		<c:set var="i" value="${i+1}"/>		
		</c:forEach>
	
</c:if>

	<!--�Խ��� �ϴ� ������ �̵�-->
	<tr>
	<td colspan="9" class="w3-center" style="padding-top: 10px">
	<c:if test="${count>0 }">
	
	
		<c:if test="${startPage>bottomLine}">
			<a href="wishList?pageNum=${startPage-bottomLine}"><b>&lt;</b></a>				
		</c:if>
	<c:forEach var='i' begin='${startPage }' end='${endPage }'>
		<a href="wishList?pageNum=${i}">
				<c:if test="${i!=currentPage }">							
					${i }
				</c:if>
				<c:if test="${i==currentPage }">							
					<font color='red'>${i}</font>
				</c:if>	
		</a>				
	</c:forEach>
		<c:if test="${endPage<pageCount }">
			<a href="wishList?pageNum=${startPage+bottomLine}">&gt;</a>
		</c:if>
		
	</c:if>
		</td>
</tr>
</table>
</div>

</body>
</html>