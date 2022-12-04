<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
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
<button id="map1F" name="map1F">1층 맵</button>
<button id="map2F" name="map2F">2층 맵</button>
<br><br>
<div id="mapContainer">
<!-- Ajax 영역 시작 -->

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
			<c:forEach var="null" begin="1" end="${nullX[r-1]}" step="1">
				<td></td>
			</c:forEach><!-- nullX end -->
			<c:forEach var="c" begin="1" end="${15-nullX[r-1]}" step="1">
				<td>
					<!-- ${seatX} 1씩 늘어나게하기 -->
					<c:set var="seatX" value="${seatX+1}"/>
					<input type="button" id=btnX${seatX} name=btnX${seatX} value="${c}" style="width:15px; height:15px; margin:0; padding:0;" onclick="seatAdd(this, 'X', ${seatX})">
					<c:if test="${c == (15-nullX[r-1])}">
						<c:out value="${r}열"/>
						<tr></tr>
					</c:if>
				</td>
			</c:forEach><!-- c end -->
		</c:forEach><!-- r end -->
		</tr>
	</table>
</div>
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
			<c:forEach var="nullY" begin="1" end="${nullYL[r-1]}" step="1">
				<td></td>
			</c:forEach><!-- nullYL end -->
			<c:forEach var="c" begin="1" end="${28-nullYAll[r-1]}" step="1">
				<c:choose><%-- if else문 --%>
					<c:when test="${r == 7 && c <= 11}"><!-- 7열 11번째 좌석까지 생성 -->
						<td>
							<c:set var="seatY" value="${seatY+1}"/>
							<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" style="width:15px; height:15px; margin:0; padding:0;" onclick="seatAdd(this, 'Y', ${seatY})">
						</td>
					</c:when>
					<c:when test="${r == 7 && c >= 16}"><!-- 7열 16번째 좌석부터 생성 -->
				    	<td>
							<c:set var="seatY" value="${seatY+1}"/>
							<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c-4}" style="width:15px; height:15px; margin:0; padding:0;" onclick="seatAdd(this, 'Y', ${seatY})">
						</td>
					</c:when>
					<c:when test="${r == 7 && c > 11 && c < 16}"><!-- 7열 빈 좌석 생성 -->
				    	<td></td>
					</c:when>
					<c:otherwise><!-- 그 외 일반 -->
				    	<td>
							<c:set var="seatY" value="${seatY+1}"/>
							<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" style="width:15px; height:15px; margin:0; padding:0;" onclick="seatAdd(this, 'Y', ${seatY})">
						</td>
				  	</c:otherwise>
				</c:choose><!-- choose end -->
			</c:forEach><!-- c end -->
			<c:forEach var="nullR" begin="1" end="${nullYR[r-1]+1}" step="1">
				<td>
					<c:if test="${nullR == nullYR[r-1]+1 }">
						<c:out value="${r}열"/>
						<tr></tr>
					</c:if>
				</td>
			</c:forEach><!-- nullYR end -->
		</c:forEach><!-- r end -->
		</tr>
	</table>
</div>

<!-- Ajax 영역 끝 -->
</div>
<br><br>

<form>
	좌석 선택 : <div id="panel"></div>
</form>

<button id="reSelect" name="reSelect" onclick="reSelect()">다시 선택</button>



<!-- JavaScript -->
<script type="text/javascript">
//전역변수 선언
var flagsA = new Array(601); //좌석tb의 좌석개수+1 (배열[0]번째는 쓰지않는다)
var flagsB = new Array(601);
var flagsX = new Array(86);
var flagsY = new Array(168);

//flags 초기 설정
//A구역
for(let i = 0; i < flagsA.length; i++){
	flagsA[i] = true;
}//for end
//B구역
for(let i = 0; i < flagsB.length; i++){
	flagsB[i] = true;
}//for end
//X구역
for(let i = 0; i < flagsX.length; i++){
	flagsX[i] = true;
}//for end
//Y구역
for(let i = 0; i < flagsY.length; i++){
	flagsY[i] = true;
}//for end

//미니맵 1층 전환 ajax
$(document).ready(function(){
	$("#map1F").click(function(){ //map1F버튼 id받아오기
		$.ajax({
			 url : "map1F.do"
			,type		:"get"
			,dataType	:"html"
			,error		:function(error){
				alert("에러:" + error);
			}//error callback 함수
			,success : function(result){
				$("#mapContainer").empty();
				$("#mapContainer").html(result);
				//모든 flag=true로 바꾸기
				for(let i = 0; i < flagsA.length; i++){
					flagsA[i] = true;
					flagsB[i] = true;
				}//for end
				
				//모든 class="on" 제거
				$("input").removeClass("on");
				
				//<div id="panel">안에 비우기
				$("#panel").empty();
				
				//<button id="map1F">비활성화 + <button id="map2F">활성화
				$("#map1F").attr("disabled", true);
				$("#map2F").attr("disabled", false);
			}//success end
		});//ajax() end
	});//click() end
});//ready() end

/* ------------------------ test ---------------------------------- */

//미니맵 2층 전환 ajax
$(document).ready(function(){
	$("#map2F").click(function(){ //map1F버튼 id받아오기
		$.ajax({
			 url : "map2F.do"
			,type		:"get"
			,dataType	:"html"
			,error		:function(error){
				alert("에러:" + error);
			}//error callback 함수
			,success : function(result){
				$("#mapContainer").empty();
				$("#mapContainer").html(result);
				//모든 flag=true로 바꾸기
				for(let i = 0; i < flagsA.length; i++){
					flagsA[i] = true;
					flagsB[i] = true;
				}//for end
				
				//모든 class="on" 제거
				$("input").removeClass("on");
				
				//<div id="panel">안에 비우기
				$("#panel").empty();
				
				//<button id="map1F">비활성화 + <button id="map2F">활성화
				$("#map2F").attr("disabled", true);
				$("#map1F").attr("disabled", false);
			}//success end
		});//ajax() end
	});//click() end
});//ready() end

/* ------------------------ test ---------------------------------- */

/*
//미니맵 2층 전환 ajax
$("#map2F").click(function(){ //map1F버튼 id받아오기
	$.ajax({
		 url		:"map2F.do"
		,type		:"get"
		,dataType	:"html"
		,error		:function(error){
			alert("에러:" + error);
		}//error callback 함수
		,success	:function(result){
			//alert("성공: " + result);
			var str="";
			str += " <h4>지정석 2층</h4> ";
			str += " <table> ";
			str += " 	<tr> ";
			str += " 	<c:forEach var='r' begin='1' end='5' step='1' varStatus='status'> ";
			str += " 		<c:forEach var='c' begin='1' end='5' step='1'> ";
			str += " 			<td> ";
			str += " 				<c:set var='seatNo' value='${(r-1)*5+c}'/> ";
			str += " 				<input type='button' id=btn${seatNo} name=btn${seatNo} value='${seatNo}' style='width:30px;' onclick='seatAdd(this)'> ";
			str += " 				<c:if test='${c mod 5 == 0}'> ";
			str += " 					<!-- 테이블 한줄에 5줄씩 --> ";
			str += " 					<c:out value='${r}열'/> ";
			str += " 					<tr></tr> ";
			str += " 				</c:if> ";
			str += " 			</td> ";
			str += " 		</c:forEach> ";
			str += " 	</c:forEach> ";
			str += " 	</tr> ";
			str += " </table> ";
			
			$("#mapContainer").empty();
			$("#mapContainer").html(str);
			
			//모든 flagA=true flagB=true로 바꾸기
			for(let i = 0; i < flagsA.length; i++){
				flagsA[i] = true;
				flagsB[i] = true;
			}//for end
			
			//모든 class="on" 제거
			$("input").removeClass("on");
			
			//<div id="panel">안에 비우기
			$("#panel").empty();
		}//success callback 함수
	});//ajax() end
});//click() end
*/

//좌석을 누르면
function seatAdd(SeatNum, section, flagNum){ //좌석번호, 구역이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	
	switch (section){
		case "A" : 
			if(flagsA[flagNum]){ //좌석을 선택할 때
				flagsA[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsA[flagNum]=true; swt=false; break;
			}//if end
		case "B" : 
			if(flagsB[flagNum]){ //좌석을 선택할 때
				flagsB[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsB[flagNum]=true; swt=false; break;
			}//if end
		case "X" : 
			if(flagsX[flagNum]){ //좌석을 선택할 때
				flagsX[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsX[flagNum]=true; swt=false; break;
			}//if end
		case "Y" : 
			if(flagsY[flagNum]){ //좌석을 선택할 때
				flagsY[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsY[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let span="";
		span += "<span class='span";
		span += 				section+flagNum;
		span += 						"' style='margin: 30px 10px'>";
		span += section+"구역 입장번호-";
		span += snum;
		span += "</span>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(span); //<div id="panel">안에 <span class=span+str></span> 생성
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("span").remove(".span"+section+flagNum); //<span class=span+str></span> 제거
	}//if end
}//seatAdd() end

//다시선택 버튼을 누르면
function reSelect(){
	//모든 flag=true로 바꾸기
	for(let i = 0; i < flagsA.length; i++){
		flagsA[i] = true;
	}//for end
	for(let i = 0; i < flagsB.length; i++){
		flagsB[i] = true;
	}//for end
	for(let i = 0; i < flagsX.length; i++){
		flagsX[i] = true;
	}//for end
	for(let i = 0; i < flagsY.length; i++){
		flagsY[i] = true;
	}//for end
	
	//모든 class="on" 제거
	$("input").removeClass("on");
	
	//<div id="panel">안에 비우기
	$("#panel").empty();
}//reSelect()





</script>


</body>
</html>