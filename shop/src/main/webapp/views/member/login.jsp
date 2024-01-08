<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
	}
	section div {
	    text-align:center;
	    margin-bottom:20px;
	}
	section input{
		outline:none;
		padding-left:10px;
		box-sizing:border-box;
	}
	section input[type=text] {
	    width:400px;
	    height:40px;
	}
	section input[type=password] {
	    width:400px;
	    height:40px;
	}
	section input[type=submit] {
	    width:400px;
	    height:40px;
	    background:#bfb29f;
		color:#fff;
		border:none;
	}
</style>
</head>
<body>
	<section>
		<form method="post" action="loginOk">
			<div><h3>로그인</h3></div>
			<div><input type="hidden" name="pcode" value="${pcode}"></div>
			<div><input type="hidden" name="su" value="${su}"></div>
			<div><input type="text" name="userid" id="userid" placeholder="아이디" value="qwerqwer"></div>
			<div><input type="password" name="pwd" id="pwd" placeholder="비밀번호" value="12341234"></div>
			<div><input type="submit" value="로그인"></div>
		</form>
	</section>
</body>
</html>