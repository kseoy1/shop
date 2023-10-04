<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width: 1080px;
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
	.tt{
		width: 210px;
	    height: 100px;
	    overflow: auto;
	    padding: 10px;
	    box-sizing: border-box;
	    text-align: left;
	}
	.cont{
		width: 420px;
	    height: 100px;
	    overflow: auto;
	    padding: 10px;
	    box-sizing: border-box;
	    text-align: left;
	}
</style>
<script>
	function reviewDel(no){
		
		var chk=new XMLHttpRequest();
		chk.onload=function(){
			//alter(chk.responseText);
			//현재문서를 새로고침
			location.reload();
		}
		
		chk.open("get","reviewDel?no="+no);
		chk.send();
	}
</script>
</head>
<body>
	<section>
		<table>
			<tr>
				<td width="130">사용자</td>
				<td width="40">별점</td>
				<td width="210">한줄요약</td>
				<td>내용</td>
				<td width="80">신고건수</td>
				<td width="110">등록일</td>
				<td width="80">삭제</td>
			</tr>
		<c:forEach items="${rlist}" var="rvo">
			<tr>
				<td>${rvo.userid}</td>
				<td>${rvo.star}</td>
				<td><div class="tt">${rvo.title}</div></td>
				<td><div class="cont">${rvo.content}</div></td>
				<td>${rvo.singo}</td>
				<td>${rvo.writeday}</td>
				<td><a href="javascript:reviewDel(${rvo.no})">click</a></td>
			</tr>
		</c:forEach>
		</table>
	</section>
</body>
</html>