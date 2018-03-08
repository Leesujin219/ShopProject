<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
		var orderCheck='${orderCheck}';
		if(orderCheck=='true'){
			document.getElementById("personalData").style.display='block';
			document.getElementById("personalPut").style.display='none';
		}
		var statususer='${orderDetailList[0].statususer }';
		if(statususer=='관리자취소'||statususer=='주문취소'){
			document.getElementById("user").disabled = true;
		}
		
	}
</script>
</head>
<body>
<div id="personalPut">
<form method="post" action="noLoginCheck">
	<input type="hidden" name="ordernum" value="${ordernum }">
	<div class="w3-container w3-center" style="margin-bottom: 20px;color: black;font-style: bold">
		<h6>주문정보 열람을 위해 입금자명과 전화번호를 입력하세요</h6>
	</div>
	<div class="w3-container w3-center" style="margin-bottom: 10px;">
		<input class="lgform" type="text" size="15" maxlength="12" name="name" value="입금자명" >
	</div>
	<div class="w3-container w3-center" style="margin-bottom: 10px;">
		<input class="lgform" type="text" size="15" maxlength="12" name="phone" value="전화번호" >
	</div>
	<div class="w3-container w3-center" >	
		<input class="w3-button w3-orange w3-wide" type="submit" value="조회" style="width:172px">
	</div>
</form>
</div>

<div id="personalData" style="margin-left: 20%;display:none">

	<table>

		<tr>
			<td><h5 style="padding-top:20px;padding-bottom:10px"><b>주문 상세</b></h5></td>
		</tr>
		<tr>
			<td class="tableline w3-center">주문번호</td>
			<td class="tableline w3-center">총금액</td>
			<td class="tableline w3-center">입금자명</td>
			<td class="tableline w3-center">주문상태</td>
			<td class="tableline w3-center">입금상태</td>
			<td class="tableline w3-center">배송상태</td>
			<td class="tableline w3-center">주문일자</td>
			<td class="tableline w3-center">입금확인일자</td>
		</tr>
		<tr>
			<td class="tableline w3-center">${orderDetailList[0].ordernum }</td>
			<td class="tableline w3-center">${orderDetailList[0].totalprice }</td>
			<td class="tableline w3-center">${orderDetailList[0].name }</td>
			<td class="tableline w3-center">${orderDetailList[0].statususer }</td>
			<td class="tableline w3-center">${orderDetailList[0].moneycheck }</td>
			<td class="tableline w3-center">${orderDetailList[0].status }</td>
			<td class="tableline w3-center">${orderDetailList[0].regdate }</td>
			<td class="tableline w3-center">${orderDetailList[0].moneyregdate }</td>
		</tr>
	</table>
		<table>
		<tr><td colspan="5"><h6><b>배송정보</b></h6></td></tr>
		<tr>
			<td class="tableline w3-center">상품수령인</td>
			<td class="tableline w3-center">전화번호</td>
			<td class="tableline w3-center">우편번호</td>
			<td class="tableline w3-center">주소</td>
			<td class="tableline w3-center">상세주소</td>
		</tr>
		<tr>
			<td class="tableline w3-center">${orderDetailList[0].getname }</td>
			<td class="tableline w3-center">${orderDetailList[0].phone }</td>
			<td class="tableline w3-center">${orderDetailList[0].addrnum }</td>
			<td class="tableline w3-center">${orderDetailList[0].address1 }</td>
			<td class="tableline w3-center">${orderDetailList[0].address2 }</td>

		</tr>
	</table>
	<table>
		<tr>
			<td><h6 style="padding-top:10px;"><b>상태 변경</b></h6></td>
		</tr>
		<tr>
			<td class="tableline w3-center">
			<input id="user" type="button" value="주문취소" onclick="location='/ShopProject/product/orderUpdate?type=user&ordernum=${orderDetailList[0].ordernum}&login=no'">
			</td>
		</tr>
	</table>
	<table>	
		<tr>
			<td><h5 style="padding-top:20px;padding-bottom:10px"><b>구매 상품</b></h5></td>
		</tr>
		<tr>
			<td class="tableline w3-center">제품번호</td>
			<td class="tableline w3-center">제품명</td>
			<td class="tableline w3-center">가격</td>
			<td class="tableline w3-center">할인금액</td>
			<td class="tableline w3-center">총 금액</td>

		</tr>
		<c:forEach var="orderDetail" items="${orderDetailList }"  >
		<tr>
			<td class="tableline w3-center">${orderDetail.num}</td>
			<td class="tableline">${orderDetail.productname}</td>
			<td class="tableline">${orderDetail.originalprice}</td>
			<td class="tableline">${orderDetail.saleprice}</td>
			<td class="tableline">${orderDetail.price}</td>

		</tr>
		</c:forEach>
	</table>
	
</div>
	
</body>
</html>
</body>
</html>