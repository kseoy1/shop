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
	    width: 1100px;
	    margin: auto;
	    min-height: 700px;
	    margin-top: 50px;
	}
	h3{
		text-align:center;
		font-size: 22px;
	}
	table{
		width: 100%;
		border-spacing: 0;
	}
	table #ft{
	    position: relative;
	    background: #fafafa;
	    height: 45px;
	    font-weight: bold;
	    font-size: 14px;
	}
	table #ft > td{
		 border-top: 1px solid #ddd;
	    border-bottom: 1px solid #ddd;
	}
	table #ft td:nth-child(1){
		text-align: center;
    	width: 30px;
	}
	table #ft td:nth-child(3){
		text-align: center;
	}
	table img{
		width: 120px;
	    height: 110px;
	    object-fit: contain;
	    padding: 10px;
	}
	table .st td {
	    border-bottom: 5px solid #eee;
	    font-size: 14px;
	}
	table .st td:first-child{
		text-align: center;
	}
    #btn {
	    display: inline-block;
	    padding: 5px 6px;
	    border: 1px solid #ccc;
	    text-align: center;
	    font-size: 12px;
	    color: #111;
	    background: #fff;
	    cursor: pointer;
	    width: 100px;
    }
    .h60{
    	height: 60px;
    }
    #btn.dis{
    	background: #eee;
    	color:#000;
    }
    .h60 td{
    	font-size: 13px;
    }
    .h60 td input[type=checkbox]{
    	position: relative;
    	top: 1px;
    }
</style>
<script>
	function mainClick(my,n){
		
		var sub=document.getElementsByClassName("sub");
		var len=sub.length;
		
		for(i=0;i<len;i++){
			sub[i].checked=my.checked;
		}	
		
		document.getElementsByClassName("main")[n].checked=my.checked;
	}
	
	function subClick(){
		
		var sub=document.getElementsByClassName("sub");
		var len=sub.length;
		var sel=0; 
		
		for(i=0;i<len;i++){
			if(sub[i].checked)
				sel++;
		}	
		
		var main=document.getElementsByClassName("main");
		if(len==sel){
			main[0].checked=true;
			main[1].checked=true;
		}else{
			main[0].checked=false;
			main[1].checked=false;
		}	
	}

	function selectDel(){
		
		var sub=document.getElementsByClassName("sub");
		var len=sub.length;
		
		var delsub="";
		for(i=0;i<len;i++){
			
			if(sub[i].checked){
				delsub=delsub+sub[i].value+",";
			}	
		}	
		
		location="jjimDel?nos="+delsub;
	}

	function jjimDel(nos){
		location="jjimDel?nos="+nos; 
	}
</script>
</head>
<body> 
	<section>
		<h3>찜목록</h3>
    	<table>
	        <tr id="ft">
				<td><input type="checkbox" class="main" onclick="mainClick(this,1)"></td>
				<td>전체선택</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
	        </tr>
      	<c:forEach items="${mapall}" var="map">     
        	<tr class="st"> 
				<td> 
		            <input type="checkbox" class="sub" value="${map.no}" onclick="subClick()"> 
          		</td>
          		<td> 
          			<img src="/static/pro/${map.pimg}">
          		</td>
          		<td>
            	<c:if test="${map.bprice==0}">
              		<span>무료배송</span>
            	</c:if>
            	<c:if test="${map.bprice!=0}">
              		<span><fmt:formatNumber value="${map.bprice}" type="number"/>원</span>
            	</c:if> 
					${map.title}<br>
	            	<fmt:formatNumber value="${map.price}" type="number"/>원
          		</td>
          		<td> 
          		<c:if test="${map.cnt!=0}">
          			<input type="button" id="btn" class="dis" value="장바구니 담기" disabled><br>
          		</c:if>
          		<c:if test="${map.cnt==0}">
		            <input type="button" value="장바구니 담기" id="btn" onclick="location='moveCart?pcode=${map.pcode}&no=${map.no}'"><br>
		        </c:if>
		            <input type="button" style="margin-top:10px;" value="삭제" id="btn" onclick="jjimDel(${map.no})">
          		</td>
        	</tr>
      	</c:forEach>   
			<tr class="h60">
				<td colspan="4"> 
				    <input type="checkbox" class="main" onclick="mainClick(this,0)">전체선택   
					<input type="button" value="선택삭제" id="btn" onclick="selectDel()">  
				</td>
			</tr>
    	</table>
	</section>
</body>
</html>












