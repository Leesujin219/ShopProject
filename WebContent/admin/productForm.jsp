<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
	function onOff(v,id){
 // ���� ��ư value �� ���� ��
 	if(v == "t"){
 		 document.getElementById(id).style.display = ""; // ������
 	}else{
 		 document.getElementById(id).style.display = "none"; // ����
 		}
	}

</script>

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


	<form method="post" name="inputform" action="productInput" enctype="multipart/form-data" >
	<input type="hidden" name="writerid" value="${writerid}">
	<input type="hidden" name="ip" value="${ip}">
	<table style="margin-left: 10%">
		<tr><td><h5><b>��ǰ���</b></h5></td></tr>
		<tr>
			<td class="tableline">��ǰ��</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="productname"></td>
		</tr>
		<tr>
			<td class="tableline">ī�װ�</td>	
			<td class="tableline">
				<select name="boardid">
					<option value="0">�����ϼ���
					<option value="1">���׸����ǰ
					<option value="2">����
					<option value="3">�ֹ��ǰ
					<option value="4">ħ����
				</select>
			</td>
		</tr>
		<tr>
			<td class="tableline">�ǸŰ���</td>
			<td class="tableline"><input type="text" size="30" maxlength="30" name="price"></td>
		</tr>
		<tr>
			<td class="tableline">��ۺ�</td>
			<td class="tableline">
			<input type="text" size="30" maxlength="30" name="shippingfee"></td>
		</tr>
		<tr>
			<td class="tableline">�Ǹ� ����</td>
			<td class="tableline">
			<input type="radio" name="exposure" value="t" >�Ǹ���&nbsp;
			<input type="radio" name="exposure" value="f" checked="checked">�Ǹ�����</td>
		</tr>
		<tr>
			<td class="tableline">Home ����</td>
			<td class="tableline">
			<input type="radio" name="home" value="t" checked="checked">����&nbsp;
			<input type="radio" name="home" value="f">�������� ����</td>
		</tr>
		<tr>
			<td class="tableline">New ����</td>
			<td class="tableline">
			<input type="radio" name="newpage" value="t" checked="checked">����&nbsp;
			<input type="radio" name="newpage" value="f">�������� ����</td>
		</tr>
		<tr>
			<td class="tableline">Sale ����</td>
			<td class="tableline">
			<input type="radio" name="sale" value="t" onclick="onOff(this.value,'con')">����&nbsp;
			<input type="radio" name="sale" value="f" checked="checked" onclick="onOff(this.value,'con')">�������� ����</td>
		</tr>
		<tr id="con" style="display: none">
			<td class="tableline" >������</td>
			<td class="tableline" ><input type="text" size="30" maxlength="10" name="salepercent"></td>
			<td class="tableline" >���εȱݾ�</td>
			<td class="tableline" ><input type="text" size="30" maxlength="10" name="saleprice"></td>
		</tr>
		<tr>
			<td class="tableline">����� ���</td>
			<td class="tableline">
				 <input type="file" size="40" maxlength="30" name="thumbnail" >
			</td>
		</tr>
			<tr>
			<td class="tableline">��ǰ���� ���</td>
			<td class="tableline">
				 <input type="file" size="40" maxlength="30" name="filename1" ><br>
				 <input type="file" size="40" maxlength="30" name="filename2" ><br>
				 <input type="file" size="40" maxlength="30" name="filename3" ><br>
				 <input type="file" size="40" maxlength="30" name="filename4" >

			</td>
		</tr>
		<tr>
			<td class="tableline">��ǰ����</td>
			<td class="tableline">
				<textarea name="content" rows="14" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="�۾���" >  
	 			<input type="reset" value="�ٽ��ۼ�">
	 			<input type="button" value="��Ϻ���" OnClick="window.location='productList'">
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>