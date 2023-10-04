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
		margin:auto;
		padding:50px 0;
	}
	#content{
		display: flex;
	    justify-content: space-between;
	}
	#content > div{
		border:1px solid;
	}
	#content #left{
		width: 550px;
		border: 1px solid #c7c7c7;;
	}
	#content #left img{
		width: 100%;
	    height: 430px;
	    object-fit: contain;
	    box-sizing: border-box;
    	padding: 10px;
	}
	#content #right{
		width: 500px;
		padding: 20px;
    	box-sizing: border-box;
    	border: 1px solid #c7c7c7;;
	}
	#right .title{
		font-size: 18px;
    	font-weight: bold;
    	margin-bottom: 20px;
	}
	.star img{
		width: 20px;
		margin-right: -4px;
	}
	.star span{
		color:#346aff;
		font-size:13px;
		margin-left: 10px;
    	font-weight: bold;
	}
	.price{
    	color: #111;
    	font-size:20px;
    	margin-top: 10px;
    	border-top: 1px solid #eee;
    	border-bottom: 1px solid #eee;
    	padding: 10px 0;
	}
	.price s{
		color:#888;
	}
	.price > span{
	    font-size: 25px;
	    color: #cb1400;
	    font-weight: bold;
	    padding-top: 2px;
    	display: block;
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
	    line-height: 17px;
	    margin-bottom: 5px;
	}
	.juk img{
		width:12px;
	    margin-right: 7px;
	    position: relative;
	    top: 2px;
	}
	.baesong{
		color: #333;
	    font-size: 15px;
	    margin: 7px 0;
		font-weight: bold;
	}
	.yoil{
		color: #00891a;
		margin-left: 10px;
	}
	#comp{
		font-size: 14px;
	}
	#su{
		margin-top:10px;
	}
	#suouter{
		display: flex;
	    justify-content: space-between;
	    width: 90px;
	    height: 45px;
	    border: 1px solid #eee;
	    box-sizing: border-box;
	}
	#suouter .lf{
		width: 67px;
    	border-right: 1px solid #eee;
	}
	#suouter input{
	    width: 58px;
	    border: none;
	    height: 40px;
	    outline: none;
	    text-align: center;
        font-size: 16px;
	    font-weight: bold;
	    margin-top: 1px;
	}
	#suouter .ri{
		width: 23px;
		border-left: 1px solid #eee;
		border-right: 1px solid #eee;
	}
	#suouter .ri img{
		height: 22px;
    	width: 100%;
    	cursor: pointer;
	}
	#suouter .ri img:last-child {
		position: relative;
	    top: -6px;
	    border-top: 1px solid #eee;
	}
</style>
<script>
	function add(){
		var su=parseInt(document.pform.su.value);
		document.pform.su.value=su+1;
		total(su+1);
	}
	function sub(){
		var su=parseInt(document.pform.su.value);
		if(su>1){
			document.pform.su.value=su-1;
			total(su-1);
		}
	}
	function total(n){
		document.getElementById("cntprice").innerText=comma(${pvo.price}*n)+"원";
		document.getElementById("halprice").innerText=comma(${pvo.price-(pvo.price*(pvo.halin)/100)}*n)+"원";
		document.getElementById("juk").innerText=comma(${pvo.price*(pvo.juk/100)+100}*n);
	}
	function comma(num){
   		return new Intl.NumberFormat().format(num);
    }
</script>
</head>
<body>
	<section>
		<form method="post" action="progumae" name="pform">
			<div id="content">
				<div id="left">
					<img src="/static/pro/${pvo.pimg}">
				</div>
				<div id="right">
					<div class="title">${pvo.title}</div>
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
					</c:forEach> <!-- 별점 끝 -->
						<span>${pvo.review}개의 상품평</span>
					</div>
					<div class="price">
						${pvo.halin}% <s id="cntprice"><fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원</s><br>
						<span id="halprice"><fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" type="number" pattern="#,###"/>원</span>
						<div class="juk"> <!-- 적립금: 상품평쓰기 100원 -->
							<img src="/static/product/cash_icon.png"><span id="juk"><fmt:formatNumber value="${pvo.price*(pvo.juk/100)+100}" type="number" pattern="#,###"/></span>원 적립
						</div>
					</div>
					<div class="baesong"><!-- 배송비, 도착예정 -->
					<c:if test="${pvo.bprice==0}">
						<span class="mubae">무료배송</span>
					</c:if>
					<c:if test="${pvo.bprice!=0}">
						<span class="bae">배송비: <fmt:formatNumber value="${pvo.bprice}" type="number" pattern="#,###"/></span>원
					</c:if>
						<span class="yoil">
							${pvo.writeday}(${pvo.yoil}) 도착 예정				
						</span>
					</div>
					<div id="comp">
						제조회사: ${comp}
					</div>
					<div id="su">
						<div id="suouter">
							<div class="lf">
								<input type="text" name="su" value="1" readonly>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>