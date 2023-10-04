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
	    color:#666;
	}
	h2{
		color:#333!important;
	}
	table{
		width: 100%;
		border-spacing: 0;
		border-top: 2px solid #cecece;
		margin-bottom: 50px;
		font-size: 13px;
	}
	table tr{
		height: 55px;
	}
	table tr td{
		padding-left: 15px;
		border-bottom: 1px solid #ddd;
	}
	table tr td:nth-child(1) {
		width: 100px;
		background: #eef1f8;
    	font-weight: bold;
    	border-right: 1px solid #ddd;
	}
	table tr td:nth-child(2){
		padding: 10px 0px 10px 15px;
	}
	table input[type=button],
	table input[type=submit]{
	    background: #fff;
	    outline: none;
	    border: 1px solid #ddd;
	    cursor: pointer;
	    padding: 0px 11px;
	    font-size: 12px;
	    margin-left: 10px;
	    height: 27px;
	    line-height: 27px;
	    border-color: #bcbfc6;
	    background-color: #fafbf6;
	    background-image: linear-gradient(#fff,#f1f1f1);
	}
	#pwdWrap{
		width: 100%;
		height: 100%;
	}
	#pwdWrap form {
		width: 100%;
		height: 100%;
	}
	#pwdWrap form > div{
		height: 50px;
    	line-height: 50px;
	}
	table input[type="password"]{
		outline: none;
	    border: 1px solid #ddd;
	    margin-left: 15px;
	    height: 25px;
	    line-height: 25px;
	    width: 150px;
	    padding: 0 10px;
	}
	#pwdWrap .ww{
		display: inline-block;
    	width: 100px;
	}
	.ml0{
		margin-left:0!important;
	}
	table input[type="text"]{
		outline: none;
	    border: 1px solid #ddd;
	    height: 25px;
	    line-height: 25px;
	    width: 150px;
	    padding: 0 10px;
	}
	#nameBox,
	#phoneBox,
	#emailBox{
		height: 34px;
    	line-height: 34px;
	}
	#nameBox2,
	#phoneBox2,
	#emailBox2{
		height: 50px;
    	line-height: 60px;
    	display:none;
	}
	table input.disn{
		display:none;
	}
	#nameBox2 input[type=button],
	#phoneBox2 input[type=button],
	#emailBox2 input[type=button]{
		margin-left: 0;
	}
	#exitBtn{
		width: 100%;
    	text-align: center;
	}
	#exitBtn input{
		border-color: #bcbfc6;
	    background-color: #fafbf6;
	    background-image: linear-gradient(#fff,#f1f1f1);
	    outline: none;
	    border: 1px solid #ddd;
	    color: #666;
	    padding: 4px 11px;
	    font-weight: bold;
	    cursor:pointer;
		
	}
	#pmsg1,
	#pmsg2,
	#err{
		font-size: 12px;
		color:#e52528;
		margin-left: 10px;
	}
	#err{
		margin-left: 14px;
	}
</style>
<script>
	function chgName(sts,my,n){
		document.getElementById("nameBox2").style.display=sts;
		my.style.display="none";
		document.getElementsByClassName("nameBtn")[n].style.display="inline-block";
	}
	function chgPhone(sts,my,n){
		document.getElementById("phoneBox2").style.display=sts;
		my.style.display="none";
		document.getElementsByClassName("phoneBtn")[n].style.display="inline-block";
	}
	function chgEmail(sts,my,n){
		document.getElementById("emailBox2").style.display=sts;
		my.style.display="none";
		document.getElementsByClassName("emailBtn")[n].style.display="inline-block";
	}
	function updateName(){
		var name=document.getElementById("name").value;
		location="chgName?name="+name;
	}
	function updatePhone(){
		var phone=document.getElementById("phone").value;
		location="chgPhone?phone="+phone;
	}
	function updateEmail(){
		var email=document.getElementById("email").value;
		location="chgEmail?email="+email;
	}
	
	var pchk=0;
	function pwdLength(my){
		if(my.length<8){
			document.getElementById("pmsg1").innerText="비밀번호를 8자 이상 입력하세요.";
			pchk=0;
		}else{
			document.getElementById("pmsg1").innerText="비밀번호의 길이가 적당합니다.";
			document.getElementById("pmsg1").style.color="#00891a";
			
			var pwd=document.getElementById("pwd").value;
			var pwd2=document.getElementById("pwd2").value;
			
			if(pwd==pwd2){
				pchk=1;
			}
		}
	}
	
	function pwdCheck(){
		var pwd=document.getElementById("pwd").value;
		var pwd2=document.getElementById("pwd2").value;
		
		if(pwd.length > 0 && pwd2.length){
			
			if(pwd==pwd2){
				document.getElementById("pmsg2").innerText="비밀번호가 일치합니다.";
				document.getElementById("pmsg2").style.color="#00891a";
				
				if(pwd.length>7){
					pchk=1;
				}else{
					pchk=0;
				}
			}else{
				document.getElementById("pmsg2").innerText="비밀번호가 불일치합니다.";
				document.getElementById("pmsg2").style.color="#e52528";
				pchk=0;
			}
		}
	}
	
	function check(){

		if(document.mform.opwd.value.trim().length==0){
			alert("현재 비밀번호를 입력하세요.");
			return false;
		}else if(pchk==0){
			alert("새 비밀번호를 확인하세요.");
			return false;
		}else{
			return true;
		}
		
	}
	
	function out(){
		if(confirm("정말 탈퇴하시겠습니까?"))
			location="memberOut";
	}
</script>
</head>
<body>
	<section>
		<h2>회원정보 수정</h2>
		<table>
			<tr>
				<td>아이디</td>
				<td>${mvo.userid}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<div id="nameBox">
						<span>${mvo.name}</span>
						<input type="button" value="이름변경" onclick="chgName('block',this,1)" class="nameBtn">	
						<input type="button" value="이름변경 취소" onclick="chgName('none',this,0)" class="nameBtn disn">			
					</div>
					<div id="nameBox2">
						<input type="text" id="name">
						<input type="button" value="변경하기" onclick="updateName()">	
					</div>	
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<div id="phoneBox">
						<span>${mvo.phone}</span>
						<input type="button" value="전화번호변경" onclick="chgPhone('block',this,1)" class="phoneBtn">	
						<input type="button" value="전화번호변경 취소" onclick="chgPhone('none',this,0)" class="phoneBtn disn">			
					</div>
					<div id="phoneBox2">
						<input type="text" id="phone">
						<input type="button" value="변경하기" onclick="updatePhone()">	
					</div>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<div id="emailBox">
						<span>${mvo.email}</span>
						<input type="button" value="이메일변경" onclick="chgEmail('block',this,1)" class="emailBtn">	
						<input type="button" value="이메일변경 취소" onclick="chgEmail('none',this,0)" class="emailBtn disn">	
					</div>	
					<div id="emailBox2">
						<input type="text" id="email">
						<input type="button" value="변경하기" onclick="updateEmail()">	
					</div>
				</td>
			</tr>
			<tr>
				<td>비밀번호 변경</td>
				<td>
					<div id="pwdWrap">
						<form name="mform" method="post" action="pwdChange" onsubmit="return check()">
							<div>
								<span class="ww">현재 비밀번호</span>	
								<input type="password" name="opwd" id="opwd">		
							</div>
							<div>
								<span class="ww">새 비밀번호</span>	
								<input type="password" name="pwd" id="pwd" oninput="pwdLength(this.value),pwdCheck()">		
								<span id="pmsg1"></span>		
							</div>
							<div>
								<span class="ww">비밀번호 확인</span>	
								<input type="password" name="pwd2" id="pwd2" oninput="pwdCheck()">
								<span id="pmsg2"></span>	
							</div>
							<div>
								<input type="submit" value="비밀번호 변경" class="ml0">
							<c:if test="${err==1}">
               					<span id="err">이전 비밀번호가 틀립니다.</span>
             				</c:if> 
							</div>			
						</form>
					</div>
				</td>
			</tr>
		</table>
		<div id="exitBtn">
			<input type="button" value="메인으로" onclick="location='../main/main'">
			<input type="button" value="탈퇴신청" onclick="out()">
		</div>
	</section>
</body>
</html>