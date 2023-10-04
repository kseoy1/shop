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
	#sectionTop{
		font-weight: bold;
	    color: #333;
	    padding-bottom: 30px;
	    font-size: 14px;
	    cursor:default;
	}
	#order span{
		font-weight: bold;
	    color: #555;
	    padding-bottom: 30px;
	    font-size: 14px;
	    display: inline-block;
	    cursor: pointer;
	}
	section{
		width: 1100px;
		margin:auto;
		padding:50px 0;
	}
	section #proWrap{
		width: 100%;
	    height: 100%;
	    display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    flex-wrap: wrap;
	}
	.pro{
		width: 255px;
    	height: 405px;
		margin-bottom: 30px;
		margin-right: 26px;
		box-shadow: 0 0 20px 0 rgba(0,0,0,0.1);
		cursor:pointer;
	}
	.pro > div{
		padding: 0 10px;
	}
	.pro:nth-child(4n){
		margin-right: 0;
	}
	.pro > img{
		width: 100%;
	    height: 170px;
	    object-fit: contain;
	    border-bottom:1px solid #f5f5f5;
	    margin-top: 10px;
	    padding-bottom: 10px;
	}
	.mba{
		font-size: 12px;
   		margin-top: 10px;
   		color:#555;
	}
	.tit{
		padding:0;
		margin: 3px 0;
		font-size: 15px;
		width: 235px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    height: 40px;
	}
	.pri{
		font-size:13px;
		font-weight: bold;
	}
	.pri .hal{
		margin-right: 5px;
		color:#111;
	}
	.pri .hpri{
		color:#888;
		text-decoration: line-through;
	}
	.bpri{
		color: #cb1400;
		font-weight: bold;
		margin: 5px 0;
	}
	.yoil{
		font-size: 14px;
	}
	.star{
		letter-spacing: -4px;
		margin: 5px 0;
	}
	.star img{
		width:15px;
	}
	.juk{
		box-sizing: border-box;
	    display: inline-block;
	    padding: 0 8px;
	    height: 20px;
	    border-radius: 10px;
	    border: solid 1px #ccc;
	    background-color: #fff;
	    font-size: 11px;
	    margin-left: 10px;
	    line-height: 17px;
	}
	.juk img{
		width:12px;
	    margin-right: 7px;
	    position: relative;
	    top: 2px;
	}
	#pagechul{
		width: 1100px;
		height: 80px;
		line-height: 80px;
		text-align: center;
	}
	#pagechul a{
		width: 25px;
		display: inline-block;
	}
	.ncur{
		cursor: default;
		height: 100%;
	    display: inline-block;
	}
</style>
<script>
	function listChange(num){
		location="prolist?pcode=${pcode}&num="+num;
	}
	window.onload=function(){
		document.getElementsByClassName("or")[${num}-1].style.color="#0073e9";
	}
</script>
</head>
<body>
	<section>
		<div id="sectionTop">
			${sectiontop}
		</div>
		<div id="order">
			<span class="or" id="lprice" onclick="listChange(1)">낮은가격순&nbsp;&nbsp;</span>
			<span class="or" id="hprice" onclick="listChange(2)">높은가격순&nbsp;&nbsp;</span>
			<span class="or" id="pansu" onclick="listChange(3)" class="on">판매량순&nbsp;&nbsp;</span>
			<span class="or" id="new" onclick="listChange(4)">최신순</span>
		</div>
		<div id="proWrap">
		<c:forEach items="${plist}" var="pvo">
			<div class="pro" onclick="location='procontent?pcode=${pvo.pcode}'">
				<img src="/static/pro/${pvo.pimg}">
				<div class="mba">
				<c:if test="${pvo.bprice==0}">
					무료배송
				</c:if>
				<c:if test="${pvo.bprice!=0}">
					　
				</c:if>
				</div>			
				<div class="tit">${pvo.title}</div>
				<div class="pri">
				<c:if test="${pvo.halin!=0}">
					<span class="hal">${pvo.halin}%</span>
					<span class="hpri"><fmt:formatNumber value="${pvo.price}" type="number"/></span>
				</c:if>
				</div>
				<div class="bpri"> <!-- 판매가격: 상품가격-(상품가격*(할인율/100)) -->
				<fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" type="number"/>원
				</div>
				<div class="yoil">
					${pvo.writeday}(${pvo.yoil}) 도착 예정
				</div>
				<div class="star"> <!-- 별점(double형) -->
				<!-- 노란별 -->
				<c:forEach begin="1" end="${pvo.ystar}">
					<img src="/static/product/star1.png">
				</c:forEach>
				<!-- 반별 -->
				<c:if test="${pvo.banstar==1}">
					<img src="/static/product/star3.png">
				</c:if>
				<!-- 회색별 -->
				<c:forEach begin="1" end="${pvo.gstar}">
					<img src="/static/product/star2.png">
				</c:forEach>
				</div>
				<div class="juk"> <!-- 적립금: 상품평쓰기 100원 -->
					<img src="/static/product/cash_icon.png"><fmt:formatNumber value="${pvo.price*(pvo.juk/100)+100}" type="number" pattern="#,###"/>원 적립
				</div>
			</div>
		</c:forEach>
		</div>
		<div id="pagechul">
		<c:if test="${pstart!=1}">
            <a href="prolist?&page=${pstart-1}&pcode=${pcode}"> << </a>
       	</c:if>
       	<c:if test="${pstart==1}">  
            <span class="ncur"><<</span>
        </c:if>
        <c:if test="${page!=1}">
            <a href="prolist?page=${page-1}&pcode=${pcode}"> < </a>
        </c:if>
        <c:if test="${page==1}"> 
        	<span class="ncur"><</span>
        </c:if>
        
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
            	<a href="prolist?page=${i}&pcode=${pcode}" style="color:#cb1400">${i}</a>
            </c:if>
            <c:if test="${page!=i}"> 
                <a href="prolist?page=${i}&pcode=${pcode}">${i}</a>
            </c:if> 
		</c:forEach>
		
		<c:if test="${page!=chong}">
        	<a href="prolist?page=${page+1}&pcode=${pcode}"> > </a>
        </c:if>
        <c:if test="${page==chong}">  
            <span class="ncur">></span>
        </c:if>
		<c:if test="${pend!=chong}">  
            <a href="prolist?page=${pend+1}&pcode=${pcode}" style="color:#cb1400"> >> </a>
        </c:if>
        <c:if test="${pend==chong}">  
            <span class="ncur">>></span>
        </c:if>  
		</div>
	</section>
</body>
</html>