<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1100px;
		margin: auto;
		position: relative;
		margin-top: 50px;
	}
	table {
		width: 100%;
		border-spacing: 0;
		border-top: 2px solid #cecece;
		margin-bottom: 50px;
		font-size: 15px;
	}
	table tr {
		height: 50px;
		text-align: center;
	}
	table tr:first-child td {
    	background: #eef1f8;
    	font-weight: bold;
	}
	table tr td {
		border-bottom: 1px solid #ddd;
	}
	.cont {
		width: 510px;
		height: 100px;
		overflow: auto;
		padding: 10px;
		box-sizing: border-box;
		text-align: left;
	}
	#qform,
	#mform{
		position: absolute;
		visibility: hidden;
		background: #fff;
	    border: 1px solid #ddd;
	    padding: 20px;
	}
	#qform textarea,
	#mform textarea{
		width: 300px;
		height: 120px;
		resize: none;
		padding:10px;
		box-sizing: border-box;
		border: 1px solid #ddd;
	}
	.aa{
		cursor: pointer;
	}
	.bbtn{
		width: 100%;
	    background: #e2e0e9;
	    border: 1px solid #ebe8e8;
	    font-size: 13px;
	    height: 35px;
	    margin-top: 10px;
	    cursor: pointer;
	}
	form{
		width: 300px;
	}
	h3{
		font-size: 20px;
	    height: 45px;
	}
</style>
<script>
	function questOk(title,pcode,grp){
		document.qform.title.value=title;
		document.qform.pcode.value=pcode;
		document.qform.grp.value=grp;
		
		document.getElementById("qform").style.visibility="visible";
		
		var x=event.clientX;
		var y=event.clientY;
		document.getElementById("qform").style.left=(x-800)+"px";
		document.getElementById("qform").style.top=(y-180)+"px";
	}
	
	function mtmOk(mtmno){
		document.mform.mtmno.value=mtmno;
		
		document.getElementById("mform").style.visibility="visible";
		
		var x=event.clientX;
		var y=event.clientY;
		document.getElementById("mform").style.left=(x-800)+"px";
		document.getElementById("mform").style.top=(y-180)+"px";
	}
</script>
</head>
<body>
	<section>
		<h3>상품문의</h3>
		<table>
			<tr>
				<td width="110">문의자</td>
				<td width="150">상품명</td>
				<td width="110">문의분류</td>
				<td>문의내용</td>
				<td width="110">등록일</td>
				<td width="100">답변달기</td>
			</tr>
			<c:forEach items="${mapall}" var="map">
				<c:set var="bb" value="" />
				<c:if test="${map.seq==1}">
					<c:set var="bb" value="style='background:#f7f7f7'"/>
				</c:if>

				<c:if test="${map.title==0}">
					<c:set var="title" value="상품관련"/>
				</c:if>
				<c:if test="${map.title==1}">
					<c:set var="title" value="결제관련"/>
				</c:if>
				<c:if test="${map.title==2}">
					<c:set var="title" value="배송관련"/>
				</c:if>
				<c:if test="${map.title==3}">
					<c:set var="title" value="그 외"/>
				</c:if>

				<tr ${bb}>
					<td>${map.userid}</td>
					<td>${map.ptitle}</td>
					<td>${title}</td>
					<td style="text-align: left;">
						<div class="cont">${map.content}</div>
					</td>
					<td>${map.writeday}</td>
					<c:if test="${map.seq==0 and map.cnt==0}">
						<td onclick="questOk(${map.title},'${map.pcode}',${map.grp})" class="aa">click</td>
					</c:if>
					<c:if test="${map.seq==1 || map.cnt==1}">
						<td>&nbsp;</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<h3>1:1문의</h3>
		<table>
			<tr>
				<td width="110">문의자</td>
				<td width="240">제목</td>
				<td>내용</td>
				<td width="120">답변방식</td>
				<td width="110">등록일</td>
			</tr>
		<c:forEach items="${mlist}" var="mvo">
			<c:set var="bb" value=""/>
	        <c:if test="${mvo.state==1}">
	        	<c:set var="bb" value="style='background:#f7f7f7'"/>
	        </c:if>
			<tr ${bb}>
				<td>${mvo.userid}</td>
				<td><div class="tt">${mvo.title}</div></td>
				<td><div class="cont">${mvo.content}</div></td>
				<td>
				<c:if test="${mvo.answer==1}">
		        	전화번호
		        </c:if>
		        <c:if test="${mvo.answer==2}">
		         	이메일
		        </c:if>
		        <c:if test="${mvo.answer==3}">
		        	<c:if test="${mvo.state==0}">
		         		<a href="#" onclick="javascript:mtmOk(${mvo.no})">웹페이지</a>
		         	</c:if>
		         	<c:if test="${mvo.state==1}">
		         		웹페이지
		         	</c:if>
		        </c:if>
		        </td>
				<td>${mvo.writeday}</td>
			</tr>
		</c:forEach>
		</table>
		<!-- 상품문의답변 -->
		<div id="qform">
			<form name="qform" method="post" action="questOk">
				<input type="hidden" name="title">
				<input type="hidden" name="pcode">
				<input type="hidden" name="grp">
				<textarea name="content"></textarea>
				<input type="submit" value="답변달기" class="bbtn">
			</form>		
		</div>
		<!-- 1:1문의답변 -->
		<div id="mform">
			<form name="mform" method="post" action="mtmOk">
				<input type="hidden" name="mtmno">
				<textarea name="content"></textarea>
				<input type="submit" value="답변달기" class="bbtn">
			</form>
		</div>
	</section>
</body>
</html>