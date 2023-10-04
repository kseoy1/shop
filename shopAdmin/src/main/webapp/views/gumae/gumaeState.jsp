<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ include file="../top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width: 1100px;
		margin:auto;
		position: relative;
		margin-top:50px;
	}
	table{
		 width: 100%;
	    border-spacing: 0;
	    border-top: 2px solid #cecece;
	    margin-bottom: 50px;
	    font-size: 15px;
	}
	table tr{
		height: 50px;
		text-align: center;
	}
	table tr:first-child td{
		background: #eef1f8;
	}
	table tr td{
		border-bottom: 1px solid #ddd;
	}
	input{
		color: #333;
		background:#fff;
	    border: 1px solid rgb(221, 221, 221);
	    width: 100px;
	    height: 29px;
	    border-radius: 3px;
	    cursor:pointer;
	}
	input:disabled{
		background: #ddd;
		pointer-evente:none;
		cursor:default;
	}
</style>
<script>
	function getProduct(pcode){
		
		var x=event.pageX;
		var y=event.pageY;
		
		var chk=new XMLHttpRequest();
		
		chk.onload=function(){
			
			var data=JSON.parse(chk.responseText);
			
			document.getElementById("layer").style.visibility="visible";
			document.getElementById("layer").style.left=x+"px";
			document.getElementById("layer").style.top=y+"px";
			document.getElementById("layer").innerText=data.title;
		}
		
		chk.open("get","getProduct?pcode="+pcode);
		chk.send();
	}
	
	function getBaesong(no){
		
		var x=event.pageX;
		var y=event.pageY;
		var chk=new XMLHttpRequest();
		
		chk.onload=function(){
			
			var data=JSON.parse(chk.responseText);
			var juso=data.juso.substring(0,data.juso.indexOf(" "));
			var data=JSON.parse(chk.responseText);
			
			document.getElementById("layer").style.visibility="visible";
			document.getElementById("layer").style.left=(x-80)+"px";
			document.getElementById("layer").style.top=(y-20)+"px";
			document.getElementById("layer").innerText=juso;
		}
		
		chk.open("get","getBaesong?no="+no);
		chk.send();
	}
</script>
</head>
<body>
	<section>
		<table>
			<tr>
				<td width="150">상품코드</td>
				<td width="120">구매자</td>
				<td width="150">결제금액</td>
				<td width="70">수량</td>
				<td width="130">주문일</td>
				<td width="110">배송상태</td>
				<td>변경하기</td>
			</tr>
		<c:forEach items="${glist}" var="gvo">
			<tr>
				<td onclick="getProduct('${gvo.pcode}')">${gvo.pcode}</td>
				<td onclick="getBaesong('${gvo.baeno}')">${gvo.userid}</td>
				<td><fmt:formatNumber value="${gvo.chongprice}" type="number" pattern="#,###"/></td>
				<td>${gvo.su}</td>
				<td>${gvo.writeday}</td>				
				<td>
				<c:choose>
					<c:when test="${gvo.state==0}">
						[결제완료]
					</c:when>
					<c:when test="${gvo.state==1}">
						[배송중]
					</c:when>
					<c:when test="${gvo.state==2}">
						[배송완료]
					</c:when>
					<c:when test="${gvo.state==3}">
						[취소신청]
					</c:when>
					<c:when test="${gvo.state==4}">
						[취소완료]
					</c:when>
					<c:when test="${gvo.state==5}">
						[교환신청]
					</c:when>
					<c:when test="${gvo.state==6}">
						[교환완료]
					</c:when>		
					<c:when test="${gvo.state==7}">
						[반품신청]
					</c:when>
					<c:when test="${gvo.state==8}">
						[반품완료]
					</c:when>
					<c:otherwise>
						이상해요
					</c:otherwise>
				</c:choose>
				</td>
				<td>
				<c:if test="${gvo.state!=0}">
					<input type="button" value="배송중" disabled>
				</c:if>
				<c:if test="${gvo.state==0}">
					<input type="button" value="배송중" onclick="location='stateChange?state=1&no=${gvo.no}'">
				</c:if>
				<c:if test="${gvo.state!=1}">
					<input type="button" value="배송완료" disabled>
				</c:if>
				<c:if test="${gvo.state==1}">
					<input type="button" value="배송완료" onclick="location='stateChange?state=2&no=${gvo.no}'">
				</c:if>
				<c:if test="${!(gvo.state==3 || gvo.state==5 || gvo.state==7)}">
					<input type="button" value="승인하기" disabled>
				</c:if>
				<c:if test="${gvo.state==3 || gvo.state==5 || gvo.state==7}">
					<c:if test="${gvo.state==3}">
						<c:set var="aa" value="4"/>
						<c:set var="bb" value="취소"/>			
					</c:if>
					<c:if test="${gvo.state==5}">
						<c:set var="aa" value="6"/>
						<c:set var="bb" value="교환"/>
					</c:if>
					<c:if test="${gvo.state==7}">
						<c:set var="aa" value="8"/>
						<c:set var="bb" value="반품"/>
					</c:if>
					<input type="button" value="${bb}승인" onclick="location='stateChange?state=${aa}&no=${gvo.no}'">
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</table>
	</section>
</body>
</html>