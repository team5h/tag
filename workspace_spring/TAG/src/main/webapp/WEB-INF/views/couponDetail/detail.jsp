<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->
<style>
.leftcontent, .rightcontent, .box {border:1px solid black;}
.leftcontent div, rightcontent {padding:10px;}
</style>

<div class="title">
	<h3 style="text-align: center;">보유 쿠폰</h3>
</div>
<div></div>

<div class="leftcontent" style="float:left; width:15%; margin-right:5%; height:100%;">
	<div><b>kangsun</b> 님</div>
	<div></div>
	<div><a href="/mypage/updateG">회원 정보 수정</a></div>
	<div></div>
	<div class="box">
		<div ><a href="#">MY티켓</a>
			<div><a href="#">- 예매 확인 / 취소</a></div>	
		</div>
		<div></div>
		<div><a href="#">MY상품</a></div>
			<div><a href="#">- 상품 구매 내역</a></div>	
			<div><a href="#">- 나의 문의내역</a></div>	
		<div></div>
		<div><a href="#">- 관심 공연 / 상품 목록</a></div>
		<div><a href="/couponDetail/detail">- 쿠폰 상세</a></div>
		<div><a href="/pointDetail/detail">- 포인트 상세</a></div>
	</div>

</div><!-- leftcontent end -->



<div class="rightcontent" style="float:right; width:80%; height:100%;"> 
	<div class="couponList">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>쿠폰 일련번호</th>
					<th>쿠폰이름</th>
					<th>발급일</th>
					<th>유효일</th>
					<th>공연 일련번호</th>
					<th>쿠폰 사용여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}" varStatus="vs">
				<tr>
					<td>${row.cp_no}</td>
					<td>${row.coupon}</td>
					<td>${row.issue_date}</td>
					<td>${row.exp_date}</td>
					<td>${row.c_no}</td>
					<td>${row.cp_stus}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>   
	<div></div>   

</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>