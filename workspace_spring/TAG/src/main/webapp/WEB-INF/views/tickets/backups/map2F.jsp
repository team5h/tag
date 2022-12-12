<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="map2Fjsp">
	<h2>좌석선택-할인결제-배송현장수령</h2>
	<h4>지정석 2층</h4>
	<p>객석 2층은 지정좌석제입니다.</p>
	<div id="rseatX" style="display: inline-block;">
		<h4>지정좌석 X구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<!-- X구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullX" value="<%=new int[] {0,1,2,3,3,5,6} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatX" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullX)}" step="1">
				<c:forEach var="nullXtd" begin="1" end="${nullX[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullX end -->
				<c:forEach var="c" begin="1" end="${15-nullX[r-1]+1}" step="1">
					<td>
						<c:if test="${c <= (15-nullX[r-1])}">
							<!-- ${seatX} 1씩 늘어나게하기 -->
							<c:set var="seatX" value="${seatX+1}"/>
							<input type="button" id=btnX${seatX} name=btnX${seatX} value="${c}" onclick="rseatAdd(this, 'X', ${r}, ${seatX})">
						</c:if>
						<c:if test="${c == (15-nullX[r-1]+1)}">
							<button>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- c end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatX" end -->
	<div id="rseatY" style="display: inline-block;">
		<h4>지정좌석 Y구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Y구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullYL"   value="<%=new int[] {4,3,3,2,1,0,1} %>"/><!-- Left -->
			<c:set var="nullYR"   value="<%=new int[] {3,3,2,1,1,0,1} %>"/><!-- Right -->
			<c:set var="nullYAll"   value="<%=new int[] {7,6,5,3,2,0,2} %>"/><!-- L+R -->
			<!-- "seatY" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatY" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullYL)}" step="1">
				<c:forEach var="nullYLtd" begin="1" end="${nullYL[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullYL end -->
				<c:forEach var="c" begin="1" end="${28-nullYAll[r-1]}" step="1">
					<c:choose><%-- if else문 --%>
						<c:when test="${r == 7 && c <= 11}"><!-- 7열 11번째 좌석까지 생성 -->
							<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 7 && c >= 16}"><!-- 7열 16번째 좌석부터 생성 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c-4}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 7 && c > 11 && c < 16}"><!-- 7열 빈 좌석 생성 -->
					    	<td></td>
						</c:when>
						<c:otherwise><!-- 그 외 일반 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
					  	</c:otherwise>
					</c:choose><!-- choose end -->
				</c:forEach><!-- c end -->
				<c:forEach var="nullYRtd" begin="1" end="${nullYR[r-1]+1}" step="1">
					<td>
						<c:if test="${nullYRtd == nullYR[r-1]+1 }">
							<button>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- nullYR end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatY" end -->
	<div id="rseatZ" style="display: inline-block;">
		<h4>지정좌석 Z구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Z구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullZ" value="<%=new int[] {0,1,2,3,3,5,6} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatZ" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullZ)}" step="1">
				<c:forEach var="c" begin="1" end="${15-nullZ[r-1]}" step="1">
					<td>
						<!-- ${seatZ} 1씩 늘어나게하기 -->
						<c:set var="seatZ" value="${seatZ+1}"/>
						<input type="button" id=btnZ${seatZ} name=btnZ${seatZ} value="${c}" onclick="rseatAdd(this, 'Z', ${r}, ${seatZ})">
					</td>
				</c:forEach><!-- c end -->
				<c:forEach var="nullZtd" begin="0" end="${nullZ[r-1]}" step="1">
					<td>
						<c:if test="${nullZtd == nullZ[r-1] }">
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- null end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatZ" end -->
</div><!-- map2Fjsp end -->	