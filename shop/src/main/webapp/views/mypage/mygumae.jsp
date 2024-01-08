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
	section {
	    width:1100px;
	    margin:auto;
	    padding:80px 0;
	    color:#666;
	}
	h2{
		color:#333!important;
		margin-bottom: 50px;
	}
	.conWrap{
		width: 100%;
	    border-radius: 12px;
	    box-shadow: rgba(0, 0, 0, 0.08) 0px 2px 4px 0px, rgba(0, 0, 0, 0.16) 0px 0px 1px 0px;
	    background-color: rgb(255, 255, 255);
	    margin-bottom: 30px;
	    padding: 24px 24px 16px;
	}
	.aa{
		color:#333;
	    font-weight: bold;
	    font-size: 18px;
	}
	.juCon{
		border-radius: 8px;
	    border: 1px solid rgb(238, 238, 238);
	    background-color: rgb(255, 255, 255);
	    margin-top: 16px;
	    padding:20px;
	    display:flex;
	}
	.con{
		display: flex;
	}
	.con1{
		width: 130px;
	}
	.con1 img{
		width: 110px;
	    height: 100px;
	    object-fit: contain;
	    padding: 10px 0;
	}
	.con2{
		margin-left: 20px;
    	padding: 25px 0;
    	width: 803px;
	}
	.con2 > div{
		font-size: 17px;
    	margin-bottom: 15px;
	}
	.btime{
		color: rgb(0, 140, 0);
		font-size: 17px;
    	margin-bottom: 10px;
	}
	.title{
		color:#333;
	}
	.state{
		font-weight: bold;
		color:#333;
		font-size: 18px;
    	margin-right: 10px;
	}
	.price{
		font-size: 14px;
	}
	.btn input{
		color: #333;
		background:#fff;
	    border: 1px solid rgb(221, 221, 221);
	    width: 100px;
	    height: 29px;
	    border-radius: 3px;
	    cursor:pointer;
	    margin-bottom: 5px;
	}
	.btn input:last-child{
		margin-bottom: 0;
	}
	.btn input:disabled{
		background: #ddd;
		pointer-evente:none;
		cursor:default;
	}
</style>
</head>
<body>
	<section>
	<h2>주문목록</h2>
	<c:forEach items="${mapall}" var="map">
		<div class="conWrap">
			<div class="aa">${map.writeday}주문</div>
			<div class="juCon">
				<div class="left">		
					<div class="btime">
						<span class="state"><!-- state관련 내용출력 -->
					<c:choose>
						<c:when test="${map.state==0}">
							결제완료
						</c:when>
						<c:when test="${map.state==1}">
							배송중
						</c:when>
						<c:when test="${map.state==2}">
							배송완료
						</c:when>
						<c:when test="${map.state==3}">
							취소신청
						</c:when>
						<c:when test="${map.state==4}">
							취소완료
						</c:when>
						<c:when test="${map.state==5}">
							교환신청
						</c:when>
						<c:when test="${map.state==6}">
							교환완료
						</c:when>		
						<c:when test="${map.state==7}">
							반품신청
						</c:when>
						<c:when test="${map.state==8}">
							반품완료
						</c:when>
						<c:otherwise>
							이상해요
						</c:otherwise>
					</c:choose>
					</span>
					${map.baeday}(${map.yoil}) 도착
					</div>
					<div class="con">
						<div class="con1"><img src="/static/pro/${map.pimg}"></div>		
						<div class="con2">
							<div class="title">${map.title}</div>
							<span class="price">
							<fmt:formatNumber value="${map.price-(map.price*map.halin/100)}" type="number" pattern="#,###"/>원 &nbsp;&nbsp;${map.su}개
							</span>
						</div>										
					</div>
				</div>		
				<div class="right">
					<div class="btn">
					<c:if test="${map.state!=0}">
						<input type="button" value="취소신청" disabled><br>
					</c:if>
					<c:if test="${map.state==0}">
						<input type="button" value="취소신청" onclick="location='stateChange?state=3&no=${map.no}'"><br>
					</c:if>
					
					<c:if test="${map.state!=1 && map.state!=2}">
						<input type="button" value="교환신청" disabled><br>
					</c:if>
					<c:if test="${map.state==1 || map.state==2}">
						<input type="button" value="교환신청" onclick="location='stateChange?state=5&no=${map.no}'"><br>
					</c:if>
					
					<c:if test="${map.state!=2}">
						<input type="button" value="반품신청" disabled><br>
					</c:if>
					<c:if test="${map.state==2}">
						<input type="button" value="반품신청" onclick="location='stateChange?state=7&no=${map.no}'"><br>
					</c:if>
					
					<c:if test="${!(map.state==3 || map.state==5 || map.state==7)}">
						<input type="button" value="신청취소" disabled><br>
					</c:if>
					<c:if test="${map.state==3 || map.state==5 || map.state==7}">
						<c:if test="${map.state==3}">
							<c:set var="aa" value="0"/>
						</c:if>
						<c:if test="${map.state!=3}">
							<c:set var="aa" value="2"/>
						</c:if>
							<input type="button" value="신청취소" onclick="location='stateChange?state=${aa}&no=${map.no}'"><br>
					</c:if>
					
					<c:if test="${map.state!=2 || map.sangp==1}">
						<input type="button" value="상품평" disabled>
					</c:if>
					<c:if test="${map.state==2 && map.sangp==0}">
						<input type="button" value="상품평" onclick="location='review?pcode=${map.pcode}&gumaeno=${map.no}'">
					</c:if>		
				 	
					</div>
				</div>
			</div>
		</div> 
	</c:forEach> 
	</section>
</body>
</html>