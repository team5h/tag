<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>

<!-- 본문영역 -->

<h3>* 티켓 예매 *</h3>

<br><br>

<table><!-- 스탠딩석 -->
	<tr>
	<c:forEach var="seatNo" begin="1" end="10" step="1">
		<td>
			<c:out value="${seatNo}"/>
		</td>
		<c:if test="${seatNo mod 5 == 0}">
		<!-- 테이블 한줄에 5줄씩 -->
			<tr></tr>
		</c:if>
	</c:forEach>
	</tr>
</table>

<table><!-- 지정석 -->
	<tr>
	<c:forEach var="r" begin="1" end="5" step="1">
		<c:forEach var="c" begin="1" end="5" step="1">
			<td>
				<c:set var="seatNo" value="${(r-1)*5+c}"/>
				<!-- 
				<c:out value="${r}"/>
				<c:out value="${c}"/>
				<c:out value="${seatNo}"/>
				 
				<input type="button" id="btn" value="${seatNo}" onclick="statusChange(this)" style="width:30px;">
				-->
				<input type="button" id="btn" value="${seatNo}" style="width:30px;">
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

<form>
	좌석 선택 : <div id="panel"></div>
</form>











<!-- JavaScript -->
<script type="text/javascript">
/*
function statusChange( statusItem ) {
   var strText = $(statusItem).val();
	alert(strText);
   // strText 에 전체 문자열이 입력된다.
   $("#tt").val(strText);
}
*/

$("#btn").click(function(){
	$.ajax({
		 dataType:"text"
		,error:function(error){
			alert("에러:" + error);
		}//error callback 함수
		,success:function(result){
			//let str=$("#btn").val();
			alert("버튼 클릭");
			//$("#panel").append("버튼을 클릭했습니다!");
		}//success callback 함수
	});//ajax() end
});//click() end










</script>

<!-- 본문영역 end -->

<%@ include file="../footer.jsp" %>