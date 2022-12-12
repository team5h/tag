<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="map1Fjsp">
	<h2>좌석선택-가격할인-배송현장수령</h2>
	<h4>스탠딩 1층</h4>
	<p>스탠딩은 실제 좌석과 다르며 예매시 지정하는 번호가 입장 번호 순서입니다. 빠른 번호를 예매 할수록 입장 순서가 빨라집니다.</p>
	<div id="standA" style="display: inline-block; margin-right:40px;">
		<h4>스탠딩 A구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatA" begin="1" end="825" step="1">
				<td>
					<input type="button" id=btnA${seatA} name=btnA${seatA} value="${seatA}" onclick="standAdd(this, 'A', ${seatA})">
				</td>
				<c:if test="${seatA mod 25 == 0}">
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
	<div id="standB" style="display: inline-block;">
		<h4>스탠딩 B구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatB" begin="1" end="825" step="1">
				<td>
					<input type="button" id=btnB${seatB} name=btnB${seatB} value="${seatB}" onclick="standAdd(this, 'B', ${seatB})">
				</td>
				<c:if test="${seatB mod 25 == 0}">
				<!-- 테이블 한줄에 5줄씩 -->
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
</div><!-- map1Fjsp end -->