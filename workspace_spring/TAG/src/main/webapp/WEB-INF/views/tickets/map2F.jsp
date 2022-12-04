<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InputData</title>
</head>
<body>
	<h4>지정석 2층</h4>
	<p>객석 2층은 지정좌석제입니다.</p>
	<div id="rseatX" style="display: inline-block;">
		<h4>지정좌석 X구역</h4>
		<table>
			<tr>
			<c:forEach var="r" begin="1" end="5" step="1" varStatus="status">
				<c:forEach var="c" begin="1" end="5" step="1">
					<td>
						<c:set var="seat2FNo" value="${(r-1)*5+c}"/>
						<!-- 
						<c:out value="${r}"/>  //행번호
						<c:out value="${c}"/>  //열번호
						<c:out value="${seatNo}"/>  //좌석번호
						 
						<input type="button" id="btn" value="${seatNo}" onclick="statusChange(this)" style="width:30px;">
						-->
						<input type="button" id=btn${seat2FNo} name=btn${seat2FNo} value="${seat2FNo}" style="width:30px;" onclick="seatAdd(this)">
						
						<c:if test="${c mod 5 == 0}">
							<!-- 테이블 한줄에 5줄씩 -->
							<c:out value="${r}열"/>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach>
			</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>