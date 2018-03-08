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
				<td align="center">가입한 회원이 없습니다.</td>
			</tr>
		</table>
</c:if>
<c:if test="${count!=0 }">
		
<div style="margin-left: 10%">
	<h5 style="padding-top:20px;padding-bottom:10px"><b>고객 정보 확인</b></h5>
	<form action="memberList">
		<select name="memberfilter">
			<option value="0">전체회원
			<option value="10">일반회원
			<option value="1">관리자
		</select>
		<select name="searchfilter">
			<option value="0">회원검색
			<option value="id">아이디
			<option value="name">이름
			<option value="buynum">구매횟수
		</select>
		<input type="text" name="searchtext">
		<input type="submit" value="검색">
	</form>
	
	<table>
		<tr>
			<td class="tableline w3-center">no</td>
			<td class="tableline w3-center">고객번호</td>
			<td class="tableline w3-center">ID</td>
			<td class="tableline w3-center">이름</td>
			<td class="tableline w3-center">등급</td>
			<td class="tableline w3-center">나이</td>
			<td class="tableline w3-center">성별</td>
			<td class="tableline w3-center">구매횟수</td>
			<td class="tableline w3-center">가입일자</td>
		</tr>
		<c:forEach var="member" items="${memberList }"  >
		<tr>
			<td class="tableline w3-center">${number}</td>
			<c:set var="number" value="${number-1}"/>
			<!-- 페이지 내 number를 설정. number를 찍고 number-1을 다시 number에 넣음 -->
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

	<!--게시판 하단 페이지 이동-->
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