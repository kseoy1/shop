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
</style>
</head>
<body>
	<section>
	
		<table>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>등급</td>
				<td>가입일</td>
				<td>상태</td>
			</tr>
		<c:forEach items="${mlist}" var="mvo">
			<tr>
				<td>${mvo.userid}</td>
				<td>${mvo.name}</td>
				<td>${mvo.phone}</td>
				<td>${mvo.email}</td>
				<td>
				<c:if test="${mvo.level==0}">
					bronze
				</c:if>
				<c:if test="${mvo.level==30}">
					silver
				</c:if>
				<c:if test="${mvo.level==60}">
					gold
				</c:if>
				<c:if test="${mvo.level>=90}">
					diamond
				</c:if>
				</td>
				<td>${mvo.writeday}</td>
				<td>
				<c:if test="${mvo.state==0}">
					정상회원
				</c:if>
				<c:if test="${mvo.state==1}">
					<a href="memberOut?no=${mvo.no}">탈퇴신청중</a>
				</c:if>
				<c:if test="${mvo.state==2}">
					탈퇴회원
				</c:if>
				</td>
			</tr>
		</c:forEach>	
		</table>
	</section>	
</body>
</html>