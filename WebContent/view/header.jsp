<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="/ShopProject/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
<title>::::Dear Room::::</title>
</head>
<body>
	<div class="w3-container w3-right-align w3-small w3-wide" style="padding-right:10%;padding-top:5px">
		
	<c:if test="${sessionScope.member eq null }">
		<a class="lgmenu" href="/ShopProject/login/enter">LOGIN</a>&nbsp;
	</c:if>
	<c:if test="${sessionScope.member ne null }">
		<a class="lgmenu" href="/ShopProject/login/out">LOGOUT</a>&nbsp;
	</c:if>
	<c:if test="${sessionScope.member eq null }">
		<a class="lgmenu" href="/ShopProject/login/enter">MYPAGE</a>
				&nbsp;
	</c:if>
	<c:if test="${sessionScope.member ne null }">
		<a class="lgmenu" href="/ShopProject/login/mypage">MYPAGE</a>
				&nbsp;
	</c:if>
		
		<%-- <%
			if(session.getAttribute("member")==null){
				%><a class="lgmenu" href="/ShopProject/login/enter">LOGIN</a>
				&nbsp;<%
			}else{
				%><a class="lgmenu" href="/ShopProject/login/out">LOGOUT</a>
				&nbsp;<%
			}
		%>
		 --%>
<%-- 		<%
			if(session.getAttribute("member")==null){
				%><a class="lgmenu" href="/ShopProject/login/enter">MYPAGE</a>
				&nbsp;<%
			}else{
				%><a class="lgmenu" href="/ShopProject/login/mypage">MYPAGE</a>
				&nbsp;<%
			}
		%> --%>

		<a class="lgmenu" href="/ShopProject/product/cart">CART</a>
		&nbsp;

	<c:if test="${sessionScope.member.memberlev eq '1'}">
		<a class="lgmenu" href="/ShopProject/adm/memberList" style="color: red">ADMIN</a>
					&nbsp;	
	</c:if>
<%-- 		<%
			if(session.getAttribute("member")!=null){
				LoginDataBean member=(LoginDataBean)session.getAttribute("member");
				
				if(member.getMemberlev().equals("1")){	//관리자 계정일 때 노출
					%>
					<a class="lgmenu" href="/ShopProject/login/adminlist" style="color: red">ADMIN</a>
					&nbsp;		
					<%
				}
			}		
		%>
 --%>
	
	</div><!-- 로고 -->
	<div class="w3-padding-48 w3-center">
	  <h1 class="w3-xxlarge w3-logofont">Dear Room:</h1>
	</div>
	<!-- 메뉴 --> 
	<div class="w3-container w3-center ">
	
		<a class="lgmenu w3-font w3-wide" href="/ShopProject/product/list?categoryid=ht">HOME</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font w3-wide" href="/ShopProject/product/list?categoryid=nt">NEW</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="/ShopProject/product/list?categoryid=1">인테리어소품</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="/ShopProject/product/list?categoryid=2">가구</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="/ShopProject/product/list?categoryid=3">주방용품</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font" href="/ShopProject/product/list?categoryid=4">침구류</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="lgmenu w3-font w3-wide" href="/ShopProject/product/list?categoryid=st">SALE</a>
	</div>
	<div class="mainLine" style="">
		<hr style="border: dotted 1px grey;">	<!-- 영역이 있어야 center가 됨. 대신 패딩을 준다.... -->
	</div>
	</body>
</html>