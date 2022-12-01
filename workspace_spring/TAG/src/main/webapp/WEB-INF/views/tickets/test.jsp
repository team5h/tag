<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/js/jquery.cookie.js"></script>
	<style>
		.on{background:blue;}
	</style>
</head>
<body>

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
	<c:forEach var="r" begin="1" end="5" step="1" varStatus="status">
		<c:forEach var="c" begin="1" end="5" step="1">
			<td>
				
				<c:set var="seatNo" value="${(r-1)*5+c}"/>
				<!-- 
				<c:out value="${r}"/>  //행번호
				<c:out value="${c}"/>  //열번호
				<c:out value="${seatNo}"/>  //좌석번호
				 
				<input type="button" id="btn" value="${seatNo}" onclick="statusChange(this)" style="width:30px;">
				-->
				<input type="button" id=btn${seatNo} name=btn${seatNo} value="${seatNo}" style="width:30px;" onclick="seatAdd(this)">
				
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

<button id="reSelect" name="reSelect" onclick="reSelect()">다시 선택</button>



<!-- JavaScript -->
<script type="text/javascript">
var flags = new Array(25);
for(let i = 0; i < flags.length; i++){
	flags[i] = true;
}//for end

/*
$("input").click(function(){
	$.ajax({
		 dataType:"text"
		,error:function(error){
			alert("에러:" + error);
		}//error callback 함수
		,success:function(result){
			let str=$("#currentbtn${status.index}").val();
			alert($("#currentbtn${status.index}").val());
			//$("#panel").append("버튼을 클릭했습니다!");
		}//success callback 함수
	});//ajax() end
});//click() end
*/

//좌석을 누르면
function seatAdd(currentSeatNo){
	var str=$(currentSeatNo).val();
	//alert(flags[str-1]);
	
	if(flags[str-1]){ //좌석선택 on
		
		$("#btn"+str).addClass("on"); //#btn+seatNo에 class="on" 추가

		let span="";
		span += "<span class='span";
		span += 					str;
		span += 						"' style='margin: 30px 10px'>";
		span += str;
		span += "</span>";
		$("#panel").append(span); //<div id="panel">안에 <span class=span+str></span> 생성
		
		flags[str-1]=false; //on상태 종료
	}else{ //좌석선택 off
		
		$("#btn"+str).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("span").remove(".span"+str); //<span class=span+str></span> 제거
		
		flags[str-1]=true; //off상태 종료
	}//if end
}//seatAdd() end


//좌석선택 버튼을 누르면
function reSelect(){
	//모든 flag=true로 바꾸기
	for(let i = 0; i < flags.length; i++){
		flags[i] = true;
	}//for end
	
	//모든 class="on" 제거
	$("input").removeClass("on");
	
	//<div id="panel">안에 비우기
	$("#panel").empty();
}//reSelect()





</script>


</body>
</html>