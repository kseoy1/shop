<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	body{
		margin:0;
		font-size: 14px;
	}
	#top{
		width: 100%;
		height: 45px;
		line-height: 45px;
		text-align:center;
		border-bottom: 1px solid #ddd;
		font-size: 14px;
		font-weight: bold;
	}
	form{
		padding-top:10px;
		margin:auto;
		width: 95%;
	}
	form > div{
		height: 42px;
	}
	input{
		outline:none;
	}
	input[type=text]{
		outline: none;
	    height: 32px;
	    width: 100%;
	    border: 1px solid #ddd;
	    padding: 0 5px;
    	box-sizing: border-box;
	}
	input[type=submit]{
		outline: none;
	    height: 45px;
	    width: 100%;
	    border: 1px solid #ddd;
	    margin-bottom: 8px;
	    color:#fff;
	    background: #0073e9;
	    font-size: 15px;
		font-weight: bold;
		cursor: pointer;
	}
	select{
		width: 100%;
	    border: 1px solid #ddd;
	    box-sizing: border-box;
	    height: 32px;
	    outline: none;
	}
	.aa{
		font-size: 13px;
		position: relative;
		top: -2px;
    	left: 2px;
	}
</style>
<script>
	function juso_search(){
	 
		new daum.Postcode({
	    	oncomplete: function(data) {
	        
	    	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            addr = data.roadAddress;
	        } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            addr = data.jibunAddress;
	        }
	
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.bform.zip.value = data.zonecode; // 우편번호
	        document.bform.juso.value = addr;  // 주소
	        // 커서를 상세주소 필드로 이동한다.
	        document.bform.jusoEtc.focus();
	    }
	  }).open();
	}
</script>
</head>
<body>
	<div id="top">새 배송지 추가</div>
	<form name="bform" method="post" action="baeWriteOk">
		<div><input type="text" name="name" placeholder="받는사람"></div>
		<div><input type="text" name="phone" placeholder="전화번호"></div>
		<div><input type="text" name="zip" placeholder="우편번호" onclick="juso_search()"></div>
		<div><input type="text" name="juso" placeholder="주소"></div>
		<div><input type="text" name="jusoEtc" placeholder="상세주소"></div>
		<div>
			<select name="req">
				<option value="0">문 앞</option>
				<option value="1">직접 받고, 부재시 문 앞</option>
				<option value="2">경비실</option>
				<option value="3">택배함</option>
			</select>
		</div>
		<div><input type="checkbox" name="gibon" value="1"><span class="aa">기본배송지로 사용</span></div>
		<div><input type="submit" value="저장하기"></div>
	</form>
</body>
</html>