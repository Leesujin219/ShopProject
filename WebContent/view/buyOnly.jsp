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

</head>
<body>
<form method="post" action="orderPut?type=only">
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="count" value="${count }">
	<table style="padding-top:10px; margin: auto;">
	<tr>
		<td colspan=7 style="padding-bottom:10px ;font-size:15pt"><b>�����ϱ�</b></td>
	</tr>
	<tr>
		<td class="tableline w3-center">�̸�����</td>
		<td class="tableline w3-center">��ǰ��</td>
		<td class="tableline w3-center">����</td>
		<td class="tableline w3-center">���αݾ�</td>
		<td class="tableline w3-center">���� �ݾ�</td>
		<td class="tableline w3-center">���ż���</td>
		<td class="tableline w3-center">�� �ݾ�</td>
		
	</tr>	
<fmt:parseNumber var="priceNum" type="number" value="${product.price}" />
<fmt:parseNumber var="salePriceNum" type="number" value="${product.saleprice}" />
	<tr>
		
	
		<td class="tableline w3-center"><img src="/ShopProject/filesave/${product.thumbnail}" height="50px" width="50px"></td>
		<td class="tableline w3-center">${product.productname}</td>
		<td class="tableline w3-center">${product.price }</td>
		<td class="tableline w3-center"><div style="color:red">${product.saleprice }</div></td>
		<td class="tableline w3-center">${priceNum-salePriceNum}</td>
		<td class="tableline w3-center">${count }</td>
		<td class="eachPrice tableline w3-center"><b>${(priceNum-salePriceNum)*count}</b></td>
		<td><input type="hidden" name="numList" value="${product.num }"></td>


	</tr>

	<tr>
		<td>�� �ݾ�:</td>
		<td>${(priceNum-salePriceNum)*count}<input type="hidden" name="totalPrice"value="${(priceNum-salePriceNum)*count}"></td>
	</tr>
	</table>
	<table style="padding-top:10px; margin: auto;">
	<tr><td style="padding:10px; font-size:15pt"><b>�ֹ��� ����</b></td></tr>
	<tr>
		<td class="tableline w3-center">�Ա��ڸ�</td>
		<td class="tableline w3-center" >
			<c:if test="${member!=null && member!=''}">
			<input type="text" name="name" value="${member.name }">
			</c:if>
			<c:if test="${member==null||member=='' }">

			<input type="text" name="name" value="">
			</c:if>
	
	
		</td>
	</tr>
	<tr>
		<td class="tableline w3-center">�޴���</td>
		<td class="tableline w3-center" >
			<c:if test="${member!=null && member!=''}">
			<input type="text" name="getname" value="${member.name }">
			</c:if>
			<c:if test="${member==null||member=='' }">

			<input type="text" name="getname" value="">
			</c:if>
	
	
		</td>
	</tr>
		<td class="tableline w3-center">��ȭ��ȣ</td>
		<td class="tableline w3-center">
			<c:if test="${member!=null && member!=''}">
			<input type="text" maxlength="11" name="phone" value="${member.phone}">
			</c:if>
			<c:if test="${member==null||member=='' }">
			<input type="text" maxlength="11" name="phone" value="">
			</c:if>
		
		
		</td>
	</tr>
	</tr>
		<td class="tableline w3-center">�����ȣ</td>
		<td class="tableline w3-center">
			<c:if test="${member!=null && member!=''}">
			<input type="text" name="addrnum" value="${member.addrnum}">
			</c:if>
			<c:if test="${member==null||member=='' }">
			<input type="text" name="addrnum" value="">
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="tableline w3-center">�ּ�</td>
		<td class="tableline w3-center">
			<c:if test="${member!=null && member!=''}">
			<input type="text" name="address1" value="${member.address1}">
			</c:if>
			<c:if test="${member==null||member=='' }">
			<input type="text" name="address1" value="">
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="tableline w3-center">���ּ�</td>
		<td class="tableline w3-center">
			<c:if test="${member!=null && member!=''}">
			<input type="text" name="address2" value="${member.address2}">
			</c:if>
			<c:if test="${member==null||member=='' }">
			<input type="text" name="address2" value="">
			</c:if>	
		</td>
	</tr>
	<tr>
		<td class="tableline w3-center">�������</td>
		<td class="tableline w3-center">
			<input type="radio" name="payMethod" value="1" checked>�������Ա�
		</td>
	</tr>

	</table>
	<table style="padding-top:10px; margin: auto;">
	<tr>	
		<td>
			<input type="button" class="w3-button w3-gray" value="����ϱ�" onclick="location.href=''">
		</td>
		<td>
			<input type="submit" class="w3-button w3-black" value="�ֹ��ϱ�" >
		</td>
	</tr>
	</table>
</form>
</body>
</html>