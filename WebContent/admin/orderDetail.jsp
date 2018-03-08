<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		var statususer='${orderDetailList[0].statususer }';
		var status='${orderDetailList[0].status }';
		var moneycheck='${orderDetailList[0].moneycheck }';
		if(statususer=='���������'||statususer=='�ֹ����'){
			document.getElementById("cancel").disabled = true;
			document.getElementById("send").disabled = true;
			document.getElementById("money").disabled = true;

		}
		if(status=='�߼ۿϷ�'){
			document.getElementById("send").disabled = true;
		}
		if(moneycheck=='�ԱݿϷ�'){
			document.getElementById("money").disabled = true;
		}
		
	}

</script>


</head>
<body>

<div style="margin-left: 10%">

	<table>
		<tr>
			<td colspan="9"><input type="button" value="�������" OnClick="location='orderList?pageNum=${pageNum}'"></td>
		</tr>
		<tr>
			<td><h5 style="padding-top:20px;padding-bottom:10px"><b>�ֹ� ��</b></h5></td>
		</tr>
		<tr>
			<td class="tableline w3-center">�ֹ���ȣ</td>
			<td class="tableline w3-center">�ѱݾ�</td>
			<td class="tableline w3-center">�Ա��ڸ�</td>
			<td class="tableline w3-center">�ֹ�����</td>
			<td class="tableline w3-center">�Աݻ���</td>
			<td class="tableline w3-center">��ۻ���</td>
			<td class="tableline w3-center">�ֹ�����</td>
			<td class="tableline w3-center">�Ա�Ȯ������</td>
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
		<tr><td colspan="5"><h6><b>�������</b></h6></td></tr>
		<tr>
			<td class="tableline w3-center">��ǰ������</td>
			<td class="tableline w3-center">��ȭ��ȣ</td>
			<td class="tableline w3-center">�����ȣ</td>
			<td class="tableline w3-center">�ּ�</td>
			<td class="tableline w3-center">���ּ�</td>
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
			<td><h6 style="padding-top:10px;"><b>���� ����</b></h6></td>
		</tr>
		<tr>
			<td class="tableline w3-center">
			<input id="send" type="button" value="�߼ۿϷ�" onclick="location='/ShopProject/product/orderUpdate?type=send&ordernum=${orderDetailList[0].ordernum}'">
			<input id="money" type="button" value="�Ա�Ȯ��" onclick="location='/ShopProject/product/orderUpdate?type=moneycheck&ordernum=${orderDetailList[0].ordernum}'">
			<input id="cancel" type="button" value="�ֹ����" onclick="location='/ShopProject/product/orderUpdate?type=cancel&ordernum=${orderDetailList[0].ordernum}'">
			</td>
		</tr>
	</table>
	<table>	
		<tr>
			<td><h5 style="padding-top:20px;padding-bottom:10px"><b>���� ��ǰ</b></h5></td>
		</tr>
		<tr>
			<td class="tableline w3-center">��ǰ��ȣ</td>
			<td class="tableline w3-center">��ǰ��</td>
			<td class="tableline w3-center">����</td>
			<td class="tableline w3-center">���αݾ�</td>
			<td class="tableline w3-center">�� �ݾ�</td>

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