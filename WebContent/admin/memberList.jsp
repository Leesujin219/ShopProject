<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.tableline{
		border: 1px gray dotted;
		padding: 5px;
		padding-left: 10px;
		padding-right:10px;
	}
</style>
<script type="text/javascript">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>



<c:if test="${count==0 }">
		<table>
			<tr>
				<td align="center">������ ȸ���� �����ϴ�.</td>
			</tr>
		</table>
</c:if>
<c:if test="${count!=0 }">
		
<div style="margin-left: 10%">
	<h5 style="padding-top:20px;padding-bottom:10px"><b>�� ���� Ȯ��</b></h5>
	<form action="memberList">
		<select name="memberfilter">
			<option value="0">��üȸ��
			<option value="10">�Ϲ�ȸ��
			<option value="1">������
		</select>
		<select name="searchfilter">
			<option value="0">ȸ���˻�
			<option value="id">���̵�
			<option value="name">�̸�
			<option value="buynum">����Ƚ��
		</select>
		<input type="text" name="searchtext">
		<input type="submit" value="�˻�">
	</form>
	
	<table>
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">����ȣ</td>
			<td class="tableline w3-center">ID</td>
			<td class="tableline w3-center">�̸�</td>
			<td class="tableline w3-center">���</td>
			<td class="tableline w3-center">����</td>
			<td class="tableline w3-center">����</td>
			<td class="tableline w3-center">����Ƚ��</td>
			<td class="tableline w3-center">��������</td>
		</tr>
		<c:forEach var="member" items="${memberList }"  >
		<tr>
			<td class="tableline w3-center">${number}</td>
			<c:set var="number" value="${number-1}"/>
			<!-- ������ �� number�� ����. number�� ��� number-1�� �ٽ� number�� ���� -->
			<td class="tableline w3-center">${member.num}</td>
			<td class="tableline w3-center">
				<a href="memberDetail?id=${member.id }&pageNum=${currentPage}">${member.id }</a></td>
			<td class="tableline">${member.name }</td>
			<td name="memberLevel" class="tableline">${member.memberlevtype }</td>
			<td class="tableline">${member.age }</td>
			<td class="tableline">${member.gendertype }</td>
			<td class="tableline">${member.buynum}</td>
			<td class="tableline">${member.reg_date}</td>
		</tr>
		

			</c:forEach>
	
</c:if>

	<!--�Խ��� �ϴ� ������ �̵�-->
	<tr>
	<td colspan="9" class="w3-center" style="padding-top: 10px">
	<c:if test="${count>0 }">
	
	
		<c:if test="${startPage>bottomLine}">
			<a href="memberList?pageNum=${startPage-bottomLine}"><b>&lt;</b></a>				
		</c:if>
	<c:forEach var='i' begin='${startPage }' end='${endPage }'>
		<a href="memberList?pageNum=${i}">
				<c:if test="${i!=currentPage }">							
					${i }
				</c:if>
				<c:if test="${i==currentPage }">							
					<font color='red'>${i}</font>
				</c:if>	
		</a>				
	</c:forEach>
		<c:if test="${endPage<pageCount }">
			<a href="memberList?pageNum=${startPage+bottomLine}">&gt;</a>
		</c:if>
		
	</c:if>
		</td>
</tr>
</table>
</div>

</body>
</html>