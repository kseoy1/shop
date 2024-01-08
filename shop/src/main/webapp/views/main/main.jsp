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
		margin:auto;
	}
	#slideimg{
		width:100%;
		margin:auto;
	}
	#slideimg img{
		width:100%;
		display:block;
	}
	#newpro{
		width:1100px;
		margin:auto;
		display: flex;
		justify-content: space-between;
	}
	#best{
		width:1100px;
		margin:auto;
		display: flex;
		justify-content: space-between;
	}
	#sale{
		width:1100px;
		margin:auto;
		display: flex;
		justify-content: space-between;
	}
	#event{
		width:1100px;
		margin:auto;
		display: flex;
		justify-content: space-between;
	}
	.pro{
		width: 180px;
    	height: 300px;
	}
	.pro img{
		width: 100%;
	    height: 170px;
	    object-fit: cover;
	    border: 1px solid #f5f5f5;
	}
	h5{
		width: 1100px;
		margin:auto;
		display: block;
		font-size: 20px;
	    border-bottom: 3px solid #bfb29f;
	    height: 45px;
		margin-bottom: 30px;
		color: #333;
	}
	.tt{
		margin-top:50px;
	}
	.title{
		font-size: 15px;
	    color: #333;
	    font-weight: bold;
	    margin: 10px 0;
	    width: 180px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.pri{
		font-size: 15px;
    	color: #666;
	}
</style>
</head>
<body>
	<section>
		<!-- 메인슬라이드 -->
		<div id="slideimg">
			<img src="/static/main/1.jpg">
		</div>
		<!-- 신규상품 -->
		<h5 class="tt">신규상품</h5>
		<div id="newpro">
		<c:forEach items="${newlist}" var="pvo">
			<div class="pro">
				<div><img src="/static/pro/${pvo.pimg}"></div>
				<div class="title">${pvo.title}</div>
				<div class="pri"><fmt:formatNumber value="${pvo.price}" type="number"/></div>
			</div>
		</c:forEach>
		</div>
		<!-- 인기상품 -->
		<h5>인기상품</h5>
		<div id="best">
		<c:forEach items="${bestlist}" var="pvo">
			<div class="pro">
				<div><img src="/static/pro/${pvo.pimg}"></div>
				<div class="title">${pvo.title}</div>
				<div class="pri"><fmt:formatNumber value="${pvo.price}" type="number"/></div>
			</div>
		</c:forEach>
		</div>
		<!-- 특가상품 -->
		<h5>특가상품</h5>
		<div id="sale">
		<c:forEach items="${salelist}" var="pvo">
			<div class="pro">
				<div><img src="/static/pro/${pvo.pimg}"></div>
				<div class="title">${pvo.title}</div>
				<div class="pri"><fmt:formatNumber value="${pvo.price}" type="number"/></div>
			</div>
		</c:forEach>
		</div>
		<!-- 이벤트 -->
		<h5>이벤트</h5>
		<div id="event">
		<c:forEach items="${eventlist}" var="pvo">
			<div class="pro">
				<div><img src="/static/pro/${pvo.pimg}"></div>
				<div class="title">${pvo.title}</div>
				<div class="pri"><fmt:formatNumber value="${pvo.price}" type="number"/></div>
			</div>
		</c:forEach>
		</div>
	</section>
</body>
</html>