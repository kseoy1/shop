<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width: 500px;
		margin:auto;
		padding:80px 0;
		position: relative;
	}
	h2{
		text-align: center;
		color:#333;
	}
	form{
		width: 100%;
	}
	form > div > input{
		width: 100%;
		border: 1px solid #ddd;
		height: 31px;
		outline:none;
		box-sizing: border-box;
		padding:0 10px;
	}
	textarea{
		width: 100%;
	    height: 300px;
	    resize: none;
	    border: 1px solid #ddd;
	    margin:10px 0;
	    outline:none;
	    box-sizing: border-box;
	    padding:10px;
	}
	input[type=submit]{
		height: 40px;
		cursor: pointer;
		box-sizing: border-box;
		margin-top:11px;
		
	}
	.aa{
		width: 100%;
	    border: 1px solid #ddd;
	    height: 31px;
	    outline:none;
	}
	.inner{
		display: none;
		margin-top: 20px;
    	margin-bottom: 10px;
	}
	.ph{
		color:#555;
		font-size: 14px;
		margin-right: 10px;
	}
	.inner .phone{
		padding:0 10px;
		width: 404px;
	    border: 1px solid #ddd;
	    height: 28px;
	    outline: none;
	}
	.inner .em1{
	    border: 1px solid #ddd;
	    height: 28px;
	    outline: none;
	    margin-right: 5px;
	    padding: 0 10px;
	    box-sizing: border-box;
	    width: 196px;
	}
	.inner .em2{
	    border: 1px solid #ddd;
	    height: 28px;
	    outline: none;
	    margin-left: 5px;
	    padding: 0 10px;
	    box-sizing: border-box;
	    width: 150px;
	}
	.inner select{
		width: 122px;
	    height: 30px;
	    border: 1px solid #ddd;
	    outline: none;
	}
</style>
<script>
	function selinner(chk){
		document.getElementsByClassName("inner")[0].style.display="none";
		document.getElementsByClassName("inner")[1].style.display="none";
		
		if(chk==1 || chk==2){
			document.getElementsByClassName("inner")[chk-1].style.display="block";
		}
		
	}
	function selemail(str){
		document.mform.server.value=str;
	}
	function check(){
		var uid=document.mform.uid.value;
		var server=document.mform.server.value;
		
		document.mform.email.value=uid+"@"+server;
		
		return true;
	}
</script>
</head>
<body>
	<section>
		<form name="mform" method="post" action="mtmOk" onsubmit="return check()">
			<input type="hidden" name="email">
			<h2>1:1문의하기</h2>
			<div><input type="text" name="title"></div>
			<div><textarea name="content"></textarea></div>
			<div>
				<select name="answer" class="aa" onchange="selinner(this.value)">
					<option value="0">선택</option>
					<option value="1">전화번호</option>
					<option value="2">이메일</option>
					<option value="3">홈페이지</option>
				</select>
				<div class="inner"><span class="ph">전화번호 :</span><input type="text" name="phone" class="phone"></div>			
				<div class="inner">
					<input type="text" name="uid" class="em1">@<input type="text" name="server" class="em2">
					<select onchange="selemail(this.value)">
						<option value="">직접선택</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</div>
			</div>
			<div><input type="submit" value="문의하기"></div>
		</form>
	</section>
</body>
</html>