<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문영역 -->


<br>
	<h1 class="saem_title"> MY PAGE </h1>
<br> 


							<!-- position:sticky;  -->
<div class="leftcontent" style="float:left; width:15%; margin-right:5%; height:100%;">
	[회원id]님 <!-- 세션아이디 -->
<br><br>
	
	<ul style="font-size:13px; list-style-type: none; padding-left:0px;">
	
		<li style="font-weight:bold;">회원정보수정</li>
<br>
		<li style="font-weight:bold;"> PRODUCT </li>
			<li>&nbsp;<a href="/mypageS/create" style="color:black;" class="saem_a">  - 상품등록 &nbsp;</a></li>
			<li>&nbsp;<a href="/mypageS/productM" style="color:black;" class="saem_a">  - 상품관리 &nbsp;</a></li>
<br>	
		<li style="font-weight:bold; color:#cdf336;"> ORDER </li>
			<li>&nbsp;<a href="/mypageS/orderM" style="color:black;" class="saem_a"> - 주문관리 &nbsp;</a></li>	
<br>	
		<li style="font-weight:bold;"> QnA </li>
			<li>&nbsp; - 답변대기 &nbsp;</li>
			<li>&nbsp; - 답변완료 &nbsp;</li>
<br>	
		<li style="font-weight:bold;"> 판매통계 </li>	
	</ul>
	

</div><!-- "leftcontent" -->



<div class="rightcontent" id="rightcontent" style="float:right; width:80%; height:100%;"> 
	<div style="display:inline-block; float: left; font-size: 12px; color:gray;">20221118-001</div>
	<div style="display:inline-block; float: right;font-size: 12px; color:gray;">2022.11.18</div>
<br>
<br>
	<div style=" width: 100%; height: 115px; ">
		<div style="width: 80px; height: 80px; overflow: hidden; float: left; margin:0 auto; display: inline-block; position: relative;">
		<img src="/storage/black.jpg" style="width:100%; height:100%; object-fit:cover;" >
		</div><!-- product image -->
		
		<div style="position: absolute; padding-left: 30px; padding-top: 5px; display: inline-block;"> 
			<span style="font-size: 25px; font-weight: 600;"> 티셔츠 - minsu (상품명) </span>
		<br>	
			<span style="font-size: 13px;"> 
				black ｜ S size 		 
			</span>
		</div>
	
		<div style="display: inline-block; float: right; padding-top: 25px;">
			<span style="padding-right: 50px; font-size: 13px;"> 3개 </span> 
			<span style="padding-right: 50px; font-size: 13px;"> 52000원 </span>
			<select style="width:85; font-size:12px;">
				<option>결제대기</option>
				<option>결제완료</option>
				<option>상품준비중</option>
				<option>배송중</option>
				<option>배송완료</option>
			</select>
		</div>
	</div><!-- 반복문들어갈 부분 -->

	<div style="display: inline-block; float:left; background-color:yellow; width: 50%;">
		<span>주문자 정보</span>
			<br> ID : kangsun
			<br> EMAIL : kangsun@naver.com
			<br> Tel : 010 - 1234 - 1234
		<hr>
		<span>수령인 정보</span>
			<br> <input type="text" value="이강선">
			<br> <input type="text" value="010-1234-1234">
			<br> <input type="text" value="서울시 강남구 테헤란로 삼원타워 4층 아이티윌">
			<br> <input type="text" value="베송메세지">
	</div> <!-- 주문자/수령인정보 -->
	<div style="display: inline-block; float:right; background-color:green; width: 50%;">
	dd
	</div> <!-- 결제정보 -->

	
</div><!-- rightcontent -->

<!-- 본문영역 -->
<script>

</script>


<%@ include file="../footer.jsp" %>