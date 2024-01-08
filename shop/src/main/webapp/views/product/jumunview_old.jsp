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
  	#title {
		height:80px;
		line-height:80px;
		text-align:center;
		font-size:16px;
		font-weight:900;
	}
	table{
		width: 100%;
		border-spacing: 0;
		border-top: 2px solid #cecece;
		margin-bottom: 50px;
		font-size: 13px;
	}
	table caption{
		margin-bottom: 20px;
	    font-size: 20px;
	    font-weight: bold;
	    color: #333;
	    text-align: left;
	}
	#table1 tr{
    	height: 100px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding-left: 12px;
		box-sizing: border-box;
	}
	#table1 tr td:nth-child(1){
		width: 140px;
    	padding-left: 0;
	}
	#table1 img{
		width: 100%;
		padding:10px;
		object-fit:contain;
		box-sizing: border-box;
	}
	#table1 tr.h40{
		height: 40px;
	}
	#table1 tr.h40 td{
		padding-left: 10px;
		background: #f4f4f4;
		font-size: 13px;
		font-weight: bold;
	}
	.pcontent{
	 	padding: 10px;
	}
	.pcontent > div{
		margin-bottom: 6px;
		font-size: 14px;
	}
	.pcontent > div:last-child {
		margin-bottom: 0;
	}
	#chg {
	    font-size: 12px;
	    color: #cb1400;
	    cursor: pointer;
    }
    .btn1{
		height: 55px;
	    width: 260px;
	    border: 1px solid #0073e9;
	    color: #0073e9;
	    background: #fff;
	    font-size: 15px;
	    font-weight: bold;
	    cursor: pointer;
    }
    .btn2{
    	height: 55px;
	    width: 260px;
	    border: 1px solid #ddd;
	    color: #fff;
	    background: #0073e9;
	    font-size: 15px;
	    font-weight: bold;
	    cursor: pointer;
    }
    #table2 tr{
    	height: 40px;
    }
    .tac{
    	text-align: center;
	    font-size: 13px;
	    font-weight: bold;
	    background: #f4f4f4;
    }
    .w100{
    	width: 100px;
    	box-sizing: border-box;
    }
    #table2 tr td:nth-child(1),
    #table2 tr td:nth-child(4){
	    background: #f4f4f4;	
	}
	#table2 tr td:nth-child(3){
		border-right: 1px solid #ddd;
	}
	#bottom{
		text-align: center;
	}
</style>
</head>
<body>
	<section>
		<div id="title">※주문이 완료되었습니다. 감사합니다.※</div>
	    <table id="table1">
			<caption>상품배송정보</caption>
			<c:set var="happrice" value="0"/>
			<c:set var="baeprice" value="0"/>
			<c:forEach items="${plist}" var="pvo">
			<tr class="h40">
				<td colspan="2">${pvo.writeday}(${pvo.yoil}) 도착예정(상품 1개) </td>
			</tr>
	      	<tr>
	        	<td>
	        		<img src="/static/pro/${pvo.pimg}"> 
	        	</td>
	        	<td class="pcontent">  
		            <div class="a1">${pvo.title}</div>
		            <div class="a2">
			            <fmt:formatNumber value="${pvo.price}"/>원
			            <span id="chg">(할인율:${pvo.halin}%)</span>
		            </div>
		            <div class="a3">수량:${pvo.su}개</div>
	        	</td>
			</tr>
			<c:set var="happrice" value="${happrice+pvo.price}"/>
			<c:set var="baeprice" value="${baeprice+pvo.bprice}"/>
			</c:forEach>
		</table>
	    <!-- 받는사람, 결제정보 -->
	    <table id="table2">
		    <caption>받는사람/결제 정보</caption>
			<tr>
				<td class="w100">받는사람</td>
				<td>${bvo.name} / ${bvo.phone}</td>
				<td></td>
				<td class="w100" id="ctd">주문금액</td>
				<td width="440"> 
					<fmt:formatNumber value="${happrice}"/>원 
				</td>
			</tr>
			<tr>
				<td>받는주소</td>
				<td>${bvo.zip} ${bvo.juso} ${bvo.jusoEtc}</td>
				<td align="center"> <span id="chg">변경하기</span></td>
				<td id="ctd">배송비</td>
				<td><fmt:formatNumber value="${baeprice}"/>원</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${bvo.phone}</td>
				<td align="center"><span id="chg">변경하기</span></td>
				<td id="ctd">결제금액</td>
				<td style="color:red;font-size:15px;"><fmt:formatNumber value="${happrice+baeprice}"/>원</td>
			</tr>
    	</table>
		<div id="bottom">
			<input type="button" value="주문 내역보기" class="btn1">
    		<input type="button" value="계속 쇼핑하기" class="btn2">
  		</div>
	</section>
</body>
</html>





