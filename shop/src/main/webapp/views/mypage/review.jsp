<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
	    width:600px;
	    margin:auto;
	    padding:80px 0;
	    color:#666;
	}
	section form > div{
		width: 100%;
		margin-bottom: 12px;
	}
	section input{
		width: 100%;
	    height: 35px;
	    padding: 0 10px;
	    box-sizing: border-box;
	    border: 1px solid #ddd;
	    font-size: 14px;
	    outline:none;
	}
	section textarea{
		width: 100%;
		height:300px;
		padding:10px;
		border:1px solid #ddd;
		box-sizing: border-box;
		resize: none;
		outline:none;
		font-size: 14px;
	}
	section img{
		cursor:pointer;
	}
	h2{
		color:#333;
		text-align: center;
	}
	section input[type=submit]{
		border-color: #bcbfc6;
	    background-color: #fafbf6;
	    background-image: linear-gradient(#fff,#f1f1f1);
	    outline: none;
	    border: 1px solid #ddd;
	    color: #666;
	    padding: 4px 11px;
	    font-weight: bold;
	    cursor: pointer;
	    height: 45px;
	}
</style>
<script>
	function chgstar(n){
		// 매개변수 n까지 별을 노란색(stat1.png)으로 변경
		for(i=0;i<=n;i++){
			document.getElementsByClassName("star")[i].src="/static/product/star1.png";
		}	
		
		// 클릭된 위치 오른쪽 별은 회색으로 (star2.png)
		for(i=n+1;i<5;i++){
			document.getElementsByClassName("star")[i].src="/static/product/star2.png";
	    }    
		
		document.rform.star.value=n+1; //별점을 계산하여 reviewOk로 보내는 input태그에 값을 전달
	}
	
	function check(){
		if(document.rform.star.value=="0"){
			alert("별점을 선택하세요.");
			return false;			
		}else{
			return true;
		}
			
	}
</script>
</head>
<body>
	<section>
		<h2>리뷰 작성하기</h2>
		<form name="rform" method="post" action="reviewOk" onsubmit="return check()">
			<input type="hidden" name="star" value="0">
			<input type="hidden" name="pcode" value="${pcode}">
			<input type="hidden" name="gumaeno" value="${gumaeno}">
			<div><!-- 별점 -->
				<img src="/static/product/star2.png" onclick="chgstar(0)" class="star">
		        <img src="/static/product/star2.png" onclick="chgstar(1)" class="star">
		        <img src="/static/product/star2.png" onclick="chgstar(2)" class="star">
		        <img src="/static/product/star2.png" onclick="chgstar(3)" class="star">
		        <img src="/static/product/star2.png" onclick="chgstar(4)" class="star">
			</div>
			<div>
				<input type="text" name="title" placeholder="한줄 요약">
			</div>
			<div>
				<textarea name="content" placeholder="상품평"></textarea>
			</div>
			<div>
				<input type="submit" value="상품평 등록">
			</div>
		</form>
	</section>
</body>
</html>