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
				<td align="center">�ֹ������� �����ϴ�.</td>
			</tr>
		</table>
</c:if>
<c:if test="${count!=0 }">
		
<div style="margin-left: 10%">
	<h5 style="padding-top:20px;padding-bottom:10px"><b>�ֹ� ���� Ȯ��</b></h5>
	<form action="orderList">
		<select name="orderfilter">
			<option value="0">��ü�ֹ�
			<option value="����غ���">����غ���
			<option value="�߼ۿϷ�">�߼ۿϷ�
			<option value="�ֹ��Ϸ�">�ֹ��Ϸ�
			<option value="�ֹ����">�ֹ����
			<option value="���������">���������
			<option value="�Ա�Ȯ����">�Ա�Ȯ����
			<option value="�ԱݿϷ�">�ԱݿϷ�	
		</select>
		<input type="submit" value="�˻�">
	</form>
	
	<table>
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">�ֹ���ȣ</td>
			<td class="tableline w3-center">�ֹ���</td>
			<td class="tableline w3-center">�ѱݾ�</td>
			<td class="tableline w3-center">�Ա��ڸ�</td>
			<td class="tableline w3-center">�ֹ�����</td>
			<td class="tableline w3-center">�Աݻ���</td>
			<td class="tableline w3-center">��ۻ���</td>
			<td class="tableline w3-center">�ֹ�����</td>
			<td class="tableline w3-center">�Ա�Ȯ������</td>
		</tr>
		<c:forEach var="order" items="${orderList }"  >
		<tr>
			<td class="tableline w3-center">${number}</td>
			<c:set var="number" value="${number-1}"/>
			<!-- ������ �� number�� ����. number�� ��� number-1�� �ٽ� number�� ���� -->
			<td class="tableline w3-center">${order.ordernum}</td>
			<td class="tableline w3-center">
				<a href="/ShopProject/adm/orderDetail?ordernum=${order.ordernum}">
				${order.productname } ��..</a></td>
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

	<!--�Խ��� �ϴ� ������ �̵�-->
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