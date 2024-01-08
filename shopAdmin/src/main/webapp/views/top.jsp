<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul{
		width: 1100px;
	    margin: auto;
	    display: flex;
	    justify-content: space-between;
	    list-style: none;
	    height: 60px;
	    line-height: 60px;
	    padding:0;
	}
	ul li{
		color: #333;
	    font-size: 16px;
	    font-weight: bold;
	    cursor: pointer;
	}
	a{
		text-decoration: none;
		color:#333;
	}
</style>
</head>
<body>
	<ul>
		<li><a href="../product/plist">상품관리</a></li>
		<li><a href="../member/memberlist">회원관리</a></li>
		<li><a href="../gumae/gumaeState">구매관리</a></li>
		<li><a href="../answer/answerlist">답변관리</a></li>
	</ul>
</body>
</html>