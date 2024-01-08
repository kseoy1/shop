<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<style>
	section{
		width: 1100px;
		margin:auto;
		padding:50px 0;
		position: relative;
	}
	#cartmove{
		font-size: 12px;
	    text-align: center;
	    width: 220px;
	    border: 1px solid #c7c7c7;
	    margin-bottom: 10px;
	    visibility: hidden;
	    z-index: 9;
	    background: #fff;
	    position: absolute;
	    top: 20%;
    	left: 50%;
	    font-weight: bold;
	    padding:30px 20px;
	    transform: translate(-50%, -20%);
	}
	#cartmove input{
		background: #346aff;
	    border: none;
	    color: #fff;
	    width: 132px;
	    height: 30px;
	    cursor: pointer;
	    font-size: 12px;
	    margin-top: 18px;
	}
	#cartmove .cbtn{
	    position: absolute;
	    top: 9px;
	    left: 230px;
	    font-size: 16px;
	    cursor: pointer;
	}
	#content{
		display: flex;
	    justify-content: space-between;
	}
	#content > div{
		border:1px solid;
	}
	#content #left{
		width: 530px;
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
		width: 530px;
		padding: 20px 20px;
    	box-sizing: border-box;
    	border: 1px solid #c7c7c7;;
	}
	#right .title{
		font-size: 18px;
    	font-weight: bold;
    	margin-bottom: 20px;
    	display: flex;
	}
	#right .title > span{
	    display: inline-block;
    	width: 450px;
	}
	#right .title > span#jjimwrap{
		width: 35px;
	}
	.title #jjim{
		width: 100%;
	    cursor:pointer;
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
		text-align: center;
    	padding: 8px 6px;
	}
	#suouter{
		margin-top:10px;
	}
	#suouter input{
		outline:none;
		font-size: 16px;
    	font-weight: bold;
	}
	#btn{
		margin-top:20px;
	}
	#btn input{
		background: #346aff;
	    border: none;
	    color: #fff;
	    width: 232px;
	    height: 40px;
	    cursor:pointer;
	}
	#btn input:first-child {
		margin-right: 15px;
	}
	#submenu{
		margin-top:50px;
	}
	#submenu > ul {
		padding:0;
		margin:0;
		display: flex;
	    justify-content: space-between;
	    border-top: 2px solid #555;
	    border-bottom: 1px solid #ccc;
	}
	#submenu > ul > li{
		list-style: none;
		width: 25%;
		height: 40px;
		line-height: 40px;
		text-align: center;
		border-right:1px solid #ccc;
		background: #fafafa;
		color: #555;
		font-size: 15px;
		font-weight: bold;
	}
	#submenu > ul > li:first-child {
		border-left:1px solid #ccc;
	}
	#prodetail{
		margin-top:30px;
	}
	#prodetail img{
		width: 1000px;
	    height: 800px;
	    object-fit: contain;
	    padding: 20px;
	}
	#msg{
		font-size: 12px;
	    color: #cb1400;
	    margin-left: 10px;
	}
</style>
<script>
	$(function(){
       	 
		$("#su").spinner({
			min:1,
			max:${pvo.su},
			spin:function(e,ui){//버튼이 클릭되었을 때 동작하는 메소드
				$("#cntprice").text(comma(${pvo.price}*ui.value)+"원");
				$("#halprice").text(comma(${pvo.price-(pvo.price*(pvo.halin)/100)}*ui.value)+"원");
				$("#juk").text(comma(${pvo.price*(pvo.juk/100)+100}*ui.value)+"원");
			}
		});
		
		if("${ct}"=="1"){
			
			document.getElementById("cartmove").style.visibility="visible";
			setTimeout(function() {
	        	document.getElementById("cartmove").style.visibility="hidden";
	        	
	        },3000)			
		}
    });  
	
	function comma(num){
   		return new Intl.NumberFormat().format(num);
    }
	
	function addjjim(src){
    	
    	if(src.indexOf("jjim1.png")==-1)  {
    		
    		var url="deljjim?pcode=${pcode}";
    		var img="/static/product/jjim1.png";
    		
    	}else{
    		
    		var url="addjjim?pcode=${pcode}";
    		var img="/static/product/jjim2.png"
    	}	
    	 
    	var chk=new XMLHttpRequest();
       
    	chk.onload=function(){
        	
        	if(chk.responseText=="1")
        		alert("잘못된 동작이 발생했습니다");
        	else if(chk.responseText=="0")
        		document.getElementById("jjim").src=img;
        	else if(chk.responseText=="2")
        		location="../member/login?pcode=${pcode}";
        }
        chk.open("get",url);
        chk.send();
         
    }
	function cartadd(){
		
		//클릭된 마우스의 좌표를 읽기
		var x=event.clientX;
    	var y=event.clientY;
		
		//ajax를 통해 cart테이블에 상품코드,수량,아이디를 저장하는 것
		var chk=new XMLHttpRequest();
		var pcode=document.pform.pcode.value;
		var su=document.pform.su.value;
		
		chk.onload=function(){
			
			if(chk.responseText==1){
				alert("오류발생");	
				
			}else if(chk.responseText==2){
				
				location="../member/login?pcode="+pcode+"&su="+su;
			}else{
				
				//장바구니 이동 레이어를 보이게 하기
				document.getElementById("cartmove").style.visibility="visible";
		        
		        setTimeout(function() {
		        	document.getElementById("cartmove").style.visibility="hidden";
		        	
		        },3000)
			}
		}
		
		chk.open("get","cartAdd?pcode="+pcode+"&su="+su);
		chk.send();
	}
	function delcartmove(){
		document.getElementById("cartmove").style.visibility="hidden";
	}
</script>
</head>
<body>
	<section>
		<div id="cartmove">
			<span>장바구니에 담겼습니다</span>
			<span class="cbtn" onclick="delcartmove()">X</span>
			<input type="button" value="장바구니 이동" onclick="location='cartView'">
		</div>
		<form method="post" action="progumae" name="pform">
			<input type="hidden" name="pcode" value="${pvo.pcode}">
			<div id="content">
				<div id="left">
					<img src="/static/pro/${pvo.pimg}">
				</div>
				<div id="right">
					<div class="title"><span>${pvo.title}</span><span id="jjimwrap"><img src="/static/product/${img}" id="jjim" onclick="addjjim(this.src)"></span></div>
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
					<div id="suouter"> <!-- 구입수량 -->
						<div class="lf">
							<input type="text" name="su" size="1" value="1" id="su" readonly>
						<c:if test="${pvo.su<10}">
							<span id="msg">품절임박 잔여:${pvo.su}개</span>
						</c:if>
						</div>
					</div>
					<div id="btn">
						<input type="button" value="장바구니" onclick="cartadd()">
						<input type="submit" value="바로구매">
					</div>
				</div>
			</div>
			<div id="submenu">
				<ul>
					<li>상품상세</li>
					<li>상품평</li>
					<li>상품문의</li>
					<li>교환/반품안내</li>
				</ul>			
			</div>
			<div id="prodetail"> <!-- 제품상세 -->
				<img src="/static/pro/${pvo.dimg}">
			</div> 
			<div id="review"></div> <!-- 상품평 -->
			<div id="mun"></div> <!-- 상품문의 -->
			<div id="info"></div> <!-- 교환/반품안내 -->
		</form>
	</section>
</body>
</html>