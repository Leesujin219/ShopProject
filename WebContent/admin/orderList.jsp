<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">
	.tableline{
		border: 1px gray dotted;
		padding: 5px;
		padding-left: 10px;
		padding-right:10px;
	}
</style>
<body>
<c:import url="/menuJsp/productVertMenu.jsp"></c:import>

<c:if test="${count==0 }">
		<table>
			<tr>
				<td align="center">주문내역이 없습니다.</td>
			</tr>
		</table>
</c:if>
<c:if test="${count!=0 }">
		
<div style="margin-left: 10%">
	<h5 style="padding-top:20px;padding-bottom:10px"><b>주문 정보 확인</b></h5>
	<form action="orderList">
		<select name="orderfilter">
			<option value="0">전체주문
			<option value="배송준비중">배송준비중
			<option value="발송완료">발송완료
			<option value="주문완료">주문완료
			<option value="주문취소">주문취소
			<option value="관리자취소">관리자취소
			<option value="입금확인중">입금확인중
			<option value="입금완료">입금완료	
		</select>
		<input type="submit" value="검색">
	</form>
	
	<table>
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">주문번호</td>
			<td class="tableline w3-center">주문명</td>
			<td class="tableline w3-center">총금액</td>
			<td class="tableline w3-center">입금자명</td>
			<td class="tableline w3-center">주문상태</td>
			<td class="tableline w3-center">입금상태</td>
			<td class="tableline w3-center">배송상태</td>
			<td class="tableline w3-center">주문일자</td>
			<td class="tableline w3-center">입금확인일자</td>
		</tr>
		<c:forEach var="order" items="${orderList }"  >
		<tr>
			<td class="tableline w3-center">${number}</td>
			<c:set var="number" value="${number-1}"/>
			<!-- 페이지 내 number를 설정. number를 찍고 number-1을 다시 number에 넣음 -->
			<td class="tableline w3-center">${order.ordernum}</td>
			<td class="tableline w3-center">
				<a href="/ShopProject/adm/orderDetail?ordernum=${order.ordernum}">
				${order.productname } 외..</a></td>
			<td class="tableline">${order.totalprice}</td>
			<td class="tableline">${order.name}</td>
			<td class="tableline">${order.statususer}</td>
			<td class="tableline">${order.moneycheck}</td>
			<td class="tableline">${order.status}</td>
			<td class="tableline">${order.regdate}</td>
			<td class="tableline">${order.moneyregdate}</td>	
		</tr>
		</c:forEach>
	
</c:if>

	<!--게시판 하단 페이지 이동-->
	<tr>
	<td colspan="9" class="w3-center" style="padding-top: 10px">
	<c:if test="${count>0 }">
	
	
		<c:if test="${startPage>bottomLine}">
			<a href="orderList?pageNum=${startPage-bottomLine}"><b>&lt;</b></a>				
		</c:if>
	<c:forEach var='i' begin='${startPage }' end='${endPage }'>
		<a href="orderList?pageNum=${i}">
				<c:if test="${i!=currentPage }">							
					${i }
				</c:if>
				<c:if test="${i==currentPage }">							
					<font color='red'>${i}</font>
				</c:if>	
		</a>				
	</c:forEach>
		<c:if test="${endPage<pageCount }">
			<a href="orderList?pageNum=${startPage+bottomLine}">&gt;</a>
		</c:if>
		
	</c:if>
		</td>
</tr>
</table>
</div>

</body>
</html>