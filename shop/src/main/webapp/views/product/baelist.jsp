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
		font-size: 14px;		
	}
	#top{
		position: fixed;
		left:0;
		top:0;
		width: 100%;
		height: 45px;
		line-height: 45px;
		text-align:center;
		border-bottom: 1px solid #ddd;
		font-size: 14px;
		background: #fff;
		font-weight: bold;
	}
	#chuga{
		width: 95%;
		height: 45px;
		line-height: 45px;
		text-align: center;
		border:1px solid #ddd;
		background: #fff;
		font-size: 15px;
		font-weight: bold;
		color:#0073e9;
		margin: auto;
		cursor:pointer;
		margin-bottom: 10px;
	}
	#imsi {
		margin-top:45px;		
	}
	.alc{
		text-align: center;
	}
	.baejuso{
		width: 100%;
		border:1px solid #ddd;
		margin-bottom:10px;
		padding: 10px;
    	box-sizing: border-box;
	}
	.baejuso > div{
		height: 25px;
		font-size: 13px;
	}
	#baeWrap{
		width: 95%;
		height: auto;
		padding-top:20px;
		margin:auto;
	}
	.btn{
		display: flex;
	    justify-content: space-between;
	    margin:5px 0;
	}
	.btn input[type=button]{
		outline:none;
		background: #fff;
		border: 1px solid #ddd;
		width: 50px;
		height: 30px;
		line-height: 30px;
		color:#0073e9;
		cursor: pointer;
	}
	.btn input[type=button].btn2{
		background: #0073e9;
		color:#fff;
	}
	.baejuso > div.name{
		color: #333;
	    font-weight: bold;
	    font-size: 15px;
	}
	.name span{
		border: 1px solid #555;
	    border-radius: 10px;
	    font-size: 11px;
	    line-height: 12px;
	    height: 15px;
	    display: inline-block;
	    width: 63px;
	    text-align: center;
	    line-height: 15px;
	    margin-left: 5px;
	}
</style>
<script>
	function move(n){
		opener.document.getElementById("name").innerText=document.getElementsByClassName("name")[n].innerText;
	    opener.document.getElementById("juso").innerText=document.getElementsByClassName("juso")[n].innerText;
	    opener.document.getElementById("phone").innerText=document.getElementsByClassName("phone")[n].innerText;
	    opener.document.getElementById("req").innerText=document.getElementsByClassName("req")[n].innerText;
	    close();
	}
</script>
</head>
<body>
	<div id="top">배송지 선택</div>
	<div id="imsi"></div>
<c:if test="${blist.size()==0}">
	<div class="alc">배송주소가 없습니다.</div>
</c:if>
	<div id="baeWrap">
	<c:forEach items="${blist}" var="bvo" varStatus="sts">
		<div class="baejuso">
			<div class="name">
				${bvo.name}
			<c:if test="${bvo.gibon==1}">
        		<span id="gibon">기본배송지</span>
      		</c:if>
			</div>
			<div class="juso">${bvo.juso} ${bvo.jusoEtc}</div>
			<div class="phone">${bvo.phone}</div>
			<div class="req">
			<c:if test="${bvo.req==0}">
				문 앞
			</c:if>
			<c:if test="${bvo.req==1}">
				직접 받고, 부재시 문 앞
			</c:if>
			<c:if test="${bvo.req==2}">
				경비실
			</c:if>
			<c:if test="${bvo.req==3}">
				택배함
			</c:if>
			</div>
			<div class="btn">
				<div id="left"><input type="button" value="수정" onclick="location='baeUpdate?no=${bvo.no}'"></div>
				<div id="right"><input type="button" value="선택" onclick="move(${sts.index})" class="btn2"></div>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="chuga" onclick="location='baeWrite'">배송지 추가</div>
</body>
</html>