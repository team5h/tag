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
		.on{background:black !important;} /* class="on" 클릭시 색 변경 */
		#mapContainer input{border:none; font-size:0px; width:12px; height:12px; margin:0; padding:0;} /* font-size:0px; : id="mapContainer"의 value 안보이게 하기 */
		
		table{font-size:10px; border-spacing: 0;}
		td{text-align:right; vertical-align:bottom; }
		
		.StandingR{background:palegreen;} /* 스탠딩R석 색상 */
		.R{background:mediumslateblue;} /* 지정좌석R석 색상 */
		.S{background:dodgerblue;} /* 지정좌석S석 색상 */
		.A{background:darkcyan;} /* 지정좌석A석 색상 */
	</style>
</head>
<body>

<h3>* 티켓 예매 *</h3>
<button id="map1F" name="map1F">1층 맵</button>
<button id="map2F" name="map2F">2층 맵</button>
<br><br>
<div id="mapContainer">
<!-- Ajax 영역 시작 -->

	<h4>스탠딩 1층</h4>
	<p>스탠딩은 실제 좌석과 다르며 예매시 지정하는 번호가 입장 번호 순서입니다. 빠른 번호를 예매 할수록 입장 순서가 빨라집니다.</p>
	<div id="standA" style="display: inline-block;">
		<h4>스탠딩 A구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatA" begin="1" end="825" step="1">
				<td style="width:15px; height:15px;">
					<input type="button" id=btnA${seatA} name=btnA${seatA} value="${seatA}" onclick="standAdd(this, 'A', ${seatA})">
				</td>
				<c:if test="${seatA mod 25 == 0}">
				<!-- 테이블 한줄에 5줄씩 -->
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
	<div id="standB" style="display: inline-block; margin-left:40px;">
		<h4>스탠딩 B구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatB" begin="1" end="825" step="1">
				<td style="width:15px; height:15px;">
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
var flagsA = new Array(826); //좌석tb의 좌석개수+1 (배열[0]번째는 쓰지않는다)
var flagsB = new Array(826);
var flagsX = new Array(86);
var flagsY = new Array(168);
var flagsZ = new Array(86);

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
//Z구역
for(let i = 0; i < flagsZ.length; i++){
	flagsZ[i] = true;
}//for end

//페이지로딩시 적용내용
$(document).ready(function(){
	//첫로딩에 무조건 map1F을 띄우고 class='StandingR' 생성
	for(let i = 1; i < flagsA.length; i++){ //A,B구역 전체 R등급
		$("#btnA"+i).addClass("StandingR");
		$("#btnB"+i).addClass("StandingR");
	}//for end
});//ready() end








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
				
				//css 등급별 색깔 적용
				for(let i = 1; i < flagsA.length; i++){ //A,B구역 전체 R등급
					$("#btnA"+i).addClass("StandingR");
					$("#btnB"+i).addClass("StandingR");
				}//for end
				
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
				
				//등급과 등급별 색깔 적용
				for(let i = 1; i < flagsX.length; i++){ //X구역 R등급, S등급, A등급
					if(i <= 29){
						$("#btnX"+i).addClass("R");
						$("#btnX"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
					}else if(i > 29 && i <= 76){
						$("#btnX"+i).addClass("S");
						$("#btnX"+i)[0].style.background = "dodgerblue"; //S등급 청회색
					}else if(i > 76){
						$("#btnX"+i).addClass("A");
						$("#btnX"+i)[0].style.background = "darkcyan"; //A등급 민트
					}//if end
				}//for end
				for(let i = 1; i < flagsY.length; i++){ //Y구역 R등급, S등급, A등급
					if(i <= 43){
						$("#btnY"+i).addClass("R");
						$("#btnY"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
					}else if(i > 43 && i <= 145){
						$("#btnY"+i).addClass("S");
						$("#btnY"+i)[0].style.background = "dodgerblue"; //S등급 청회색
					}else if(i > 145){
						$("#btnY"+i).addClass("A");
						$("#btnY"+i)[0].style.background = "darkcyan"; //A등급 민트
					}//if end
				}//for end
				for(let i = 1; i < flagsZ.length; i++){ //Z구역 R등급, S등급, A등급
					if(i <= 29){
						$("#btnZ"+i).addClass("R");
						$("#btnZ"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
					}else if(i > 29 && i <= 76){
						$("#btnZ"+i).addClass("S");
						$("#btnZ"+i)[0].style.background = "dodgerblue"; //S등급 청회색
					}else if(i > 76){
						$("#btnZ"+i).addClass("A");
						$("#btnZ"+i)[0].style.background = "darkcyan"; //A등급 민트
					}//if end
				}//for end
				
				//모든 flag=true로 바꾸기
				for(let i = 0; i < flagsX.length; i++){
					flagsX[i] = true;
					flagsZ[i] = true; //X구역과 Z구역 좌석 수는 같다
				}//for end
				for(let i = 0; i < flagsY.length; i++){
					flagsY[i] = true;
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

/* ------------------------ test start ---------------------------------- */

/* ------------------------ test end ---------------------------------- */


//스탠딩 좌석을 누르면
function standAdd(SeatNum, section, flagNum){ //좌석번호, 구역이름, 버튼고유번호
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
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let span="";
		span += "<span class='span";
		span += 				section+flagNum;
		span += 						"' style='margin: 30px 10px'>";
		span += "R석 1층-스탠딩"+section+"구역 입장번호-";
		span += snum;
		span += "</span>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(span); //<div id="panel">안에 <span class=span+str></span> 생성
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("span").remove(".span"+section+flagNum); //<span class=span+str></span> 제거
	}//if end
}//standAdd() end

//지정좌석을 누르면
function rseatAdd(SeatNum, section, row, flagNum){ //좌석번호, 구역이름, 열이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	var grade=$(SeatNum).attr('class'); //좌석등급을 클래스명으로 가져옴
	
	switch (section){
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
		case "Z" : 
			if(flagsZ[flagNum]){ //좌석을 선택할 때
				flagsZ[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsZ[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let span="";
		span += "<span class='span";
		span += 				section+flagNum;
		span += 						"' style='margin: 30px 10px'>";
		span += grade+"석 2층-"+section+"구역"+row+"열 좌석번호-";
		span += snum;
		span += "</span>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(span); //<div id="panel">안에 <span class=span+str></span> 생성
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("span").remove(".span"+section+flagNum); //<span class=span+str></span> 제거
	}//if end
}//rseatAdd() end


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
	for(let i = 0; i < flagsZ.length; i++){
		flagsZ[i] = true;
	}//for end
	
	//모든 class="on" 제거
	$("input").removeClass("on");
	
	//<div id="panel">안에 비우기
	$("#panel").empty();
}//reSelect()



</script>


</body>
</html>