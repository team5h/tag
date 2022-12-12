<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp" %>
<%@ include file="../../header.jsp" %>

<!-- 본문영역 -->


<h3>* 티켓 예매 *</h3>

<!-- -------------------test start----------------------------------- -->
<button id="openBmodal">모달창 열기</button><!-- Trigger/Open modal -->

<!-- The Modal -->
<div id="bookModal" class="bookModal">
	<!-- Modal content -->
	<div class="bmodal-content">
	
	    <div class="bmodal-header">
	    	<span class="closeBmodal">&times;</span>
	    	Choose your ticket
	    </div><!-- header end -->
	    
	    <div class="bmodal-body">
	    	
	    	<div id="mapContainer" style="display: inline-block; overflow-y:scroll; height:540px; margin-right:200px;">
				<!-- Ajax 영역 시작 -->
				
			
				<!-- Ajax 영역 끝 -->
			</div><!-- mapContainer end -->
			
			<div class="sideContainer" id="sideContainer" style="display: inline-block; overflow-y:scroll; height:540px; width: 364px; --background:red;">
				<!-- Ajax 영역 시작 -->
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
				
			
				<!-- Ajax 영역 끝 -->
			</div><!-- sideContainer end -->
	    </div><!-- body end -->
	    
	    <div class="bmodal-footer">
	      TAG Tickets and Goods
	    </div><!-- footer end -->
	</div><!-- modal-content end -->
</div><!-- modal-test end -->


<!-- -------------------test end----------------------------------- -->




<br><br>




<!-- JavaScript -->
<script>

let insertData='';

//modal test
// Get the modal
var modal = document.getElementById("bookModal");

// Get the button that opens the modal
var openBmodal = document.getElementById("openBmodal");

// Get the <span> element that closes the modal
var closeBmodal = document.getElementsByClassName("closeBmodal")[0];

// When the user clicks the button, open the modal 
openBmodal.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
closeBmodal.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

/* ------------------------ test start ---------------------------------- */


$(document).ready(function(){
	
	//페이지가 로딩되면 처음으로 불러올 페이지 설정
    seatAddFormInsert(); //좌석선택 사이드바 불러오기
	insertMap1F();
    
});//ready() end


//좌석선택완료 버튼을 누르면
$("body").on('click', '#goTaddForm', function(){
	insertData=$("#seatAddForm").serialize();	
	
	ticketSale(); //ticketSale.jsp 전환 함수
	ticketAddFormInsert(insertData); //ticketAddForm.jsp 전환 함수	
	//addedSeatInsert(insertData); //input데이터를 선택한좌석에 담는 함수
});//click() end


//이전단계 버튼을 누르면
$("body").on('click', '#goSaddForm', function(){ 
	insertData=$("#ticketAddForm").serialize();
	
	seatAddFormInsert(); //seatAddForm.jsp 전환 함수
	insertMap1F(); //map1F.jsp 전환 함수
});//click() end


//ticketAddForm.jsp 전환 ajax
function ticketAddFormInsert(insertData){			
	//alert(insertData);
	$.ajax({
		 url 		:"ticketAddForm.do"
		,type		:"get"
		,dataType	:"html"
		,error		:function(error){
			alert("에러:" + error);
		}//error callback 함수
		,success : function(result){	
			
			$("#sideContainer").empty();
			$("#sideContainer").html(result);
			
			$("#addedSeat").empty();
			$("#addedSeat").html(insertData);
			
		}//success end
	});//ajax() end
}//ticketAddFormInsert() end

//ticketSale.jsp 전환 ajax
function ticketSale(){
	$.ajax({
		 url 		:"ticketSale.do"
		,type		:"get"
		,dataType	:"html"
		,error		:function(error){
			alert("에러:" + error);
		}//error callback 함수
		,success : function(result){
			$("#mapContainer").empty();
			$("#mapContainer").html(result);
			
		}//success end
	});//ajax() end
}//ticketAddFormInsert() end






//seatAddForm.jsp 전환 ajax
function seatAddFormInsert(){
	//alert(insertData);
	$.ajax({
		 url 		:"seatAddForm.do"
		,type		:"get"
		,dataType	:"html"
		,error		:function(error){
			alert("에러:" + error);
		}//error callback 함수
		,success : function(result){
			//alert(result);
			$("#sideContainer").empty();
			$("#sideContainer").html(result);		
		}//success end
	});//ajax() end
}//ticketAddFormInsert() end





/* ------------------------ test end ---------------------------------- */







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


//미니맵 1층 버튼을 누르면
$(document).ready(function(){
	$("body").on('click', '#map1F', function(){ //map1F버튼 id받아오기
		insertMap1F(); //map1F.jsp를 ajax로 호출하는 함수

		/*
		//모든 flag=true로 바꾸기
		for(let i = 0; i < flagsA.length; i++){
			flagsA[i] = true;
			flagsB[i] = true;
		}//for end
		
		//모든 class="on" 제거
		$("input").removeClass("on");
		
		//<div id="panel">안에 비우기
		$("#panel").empty();
		*/
		
		//<button id="map1F">비활성화 + <button id="map2F">활성화
		$("#map1F").attr("disabled", true);
		$("#map2F").attr("disabled", false);
	});//click() end
});//ready() end



//미니맵 1층 전환 ajax
function insertMap1F(){
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
			
			for(let i = 1; i < flagsA.length; i++){ //A,B구역 전체 R등급
				//css 등급별 색깔 적용
				$("#btnA"+i).addClass("StandingR");
				$("#btnB"+i).addClass("StandingR");
				
				//flag=false인 버튼에 class=on을 추가하기
				if(!flagsA[i]){//false이면
					$("#btnA"+i).addClass("on");
				}//if end
				if(!flagsB[i]){//false이면
					$("#btnB"+i).addClass("on");
				}//if end
			}//for end
			
			$("#map1F").attr("disabled", true);//map1F버튼 비활성화
		}//success end
	});//ajax() end
}//insertMap1F() end



//미니맵 2층 버튼을 누르면
$(document).ready(function(){
	$("body").on('click', '#map2F', function(){ //map2F버튼 id받아오기
		insertMap2F(); //map2F.jsp를 ajax로 호출하는 함수
		
		/*
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
		*/
		
		//<button id="map1F">비활성화 + <button id="map2F">활성화
		$("#map2F").attr("disabled", true);
		$("#map1F").attr("disabled", false);
	});//click() end
});//ready() end



//미니맵 2층 전환 ajax
function insertMap2F(){
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
					//$("#btnX"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
				}else if(i > 29 && i <= 76){
					$("#btnX"+i).addClass("S");
					//$("#btnX"+i)[0].style.background = "dodgerblue"; //S등급 청회색
				}else if(i > 76){
					$("#btnX"+i).addClass("A");
					//$("#btnX"+i)[0].style.background = "darkcyan"; //A등급 민트
				}//if end
				
				//flag=false인 버튼에 class=on을 추가하기
				if(!flagsX[i]){//false이면
					$("#btnX"+i).addClass("on");
				}//if end
			}//for end
			for(let i = 1; i < flagsY.length; i++){ //Y구역 R등급, S등급, A등급
				if(i <= 43){
					$("#btnY"+i).addClass("R");
					//$("#btnY"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
				}else if(i > 43 && i <= 145){
					$("#btnY"+i).addClass("S");
					//$("#btnY"+i)[0].style.background = "dodgerblue"; //S등급 청회색
				}else if(i > 145){
					$("#btnY"+i).addClass("A");
					//$("#btnY"+i)[0].style.background = "darkcyan"; //A등급 민트
				}//if end
				
				//flag=false인 버튼에 class=on을 추가하기
				if(!flagsY[i]){//false이면
					$("#btnY"+i).addClass("on");
				}//if end
			}//for end
			for(let i = 1; i < flagsZ.length; i++){ //Z구역 R등급, S등급, A등급
				if(i <= 29){
					$("#btnZ"+i).addClass("R");
					//$("#btnZ"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
				}else if(i > 29 && i <= 76){
					$("#btnZ"+i).addClass("S");
					//$("#btnZ"+i)[0].style.background = "dodgerblue"; //S등급 청회색
				}else if(i > 76){
					$("#btnZ"+i).addClass("A");
					//$("#btnZ"+i)[0].style.background = "darkcyan"; //A등급 민트
				}//if end

				//flag=false인 버튼에 class=on을 추가하기
				if(!flagsZ[i]){//false이면
					$("#btnZ"+i).addClass("on");
				}//if end
			}//for end
			
			$("#map2F").attr("disabled", true); //map2F버튼 비활성화
		}//success end
	});//ajax() end
}//insertMap2F() end




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
		let input="";
		input += "<input type='text' class='input";
		input += 									section+flagNum;
		input += 	"' name='input";
		input += 					section+flagNum;
		input += 									"' readonly value='";
		input += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
		input += "'>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(input); //<div id="panel">안에 <span class=span+str></span> 생성
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("input").remove(".input"+section+flagNum); //<span class=span+str></span> 제거
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
function reSelectFN(){
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
}//reSelectFN()





</script>

<!-- 본문영역 end -->

<%@ include file="../../footer.jsp" %>