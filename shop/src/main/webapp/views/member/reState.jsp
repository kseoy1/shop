<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
	    width: 1100px;
	    margin: auto;
	    padding: 80px 0;
	    min-height: 520px;
	}
	h3{
		text-align: center;
    	padding-top: 100px;
	}
	.btn{
		text-align: center;
		margin-top:100px;
	}
	section a{
		text-decoration: none;
	    display: inline-block;
	    height: 40px;
	    line-height: 40px;
	    border: 1px solid #ddd;
	    font-size: 14px;	
	    border-color: #bcbfc6;
	    background-color: #fafbf6;
	    background-image: linear-gradient(#fff,#f1f1f1);
	    outline: none;
	    border: 1px solid #ddd;
	    color: #666;
	    padding: 4px 11px;
	    font-weight: bold;
	    cursor: pointer;
	}
</style>
</head>
<body>
	<section>
		<h3>현재 탈퇴신청중 입니다. 탈퇴신청을 취소하시려면 아래의 버튼을 클릭하세요.</h3>
		<div class="btn"><a href="chgState?no=${no}">탈퇴신청 취소</a></div>
	</section>
</body>
</html>