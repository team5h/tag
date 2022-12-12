<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="ticketDeliveryjsp">
	<h3>* 배송선택/주문자확인 *</h3>
	<form>
		<table>
		<tr>
			<td>수령방법선택</td>
			<td>
				<input type="radio" id="dlvBtn" name="deliverBtn" value="3000" onclick="dlvSelected(this.value)"><!-- value 3000원 -->
  				<label for="dlvBtn">배송</label><br>
  				<input type="radio" id="pUpBtn" name="deliverBtn" value="0" onclick="pUpSelected(this.value)"><!-- value 0원 -->
  				<label for="pUpBtn">현장수령</label><br>
			</td>
		</tr>
		<tr>
			<td colspan='2'>주문자확인</td>
		</tr>
		<tr>
			<td><label for="rec_name">이름</label></td>
			<td><input type="text" id="rec_name" value="정다슬"></td>
		</tr>
		<tr>
			<td><label for="rec_tel">연락처</label></td>
			<td><input type="text" id="rec_tel" value="010-1234-1234"></td>
		</tr>
		<tr>
			<td><label for="rec_email">이메일</label></td>
			<td><input type="text" id="rec_email" value="mktmf1226@gmail.com"></td>
		</tr>
		<tr>
			<td><label for="rec_addr">받는주소</label></td>
			<td><input type="text" id="rec_addr" value="서울시 관악구"></td>
		</tr>
		<tr>
			<td><label for="msg">배송메세지</label></td>
			<td><input type="text" id="msg" value="배송 전 연락바랍니다."></td>
		</tr>				
		</table>
	</form>
</div><!-- ticketDeliveryjsp end -->
