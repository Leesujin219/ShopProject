
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
<script>
	window.onload=function(){
		var value ='${product.exposure}';	
		if(value=='t'){
			document.getElementById('et').checked=true;
		}else{
			document.getElementById('ef').checked=true;
		}
		
		var value ='${product.home}';	
		if(value=='t'){
			document.getElementById('ht').checked=true;
		}else{
			document.getElementById('hf').checked=true;
		}
		
		var value ='${product.newpage}';	
		if(value=='t'){
			document.getElementById('nt').checked=true;
		}else{
			document.getElementById('nf').checked=true;
		}
		
		var value ='${product.sale}';	
		if(value=='t'){
			document.getElementById('st').checked=true;
		}else{
			document.getElementById('sf').checked=true;
		}
		//boardid ����
		var value ='${product.boardid}';
		var boardselect=document.getElementById('boardselect');	
		boardselect.selectedIndex = value;
		
	}
</script>
</head>
<body>


	<form method="post" name="updateform" action="productUpdate" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${product.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table style="margin-left: 10%">
		<tr><td><h5><b>��ǰ ����</b></h5></td></tr>
		<tr>
			<td class="tableline">��ǰ��ȣ</td>
			<td class="tableline">${product.num}</td>
			<td class="tableline">��ǰ��</td>
			<td class="tableline">
				<input type="text" size="30" maxlength="30" name="productname" value="${product.productname}"></td>
		</tr>
		<tr>
			<td class="tableline">ī�װ�</td>
			<td class="tableline" colspan=3>
				<select id="boardselect" name="boardid">
					<option value="0">�����ϼ���
					<option value="1">���׸����ǰ
					<option value="2">����
					<option value="3">�ֹ��ǰ
					<option value="4">ħ����
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableline">�����</td>
			<td colspan=3 class="tableline">
			<img src="/ShopProject/filesave/${product.thumbnail}" height="300px" width="300px"> 
		</td>
		</tr>
		<tr>	
			<td class="tableline">�ǸŰ���</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="price" value="${product.price}"></td>
			<td class="tableline">��ۺ�</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="shippingfee" value="${product.shippingfee}"></td>
		</tr>
		<tr>
			<td class="tableline">������</td>
			<td class="tableline">
				<input type="text" size="30" maxlength="10" name="salepercent" value="${product.salepercent}"></td>
			<td class="tableline">���αݾ�</td>
			<td class="tableline">
				<input type="text" size="30" maxlength="10" name="saleprice" value="${product.saleprice}"></td>
		</tr>
		<tr>
			<td class="tableline">�Ǹſ���</td>
			<td class="tableline">
				<input type="radio" name="exposure" value="t" id="et">�Ǹ���&nbsp;
				<input type="radio" name="exposure" value="f" id="ef">�Ǹ�����
			</td>
			<td class="tableline">Home ����</td>
			<td class="tableline">
				<input type="radio" name="home" value="t" id="ht">����&nbsp;
				<input type="radio" name="home" value="f" id="hf">�������� ����
			</td>
		</tr>
		<tr>
			<td class="tableline">New ����</td>
			<td class="tableline">
				<input type="radio" name="newpage" value="t" id="nt">����&nbsp;
				<input type="radio" name="newpage" value="f" id="nf">�������� ����
			</td>
			<td class="tableline">Sale ����</td>
			<td class="tableline">
				<input type="radio" name="sale" value="t" onclick="onOff(this.value,'con')" id="st">����&nbsp;
				<input type="radio" name="sale" value="f" onclick="onOff(this.value,'con')" id="sf">�������� ����
			</td>
		</tr>
		<tr>
			<td class="tableline">����� ���</td>
			<td class="tableline" colspan="3">
				 <input type="file" size="40" maxlength="30" name="thumbnail" ">
			</td>
		</tr>
			<tr>
			<td class="tableline">��ǰ���� ���</td>
			<td class="tableline" colspan="3">
				 <input type="file" size="40" maxlength="30" name="filename1" >
				 	<br>
				 <input type="file" size="40" maxlength="30" name="filename2" >
				 	<br>
				 <input type="file" size="40" maxlength="30" name="filename3" >
				 	<br>
				 <input type="file" size="40" maxlength="30" name="filename4" >

			</td>
		</tr>
		
		<tr>
			<td class="tableline">��ǰ����</td>
			<td colspan=3 class="tableline">
			<textarea name="content" rows="14" cols="40">${product.content}</textarea></td>
		</tr>
		<tr>
			<td class="tableline">�ֱ� ������id</td>
			<td class="tableline">${product.writerid}</td>
			<td class="tableline">������ ������</td>
			<td class="tableline">${product.regdate}</td>
		</tr>
		<tr>
	<td colspan=4 align="center">
				<input type="submit" value="�ۼ���" >  
	 			<input type="button" value="��Ϻ���" OnClick="window.location='productList?pageNum=${pageNum}'">
			</td>		
		</tr>
	</table>
	</form>		
		
		
</body>
</html>