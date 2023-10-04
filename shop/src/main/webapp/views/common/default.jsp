<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:0;
		padding:0;
		overflow-x: hidden;
	}
	a{
		text-decoration: none;
		cursor:pointer;
		color:#000;
	}
	ul,li{
		list-style: none;
	}
	#first{
		width:100%;
		height:35px;
		line-height:35px;
		cursor:default;
		background:#bfb29f;
		color:#fff;
	}
	#first #outer{
		width:1100px;
		height:35px;
		margin:auto;
	}
	#first #left{
		display:inline-block;
		width:1060px;
		height:35px;
		text-align:center;
		font-size: 13px;
		font-weight: bold;
	}
	#first #right{
		display:inline-block;
		width:34px;
		height:35px;
		text-align:right;
		cursor:pointer;
	}
	header {
        width:1100px;
        height:60px;
        line-height:60px;
        margin:auto;
        display:flex;
	    align-item:center;
		justify-content: space-between;
		font-size:14px;
    }
    header #left {
      width:200px;
    }
    header #middle{
    	width:600px;
    }
    header #right {
        width:430px;
        text-align:right;
    }
    header #right span,
    header #right a{
    	width:70px;
    	text-align: right;
    	display: inline-block;
    	cursor: pointer;
    }
    header #right a.carta{
    	width: 39px;
    }
    .cart{
    	width: 25px;
	    position: relative;
	    top: 5px;
    }
	nav{
		width:1100px;
		height:60px;
		line-height:60px;
		margin:auto;	
		border-bottom: 1px solid #eee;
	}
	nav > ul{
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    margin: 0;
	    padding: 0;
	}
	nav #main > li{
		display:inline-block;
		font-size: 15px;
	    font-weight: bold;
	    color: #333;
	    padding: 0 20px;
    	cursor: pointer;
	}
	#main #all{
		position: relative;
	}
	.dae{
		position: absolute;
	    padding: 0;
	    width: 135px;
	    text-align: left;
	    background: #fff;
	    left: 0;
    	text-align: center;
    	visibility: hidden;
    	height:270px;
    	background: #f8f5f0;
    	z-index: 99;
	}
	.dae > li{
	    width: 100%;
	    height: 35px;
	    line-height: 35px;
	}
	.jung{
		position: absolute;
	    top: 0;
	    left: 135px;
	    width: 135px;
	    background: #fff;
	    visibility: hidden;
	    padding:0;
	    height:270px;
	    background: #f8f5f0;
	}
	.so{
		position: absolute;
	    top: 0;
	    left: 135px;
	    width: 135px;
	    background: #fff;
	    visibility: hidden;
	    padding:0;
	    height:270px;
	    background: #f8f5f0;
	}
	footer{
	    width: 100%;
	    margin: auto;
	    padding: 0 20px;
	    background: #f6f6f6;
	    border-top: 1px solid #e9e9e9;
	    margin-top: 30px;
	}
	#footer{
		width: 1100px;
	    margin: auto;
	    padding: 30px 0;
	}
	#footer p{
		font-size: 13px;
    	text-align: center;
    	color:#555;
	}	
	#footer p span{
		display: inline-block;
    	width: 20px;
	}
	#footer > span{
		text-align: center;
	    display: block;
	    font-size: 12px;
	}
	#mypage{
		width:86px!important;
		position: relative; 
	}
	#mypagemenu{
	    position: absolute;
	    top: 33px;
	    left: 8px;
	    padding: 0;
	    text-align: center;
	    width: 100%;
	    background: #fff;
	    border: 1px solid #ddd;
	    visibility: hidden;
	}
	#mypagemenu li{
		border-bottom: 1px solid #ddd;
	    height: 30px;
	    line-height: 30px;
	}
	#mypagemenu li a{
		width: 100%;
		height: 100%;
		cursor: pointer;
		text-align: center;
	}
	#mypagemenu li:last-child{
		border-bottom: none;
	}
	.crn{
		cursor:default!important;
	}
	.w57{
		width: 57px!important;
	}
</style>
<script>
	function daeview(){
		document.getElementsByClassName("dae")[0].style.visibility="visible";
	}
	function daehide(){
		document.getElementsByClassName("dae")[0].style.visibility="hidden";
	}
	function jungview(n){
		document.getElementsByClassName("jung")[n].style.visibility="visible";
	}
	function junghide(n){
		document.getElementsByClassName("jung")[n].style.visibility="hidden";
	}
	function soview(n){
		document.getElementsByClassName("so")[n].style.visibility="visible";
	}
	function sohide(n){
		document.getElementsByClassName("so")[n].style.visibility="hidden";
	}
	function viewMypage(){
		document.getElementById("mypagemenu").style.visibility="visible";
	}
	function hideMypage(){
		document.getElementById("mypagemenu").style.visibility="hidden";
	}
</script>
<sitemesh:write property="head"/>
</head>
<body>
	<div id="first">
		<div id="outer">
			<div id="left">회원가입 후 첫 구매고객 이벤트 99% 할인해 드립니다.</div>
			<div id="right">X</div>		
		</div>
	</div>
	<header>
		<div id="left"><a href="/main/main">로고</a></div>
		<div id="middle">검색창</div>
		<div id="right">
		<c:if test="${userid==null}">
			<a href="../product/cartView" class="carta"><img src="/static/product/cart.png" class="cart"></a>
			<a href="../member/login" class="w57">로그인</a>
			<a href="../member/member">회원가입</a>
		</c:if>
		<c:if test="${userid!=null}">
			<span class="crn">${name}님</span>
			<a href="../product/cartView" class="carta"><img src="/static/product/cart.png" class="cart"></a>
			<a href="../member/logout">로그아웃</a>
			<span id="mypage" onmouseover="viewMypage()" onmouseout="hideMypage()"><!-- 회원정보,구매내역,나의글,찜리스트 -->
				마이페이지
				<ul id="mypagemenu">
					<li><a href="../mypage/myinfo">회원정보</a></li>
					<li><a href="../mypage/mygumae">구매내역</a></li>
					<li><a href="../mypage/mylist">나의글</a></li>
					<li><a href="../product/jjimView">찜확인</a></li>
				</ul>
			</span>
		</c:if>
			<a href="../mypage/mtm">고객센터</a>
		</div>
	</header>
	<nav>
		<ul id="main">
			<li id="all" onmouseover="daeview()" onmouseout="daehide()">
				전체 카테고리
				<ul class="dae">
					<li onmouseover="jungview(0)" onmouseout="junghide(0)">
						<a href="../product/prolist?pcode=p01">가전제품</a>
						<ul class="jung">
							<li onmouseover="soview(0)" onmouseout="sohide(0)">
								<a href="../product/prolist?pcode=p0101">TV</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p010101">대형TV</a></li>
									<li><a href="../product/prolist?pcode=p010102">중형TV</a></li>
									<li><a href="../product/prolist?pcode=p010103">소형TV</a></li>
									<li><a href="../product/prolist?pcode=p010104">휴대용TV</a></li>
								</ul>
							</li>
							<li onmouseover="soview(1)" onmouseout="sohide(1)">
								<a href="../product/prolist?pcode=p0102">냉장고</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p010201">양문형 냉장고</a></li>
									<li><a href="../product/prolist?pcode=p010202">김치 냉장고</a></li>
									<li><a href="../product/prolist?pcode=p010203">와인 냉장고</a></li>
									<li><a href="../product/prolist?pcode=p010204">소형 냉장고</a></li>
								</ul>
							</li>
							<li onmouseover="soview(2)" onmouseout="sohide(2)">
								<a href="../product/prolist?pcode=p0103">세탁기</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p010301">드럼세탁기</a></li>
									<li><a href="../product/prolist?pcode=p010302">일반세탁기</a></li>
									<li><a href="../product/prolist?pcode=p010303">미니세탁기</a></li>
									<li><a href="../product/prolist?pcode=p010304">건조기</a></li>
								</ul>
							</li>
							<li onmouseover="soview(3)" onmouseout="sohide(3)">
								<a href="../product/prolist?pcode=p0104">컴퓨터</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p010401">데스크탑</a></li>
									<li><a href="../product/prolist?pcode=p010402">노트북</a></li>	
									<li><a href="../product/prolist?pcode=p010403">서버</a></li>
									<li><a href="../product/prolist?pcode=p010404">미니PC</a></li>
								</ul>
							</li>
							<li onmouseover="soview(4)" onmouseout="sohide(4)">
								<a href="../product/prolist?pcode=p0105">청소기</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p010501">유선청소기</a></li>
									<li><a href="../product/prolist?pcode=p010502">무선청소기</a></li>
									<li><a href="../product/prolist?pcode=p010503">휴대용청소기</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li onmouseover="jungview(1)" onmouseout="junghide(1)">
						<a href="../product/prolist?pcode=p02">패션</a>
						<ul class="jung">
							<li onmouseover="soview(5)" onmouseout="sohide(5)">
								<a href="../product/prolist?pcode=p0201">남성의류</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p020101">정장</a></li>
									<li><a href="../product/prolist?pcode=p020102">스포츠</a></li>
									<li><a href="../product/prolist?pcode=p020103">캐주얼</a></li>
								</ul>
							</li>
							<li onmouseover="soview(6)" onmouseout="sohide(6)">
								<a href="../product/prolist?pcode=p0202">여성의류</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p020201">정장</a></li>
									<li><a href="../product/prolist?pcode=p020202">스포츠</a></li>
									<li><a href="../product/prolist?pcode=p020203">캐주얼</a></li>
								</ul>
							</li>
							<li onmouseover="soview(7)" onmouseout="sohide(7)">
								<a href="../product/prolist?pcode=p0203">아동의류</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p020301">스포츠</a></li>
									<li><a href="../product/prolist?pcode=p020302">캐주얼</a></li>
									<li><a href="../product/prolist?pcode=p020303">내의</a></li>
								</ul>
							</li>
							<li onmouseover="soview(8)" onmouseout="sohide(8)">
								<a href="../product/prolist?pcode=p0204">잡화</a>
								<ul class="so">
									<li><a href="../product/prolist?pcode=p020401">가방</a></li>
									<li><a href="../product/prolist?pcode=p020402">핸드백</a></li>
									<li><a href="../product/prolist?pcode=p020403">지갑</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li onmouseover="jungview(2)" onmouseout="junghide(2)">
						농수산물
						<ul class="jung">
							<li>농산물</li>
							<li>수산물</li>
							<li>축산물</li>
							<li>가공품</li>
						</ul>
					</li>
					<li>주방용품</li>
					<li>생활용품</li>
					<li>자동차용품</li>
					<li>스포츠/레저</li>
				</ul>
			</li>
			<li>신상품</li>
			<li>베스트</li>
			<li>특가상품</li>
			<li>이벤트</li>
		</ul>
	</nav>
	<sitemesh:write property="body"/>
	<footer>
		<div id="footer">
			<p>
			상호명 및 호스팅 서비스 제공 : abc(주)<span></span>대표이사 : 홍길동<span></span>			
			서울시 송파구 송파대로 1234<span></span>사업자 등록번호 : 123-45-6789
			</p>
			<span>Copyright © abc. 2023 All Rights Reserved.</span>
		</div>
	</footer>
</body>
</html>