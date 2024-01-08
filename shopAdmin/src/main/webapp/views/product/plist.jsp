<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width: 1100px;
		margin:auto;
		position: relative;
		margin-top:50px;
	}
	table{
		 width: 100%;
	    border-spacing: 0;
	    border-top: 2px solid #cecece;
	    margin-bottom: 50px;
	    font-size: 15px;
	}
	table tr{
		height: 50px;
		text-align: center;
	}
	table tr:first-child td{
		background: #eef1f8;
	}
	table tr td{
		border-bottom: 1px solid #ddd;
	}
	.el{
		width: 180px;
	    height: 100%;
	    text-align: left;
	    padding: 0 5px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    box-sizing: border-box;
	}
	table img{
		vertical-align: middle;
	}
</style>
<script>
	function adminReview(pcode){
		open("adminReview?pcode="+pcode,"","width=1300,height=500");
	}
</script>
</head>
<body>
	<section>
		<table>
    		<tr>
				<td width="180">상품명</td>
				<td width="80">이미지</td>
				<td width="80">상세</td>
				<td>가격</td>
				<td width="60">할인율</td>
				<td>수량</td>
				<td>배송비</td>
				<td>별점</td>
				<td>배송기간</td>
				<td>적립율</td>
				<td>등록일</td>
				<td>상품평확인</td>
				<!-- <td> 삭제 </td> -->
    		</tr>
   		<c:forEach items="${plist}" var="pvo">
    		<tr>
		      	<td><div class="el">${pvo.title}</div></td>
		      	<td><img src="/static/pro/${pvo.pimg}" width="40" height="40"></td>
			    <td><img src="/static/pro/${pvo.dimg}" width="40" height="40"></td>
			    <td>${pvo.price}</td>
			    <td>${pvo.halin}</td>
			    <td>${pvo.su}</td>
			    <td>${pvo.bprice}</td>
			    <td>${pvo.star}</td>
			    <td>${pvo.btime}</td>
			    <td>${pvo.juk}</td>
			    <td>${pvo.writeday}</td>
			    <td align="center" onclick="adminReview('${pvo.pcode}')">${pvo.cnt}(${pvo.singo})</td>
		     	<%--  <td> <a href="delete?no=${pvo.no}"> click </a> </td> --%>
    		</tr>
   		</c:forEach>
  		</table>
	</section>		
</body>
</html>






