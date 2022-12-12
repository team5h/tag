<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="ticketAddFormjsp">
	<form id="ticketAddForm">
		<input type="hidden" id="" value="할인코드">
		<input type="hidden" id="" value="받는사람">
		<input type="hidden" id="" value="받는주소">
		<input type="hidden" id="" value="핸드폰번호">
		<input type="hidden" id="" value="배송메세지">
		<table style="border:1px solid black; height:500px; width: 348px;">
		<tr>
			<td>
				공연포스터 이미지
			</td>
			<td>
				공연이름<br>
				공연정보
			</td>
		</tr>
		<tr>
			<td colspan="2">
				My 예매정보
			</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>2022년 12월 15일(금)</td>
		</tr>
		<tr>
			<td>시간</td>
			<td>16시 00분</td>
		</tr>
		<tr>
			<td>매수</td>
			<td>3매</td>
		</tr>
		<tr>
			<td>선택한 좌석</td>
			<td>
				<div id="addedSeat" style="height:80px; overflow-y:scroll;">
				<!-- 
					S석 2층 Z구역 2열 5번<br>
					S석 2층 Z구역 2열 5번<br>
					S석 2층 Z구역 2열 5번<br>
					S석 2층 Z구역 2열 5번<br>
				 -->
				</div>
			</td>
		</tr>
		<tr>
			<td>티켓금액</td>
			<td>110,000원</td>
		</tr>
		<tr>
			<td>배송료</td>
			<td>0원 | 현장수령</td>
		</tr>
		<tr>
			<td>할인금액</td>
			<td>3,000원</td>
		</tr>	
		<tr>
			<td>총 결제금액</td>
			<td>111,000원</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" id="goSaddForm" name="goSaddForm">이전단계</button>
				<button type="button" id="goDlv" name="goDlv">다음단계</button>
			</td>
		</tr>
		</table>
	</form>
</div>