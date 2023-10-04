<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width: 1100px;
		min-height:700px;
		margin:auto;
		padding:50px 0;
		position: relative;
	}
	h2{
		font-size: 25px;
		border-bottom: 3px solid #777;
		height: 60px;
	}
	table{
		width: 100%;
		border-spacing: 0;
		border-top: 2px solid #cecece;
		margin-bottom: 50px;
		font-size: 13px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding-left: 12px;
	}
	table caption{
	    margin-bottom: 10px;
	    font-size: 20px;
	    font-weight: bold;
	    color: #333;
	    text-align: left;
	}
	#table1{
		margin-top: 70px;
	}
	tr{
		height: 40px;
	}
	#table1 tr td:first-child,
	#table2 tr td:first-child,
	#table4 tr td:first-child {
		width: 110px;
		background: #f4f4f4;	
		font-weight: bold;
		color:#333;
	}
	.aa{
		font-size: 12px;
		color:#ff0025;
	}
	.h55{
		height: 55px!important;
	}
	input[type=text]{
		outline: none;
	    border: 1px solid #ddd;
	    height: 28px;
	    padding: 0 5px;
	    box-sizing: border-box;
	    width: 180px;
	}
	input[type=button]{
		height: 28px;
	    vertical-align: top;
	    border: 1px solid #ddd;
	    padding: 0 20px;
	    font-size: 12px;
	    cursor:pointer;
	}
	#table3 tr.cor {
		background: #f4f4f4;
	}
	.fwb{
		font-weight: bold;
	}
	.col8{
	    color: #888;
	    width: 230px;
	}
	.jukb{
		color: #888;
	    font-size: 12px;
	    margin-left: 5px;
	}
	#baeReq {
		position:absolute;
		top: 480px;
    	left: 250px;
		width:170px;
		background:#fff;
		font-size: 13px;
		visibility:hidden;
		border: 1px solid #eee;
    	padding: 10px;
	}
	#baeReq div {
		margin-top:3px;
	}
	.payment {
		display:none;
	}
	.payment:first-child {
		display:block;
	}
	#gumaebtn {
	   	width:500px;
	     height:40px;
		border:2px solid #2E9AFE;
		background:#2E9AFE;
	     color:white;
	     cursor:pointer;
	     border-radius:2px;
	     font-size:18px;
	     font-weight:900;
	     margin-top:40px;
	}
	#req{
		display: inline-block;
    	margin-top: 6px;
	}
	input[type=button].w100{
		margin-top: 10px;
    	width: 100%;
	}
	.line > div:nth-child(1) {
		width: 100%;
	    border-bottom: 1px solid #eee;
	    padding: 10px 0;
	}
	.line > div:nth-child(2){
		width: 100%;
    	padding: 10px 0;
	} 
	.payment .cc{
		margin-left: 10px;
		position: relative;
    	top: 2px;
	}
	.payment select{
		border: 1px solid #888;
	    width: 87px;
	    outline: none;
	    margin-left: 3px;
	    font-size: 13px;
	}
	#submit{
		height: 55px;
	    width: 260px;
	    border: 1px solid #ddd;
	    color: #fff;
	    background: #0073e9;
	    font-size: 15px;
	    font-weight: bold;
	    cursor: pointer;
	}
	#sel{
		margin-left: 10px;
	}
</style>
<script>
	function changePhone() {
		var phone=document.getElementById("myphone").value;
		var chk=new XMLHttpRequest();
		chk.onload=function() {
			alert(chk.responseText);
		}
		chk.open("get","chgPhone?phone="+phone);
		chk.send();
	}
	
	function baeOpen() {
		open("baelist","","width=400,height=500"); 
	}
	
	function chgPayment(n) {
		var pay = document.getElementsByClassName("payment");
		//다른것 숨기기
		for(i=0;i<pay.length;i++){
			pay[i].style.display="none";
		}
		//n에 해당하는 인덱스 보이게 하기
		pay[n].style.display="block";
	}
	
	function chgReq() {
		document.getElementById("baeReq").style.visibility="visible";
	}
	
	function setReq() { // baesong테이블에서 req를 변경
		//변경될 req, 변경할 레코드의 no
		var req=document.gform.req.value;
		var no=document.gform.baeno.value;
		var chk=new XMLHttpRequest();
		
		chk.onload=function() {
			if(chk.responseText==0){
				document.getElementById("req").innerText = document.getElementsByClassName("abc")[req].innerText;
				document.getElementById("baeReq").style.visibility ="hidden";
			}else{
				alert("오류");
			}
		}
		chk.open("get","setReq?req="+req+"&no="+no);
		chk.send();
		
	}
	
	function check() {
		
	}
</script>
</head>
<body>
	<section>
		<form name="gform" method="post" action="progumaeOk" onsubmit="return check(this)">
			<input type="hidden" name="pcode" value="${pcode}">
     		<input type="hidden" name="sus" value="${su}">
    		<!-- 배송요청사항 변경 레이어 -->
    		<div id="baeReq">
      			<div class="abc"><input type="radio" name="req" value="0">문 앞</div> 
      			<div class="abc"><input type="radio" name="req" value="1">직접 받고, 부재시 문 앞</div> 
      			<div class="abc"><input type="radio" name="req" value="2">경비실</div> 
      			<div class="abc"><input type="radio" name="req" value="3">택배함</div> 
      			<div align="center"><input type="button" class="w100" value="요청변경" onclick="setReq()"></div>
    		</div>
			<h2>주문/결제</h2>
			<!-- 구매자 정보 -->
			<table id="table1">
				<caption>구매자 정보</caption>
				<tr>
					<td>이름</td>
					<td>${mvo.name}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${mvo.email}</td>
				</tr>
				<tr class="h55">
					<td>전화번호</td>
					<td>
						<input type="text" value="${mvo.phone}" id="myphone">
						<input type="button" value="변경" onclick="chgPhone()">	
					</td>
				</tr>
			</table>
			<!-- 배송지 정보 -->
			<table id="table2">
				<caption>
					배송지 정보
					<input type="button" value="배송지변경" onclick="baeOpen()">
				<c:if test="${bvo==null}">
					<span class="aa">등록된 배송지가 없거나 등록된 주소가 없습니다.</span>
				</c:if>
				</caption>
				<tr>
					<td>이름</td>
					<td id="name">
						${bvo.name}
					<c:if test="${bvo.gibon==1}">
	      				<span id="gibon">기본배송지</span>
	      			</c:if>
					</td>
				</tr>
				<tr>
					<td >주소</td>
					<td id="juso">${bvo.juso},${bvo.jusoEtc}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td id="phone">${bvo.phone}</td>
				</tr>
				<tr>
					<td>배송 요청사항</td>
					<td>
						<span id="req">
						<c:if test="${bvo.req==0}">
							문 앞
						</c:if>
						<c:if test="${bvo.req==1}">
							직접 받고, 부재시 문 앞
						</c:if>
						<c:if test="${bvo.req==2}">
							경비실
						</c:if>
						<c:if test="${bvo.req==3}">
							택배함
						</c:if>
						</span>
						<input type="button" value="변경" onclick="chgReq()">
      					<input type="hidden" value="${bvo.no}" name="baeno" id="baeno"> <!-- 배송지테이블 no -->
					</td>
				</tr>
			</table>
			
			<!-- 구매 상품 -->
			<table id="table3">
				<caption>배송 정보</caption>
			<c:set var="sp" value="0"/><!-- 상품별가격 -->
			<c:set var="bsb" value="0"/><!-- 배송비 -->
			<c:set var="juk" value="0"/><!-- 적립금 -->
			<c:set var="cp" value="0"/><!-- 총금액 -->
			<c:set var="jukh" value=""/><!-- 상품별 적립금을 ,로 구분할 변수 -->
			<c:set var="chongprice" value=""/><!-- 상품별 결제금액을 ,로 구분할 변수 -->
			<c:forEach items="${plist}" var="pvo">
				<tr class="cor">
					<td colspan="2">
						<span class="fwb">${pvo.yoil}요일 ${pvo.writeday}</span> 도착 예정
					</td>
				</tr>
				<tr>
					<td>${pvo.title}</td>
					<td class="col8">
						수량 ${pvo.su}개 /
					<c:if test="${pvo.bprice==0}">
						무료배송
					</c:if>
					<c:if test="${pvo.bprice!=0}">
						<fmt:formatNumber value="${pvo.bprice}" type="number"/>원
					</c:if>
					</td>
				</tr>
				<c:set var="sp" value="${sp+(pvo.price-(pvo.price*pvo.halin/100))*pvo.su}"/>
				<c:set var="bsb" value="${bsb+pvo.bprice}"/>
				<c:set var="juk" value="${juk+pvo.price*(pvo.juk/100)}"/>
				<c:set var="cp" value="${cp+(pvo.price-(pvo.price*pvo.halin/100)*pvo.su)+pvo.bprice}"/>
				
				<c:set var="jukh" value="${jukh}${pvo.price*(pvo.juk/100)},"/>		
				<c:set var="chongprice" value="${chongprice}${(pvo.price-(pvo.price*pvo.halin/100)*pvo.su)+pvo.bprice},"/>		
			</c:forEach>
			</table>
			
			<input type="hidden" name="juks" value="${jukh}"><!-- 구매시 사용한 적립금 -->
     		<input type="hidden" name="chongprices" value="${chongprice}"/>
     		
			<!-- 결제 정보 -->
			<table id="table4">
				<caption>결제 정보</caption>
				<tr>
					<td>총상품가격</td> <!-- 할인율 포함 -->
					<td><span class="fwb"><fmt:formatNumber value="${sp}" type="number" pattern="#,###"/></span>원</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td><span class="fwb"><fmt:formatNumber value="${bsb}" type="number" pattern="#,###"/></span>원</td>
				</tr>
				<tr>
					<td>적립금</td>
					<td><span class="fwb"><fmt:formatNumber value="${juk}" type="number" pattern="#,###"/></span>원 <span class="jukb">적립예정</span></td>
				</tr>
				<tr>
					<td>총결제가격</td>
					<td><span class="fwb"><fmt:formatNumber value="${cp}" type="number" pattern="#,###"/></span>원</td>
				</tr>
				<tr>
					<td>결제방법</td>
					<td class="line">
						<div>
							<input type="radio" name="pay" value="0" checked onclick="chgPayment(0)">계좌이체
							<input type="radio" name="pay" value="1"onclick="chgPayment(1)">신용/체크카드
							<input type="radio" name="pay" value="2" onclick="chgPayment(2)">법인카드
							<input type="radio" name="pay" value="3" onclick="chgPayment(3)">휴대폰						
						</div>
						<div>
						<div class="payment">
							<span id="sel">* 은행선택</span>  
							<select name="bank">
								<option value="0">신한은행</option>
								<option value="1">농협은행</option>
								<option value="2">우리은행</option>
								<option value="3">하나은행</option>
								<option value="4">KB은행</option>
								<option value="5">한국은행</option>
							</select>
			          		<span class="cc"><input type="checkbox" checked value="0" name="sudan">기본 결제 수단으로 사용</span>
        				</div>
						<div class="payment">
							<span id="sel">* 카드선택</span> 
							<select name="card">
								<option value="0">신한카드</option>
								<option value="1">농협카드</option>
								<option value="2">우리카드</option>
								<option value="3">하나카드</option>
								<option value="4">KB카드</option>
								<option value="5">한국카드</option>
							</select>
							<span id="sel">* 할부기간</span> 
							<select name="halbu">
								<option value="0">일시불</option>
							    <option value="3">3개월</option>
							    <option value="6">6개월</option>
							    <option value="9">9개월</option>
							    <option value="12">12개월</option>
							</select>
							<span class="cc"><input type="checkbox" checked value="1" name="sudan">기본 결제 수단으로 사용</span>
						</div>
			            <div class="payment">
							<span id="sel">* 카드선택</span>  
							<select name="card">
								<option value="0">신한카드</option>
							    <option value="1">농협카드</option>
							    <option value="2">우리카드</option>
							    <option value="3">하나카드</option>
							    <option value="4">KB카드</option>
							    <option value="5">한국카드</option>
							</select>
							<span id="sel">* 할부기간</span>  
							<select name="halbu">
							   <option value="">일시불</option>
							</select>&nbsp;&nbsp;&nbsp;법인카드는 일시불 결제만 가능합니다.
							<span class="cc"><input type="checkbox" checked value="2" name="sudan">기본 결제 수단으로 사용</span>
			            </div>
						<div class="payment">
							<span id="sel">* 통신사 종류</span> 
							<select name="tongsin">
								<option value="0">SKT</option>
								<option value="1">KT</option>
								<option value="2">LG</option>
								<option value="3">그 외</option>
							</select>
							<span class="cc"><input type="checkbox" checked value="3" name="sudan">기본 결제 수단으로 사용</span>
						</div> 
						</div>
					</td>
				</tr>
			</table>
			<div align="center"><input type="submit" value="구매하기" id="submit"></div>
		</form>
	</section>
</body>
</html>