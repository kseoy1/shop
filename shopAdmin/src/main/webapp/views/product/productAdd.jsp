<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ include file="../top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table tr{
		height: 40px;
	}
	table select{
		width: 100px;
		height: 30px;
		outline:none;
	}
</style>
<script>
	function getJung(dae){
		
		var chk=new XMLHttpRequest();
		
		chk.onload=function(){
			
			//alert(chk.responseText);
			document.pform.jung.innerHTML=chk.responseText;
			
			//소분류의 option태그를 비워둔다
			document.pform.so.innerHTML="<option>소분류</option>";
		}
		
		chk.open("get","getJung?dae="+dae);
		chk.send();
	}
	function getSo(jung){
		
		var dae=document.pform.dae.value;
		var daejung=dae+jung;
		
		var chk=new XMLHttpRequest();
		
		chk.onload=function(){
			
			document.pform.so.innerHTML=chk.responseText;
		}
		
		chk.open("get","getSo?daejung="+daejung);
		chk.send();
	}
	function makePcode(){
		
		//대,중,소,제조회사 코드를 연결한 후 앞에 'p'를 붙인다
		var dae=document.pform.dae.value;
    	var jung=document.pform.jung.value;
    	var so=document.pform.so.value;
    	var comp=document.pform.comp.value;
    	var pcode="p"+dae+jung+so+comp;
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function(){
    		document.pform.pcode.value=chk.responseText;
    	}
    	chk.open("get","getPcode?pcode="+pcode);
    	chk.send();
	}
</script>
</head>
<body>
	<section>
		<form name="pform" method="post" action="productAddOk" enctype="multipart/form-data">
			<table width="800" align="center">
				<caption><h3>상품입력</h3></caption>
				<tr>
					<td>상품코드</td>
					<td>
						<input type="text" name="pcode" readonly> 
						<select name="dae" onchange="getJung(this.value)">
							<option>대분류</option>
						<c:forEach items="${list}" var="dvo">
							<option value="${dvo.code}">${dvo.name}</option>
						</c:forEach>
						</select>
						<select name="jung" onchange="getSo(this.value)">
							<option>중분류</option>
						</select>
						<select name="so">
							<option>소분류</option>
						</select>
						<select name="comp" onchange="makePcode()">
							<option>제조회사</option>
						<c:forEach items="${clist}" var="cvo">
							<option value="${cvo.code}">${cvo.name}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="pimg"></td>
				</tr>
				<tr>
					<td>상품 상세정보</td>
					<td><input type="file" name="dimg"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>할인율</td>
					<td><input type="text" name="halin"></td>
				</tr>
				<tr>
					<td>입고수량</td>
					<td><input type="text" name="su"></td>
				</tr>
				<tr>
					<td>배송가격</td>
					<td><input type="text" name="bprice"></td>
				</tr>
				<tr>
					<td>배송기간</td>
					<td><input type="text" name="btime"></td>
				</tr>
				<tr>
					<td>적립율</td>
					<td><input type="text" name="juk"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="상품등록">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>