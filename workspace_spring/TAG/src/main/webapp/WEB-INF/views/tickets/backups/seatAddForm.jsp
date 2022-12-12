<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="seatAddFormjsp">
	<form id="seatAddForm">
		<table style="border:1px solid black; height:500px; width: 348px;">
		<tr>
			<td>
				공연장 미니맵<br>
				-> 구역이동은 미니맵을 이용해주세요
			</td>
		</tr>
		<tr>
			<td>
				미니맵 이미지
				<button type="button" id="map1F" name="map1F">1층 맵</button>
				<button type="button" id="map2F" name="map2F">2층 맵</button>
			</td>
		</tr>
		<tr>
			<td>좌석등급 / 가격</td>
		</tr>
		<tr>
			<td>
				지정석 88,000원<br>
				스탠딩석 88,000원
			</td>
		</tr>
		<tr>
			<td>선택한 좌석</td>
		</tr>
		<tr>
			<td>
				<div id="panel" style="height:80px; overflow-y:scroll;">
				<!-- 
				<input type="text" id="testtext" name="testtext" readonly value="first floor hello">
				<input type="text" id="testtext2" name="testtext2" readonly value="second floor">
				<input type="text" id="testtext3" name="testtext3" readonly value="third floor">
				<input type="text" id="testtext4" name="testtext4" readonly value="forth floor bye">
				 -->
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" id="reSelect" name="reSelect" onclick="reSelectFN()">다시 선택</button>
				
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" id="goTaddForm" name="goTaddForm">좌석 선택 완료 ></button>
			</td>
		</tr>
		</table>
	</form>
</div>