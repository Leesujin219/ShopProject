<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.pul{
		text-align: center;  list-style:none; 
	}
	.plist{
		display:inline-block;
		padding-left: 5px;
		padding-right: 5px;
	}
	.ptext{
		text-align: left;
		padding-top: 5px;
		padding-bottom: 10px;
		font-size: 12px;
	}
	a.plist:link{
		text-decoration:none;
	}
	a.plist:visited{
		text-decoration:none;
	}
	a.plist:active{
		color: tomato;
		text_decoration:none;
	}
	a.plist:hover{
		color: tomato;
		text_decoration:none;
	}

</style>
</head>
<body>
<c:if test="${count==0}">
	<h4 class="w3-center w3 container">등록된 상품이 없습니다.</h4>	
</c:if>
<c:if test="${count!=0}">

<div class="producttable">		

<c:set var="i" value="0"/>
<ul class="pul">
<c:forEach var="product" items="${productList}">
	<c:set var="i" value="${i+1}"/>
				<li class="plist">
					<a href="detail?num=${product.num}" class="plist">
						<img src="/ShopProject/filesave/${product.thumbnail}" height="300px" width="300px"> 
					<div class="ptext">${product.productname}<br><b>${product.price}</b></div>
					</a>
				</li>		
	<c:if test="${i%4==0}">
		</ul>
		<ul class="pul">
	</c:if>
</c:forEach>
</ul>	
</div>
<div>
	<c:if test="${count>0 }">
	
		<c:if test="${startPage>bottomLine }">
			<a href="list?pageNum=${startPage-bottomLine}"><b>&lt;</b></a>				
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">		
			<a href="list?pageNum=${i}">
				<c:if test="${i!=currentPage} ">
					${i}
				</c:if>
				<c:if test="${i==currentPage} ">
					<font color='red'>${i}</font>
				</c:if>
			</a>
		</c:forEach>		
		<c:if test="${endPage<pageCount}">
			<a href="list?pageNum=${startPage+bottomLine}">&gt;</a>	
		</c:if>
	</c:if>
</div>
</c:if>
</body>
</html>