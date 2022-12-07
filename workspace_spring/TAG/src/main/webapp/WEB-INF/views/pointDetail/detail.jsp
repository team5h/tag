<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->
<style>
.leftcontent, .rightcontent, .box {border:1px solid black;}
.leftcontent div, rightcontent {padding:10px;}
</style>

<div class="title">
	<h3 style="text-align: center;">보유 포인트</h3>
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
					<th>일련번호</th>
					<th>포인트 변경 내역</th>
					<th>적립포인트</th>
					<th>사용포인트</th>
					<th>포인트 잔액</th>
					<th>주문번호</th>
					<th>변경일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}" varStatus="vs">
				<tr>
					<td>${row.pt_no}</td>
					<td>${row.detail}</td>
					<td>${row.pt_plus}</td>
					<td>${row.pt_minus}</td>
					<td>${row.pt_total}</td>
					<td>${row.order_num}</td>
					<td>${row.cng_date}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>   
	<div></div>   

</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>