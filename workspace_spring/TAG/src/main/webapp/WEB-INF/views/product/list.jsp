<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700;800;900&family=Mulish:wght@200;300;400;500;600;700;800;900;1000&display=swap" rel="stylesheet">

<style>

/* 전체 가로 너비 */
.container {max-width: 1350px; !important;} 

/* 상품 테이블 전체박스 */
#product_box {
  width: 355px;
  padding: 0 25px 0 25px;
  --padding-right: 50px;
  padding-bottom: 70px;
}


/* 좋아요, 카트 hover 되면 보이게 */
#cart{display: none;}


/* 상품마다 밑에 라인넣기 */
#list_line{
  padding-top: 28px;
  border-bottom: 1px solid black;
}

/* 상품 이름 밑에 여백주기 */
#product_price{margin-top: 3px;}


/* 바디 전체 폰트 설정 */
body {
  font-family: 'Jost', sans-serif;
  letter-spacing: 0.25px;
}

/* 링크 컬러 */
a{color: black; !important;}

/* 상품명 위에 공연명 */
#concert_name {
  font-size: 13px;
  margin-bottom: 3px;
  font-weight: 300;
}

/* 상품명 */
#product_name{font-size: 18px;}

/* 제목 (Merchandise) */
h2{
  font-size: 60px; !important;
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
  padding: 50px 0 70px 0;
}

/* 검색기능 오른쪽으로 */
#product_search {float: right;}

/* 최신순 카테고리 오른쪽으로 */
#catergory {float: right;}

/* aside 네비바 큰 카테고리 (All, Concert) */
h3{
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
}

/* 선택박스(최신순, 인기순, 좋아요순) 디자인 */
select {
  width: 80px;
  border: none; 
  border-bottom: 2px solid black;
  font-size: 14px;
}

/* aside 네비바 텍스트 디자인 */
#pro_name {
  border: none; 
  border-bottom: 2px solid black;
}

/* aisde 네비바 큰 카테고리 밑에 여백 */
.h3_title{padding-bottom: 10px;}

/* 검색기능까지 영역 아래 여백 */
#intro_wrap{padding-bottom: 100px;}

/* ul 점 제거 */
ul{
  list-style:none;
  margin:0px; padding:0px;
  font-size: 20px;
}

   
/* 상품 이미지 꽉차게 */
img{object-fit: contain;}


/* 네비바 + 상품 전체 영역 */
.list_container {
  width: 100%;
  margin: 0 auto;
  --background-color: lightgrey;
}

.list_container:after {  /* after를 이용하여 float해제하기 */
  display: block;
  clear: both;
  content: '';
}


/* 상품의 네비바 영역 */
.list_aside {
  position: sticky;
  top: 80;
  width: 20%;
  padding-top: 20px;
  margin-bottom: 20px;
  float: left;
}

/* 상품 영역 */
.list_content {
  width: 80%;
  padding-top: 20px;
  margin-bottom: 20px;
  float: left;
}
 
/* 푸터 */
.footer {
    clear: both;
}

/* Go to top */
#myBtn {
  position: fixed;
  bottom: 10px;
  right: 10px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  color: black;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
  background: transparent;
}
#myBtn:hover {color: #B3B6B7;}


/* 상품마다 화살표 아이콘 띄우기 */
#arrow-icon {display: none;}
#product_box:hover #arrow-icon {display: block;}

/* 상품안에 아이콘 */
.product-imageandicon {
  width: 100%;
  position: relative;
}
.product-image img{
  width: 100%;
  vertical-align: middle;
}
.heart-icon{
  display: none;
  position: absolute;
  top: 10px;
  left: 0px;
}

.cart-icon{
  display: none;
  position: absolute;
  top: 11px;
  right: 0px;
}

#product_box:hover .heart-icon {display: block;}
#product_box:hover .cart-icon {display: block;}

</style>


<script>
/* Go to top */
function scrollFunction() {
	let mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	$('html, body').animate({scrollTop:0}, '200');
}//scrollFunction() end



function musicCategory(){
	var category = $('#category').val();
	alert(category);
}//musicCategory() end




function categoryList() {
	var category = $('#category').val();
	alert(category);
	
	
}


</script>



<!-- 본문영역 -->
<h2>Merchandise</h2>
<button onclick="topFunction()" id="myBtn" title="Go to top" style="font-size: 26px;">Go to top ↑</button>

<div class="wrapAll">
	
		<!-- intro_wrap 시작 -->
		<div id="intro_wrap">
	
<!--
			최신순/인기순/좋아요순 카테고리 시작
			<span class="catergory">
		    	<select id="catergory" name="catergory">
		         	<option value="new">최신순</option>
		         	<a href="#" onclick=""><option value="popular">인기순</option></a>
		         	<option value="like">좋아요순</option>
		  	 	</select>
		    </span> 최신순/인기순/좋아요순 카테고리 끝
-->		    
		    
		    
		    <!-- 상품검색 시작 -->
			<span id= "product_search">
				<form method="post" action="search">
					<a href="detail/${row.pro_no}">${row.pro_name}</a>
					<input type="text" id="pro_name" name="pro_name" value="${pro_name}">
					<input type="submit" id="btnSubmit" value="검색" style="display:none;">
						<label for="btnSubmit">
						<svg width="22" height="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9118)">
							<path d="M21 21L16.6569 16.6569M16.6569 16.6569C18.1046 15.2091 19 13.2091 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19C13.2091 19 15.2091 18.1046 16.6569 16.6569Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9118">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
						</svg>
						</label>
				 </form> 
			 </span><!-- 상품검색 끝 -->
			 
		</div><!-- intro_wrap 끝 -->	
		
		
		
		<!-- list_container 시작 -->
		<div class="list_container">
		
			<!-- list_aside 시작 -->
			<div class="list_aside">
				<div class="h3_title">
				    <!-- <a href="#" onclick="location.href='/list.do'"><h3 style="text-decoration: underline;">All</h3></a> -->
				    <a href="#" onclick="location.href='/list.do'"><h3>All</h3></a>
			        <a href="#" onclick="location.href='/listConcert'"><h3>Concert</h3></a>
		        </div><!-- h3_title 끝 -->
		        
		        
				<!-- 		        
				<form name="categoryList">
		        <div class="li_title">
			        <ul>  
			          <a href="#" onclick="location.href='/clothes'"><li>Clothes</li></a>
			          <a href="#" onclick="location.href='/poster'"><li>Poster</li></a>
			          <a href="#" onclick="musicCategory()" id="category" name="category" value="M"><li>Album</li></a>
			          <a href="#" onclick="location.href='/acc'"><li>Acc</li></a>
			        </ul>
				</form> 
				-->
				
				
			 <div class="li_title">
				<c:forEach items="${categoryAll}" var="row" varStatus="vs">
					<ul>  
			          <li><a href="list.do?category=${row.category}">
			          		<c:choose>
			          			<c:when test="${row.category == 'C'}"> Clothes </c:when>
			          			<c:when test="${row.category == 'P'}"> Poster </c:when>
			          			<c:when test="${row.category == 'M'}"> Album </c:when>
			          			<c:when test="${row.category == 'A'}"> Acc </c:when>
			          		</c:choose>
			          </a></li> 
			        </ul>
				</c:forEach>
	
			        
			        
			     </div><!-- li_title 끝 -->
			</div><!-- list_aside 끝 -->
			
			
			<!-- list_content 시작 -->
			<div class="list_content">
			
			<div class="count-category" style="paading-bottom: 30px;">
			<sapn id= "product_count">
			All (${total})
			</span>
			
			<!-- 최신순/인기순/좋아요순 카테고리 시작 -->
			<span class="catergory">
		    	<select id="catergory" name="catergory">
		         	<option value="new">최신순</option>
		         	<a href="#" onclick=""><option value="popular">인기순</option></a>
		         	<option value="like">좋아요순</option>
		  	 	</select>
		    </span><!-- 최신순/인기순/좋아요순 카테고리 끝 -->
			</div>
		
			
				<table>
					<br>
					<tr>
							<div>
							<!-- varStatus 상태용 변수 -->
							<c:forEach items="${list}" var="row" varStatus="vs">
							<a href="detail/${row.pro_no}">

							<td id="product_box">
							
								<!-- 상품 이미지 -->
								<c:choose>
									<c:when test="${row.postername != '-'}">
									
									<div class="product-imageandicon">
									
										<!-- 하트 아이콘 -->
										<span class="heart-icon">
											<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<g clip-path="url(#clip0_429_9297)">
											<path d="M19.0711 13.1421L13.4142 18.799C12.6332 19.58 11.3668 19.58 10.5858 18.799L4.92894 13.1421C2.97632 11.1895 2.97632 8.02369 4.92894 6.07106C6.88157 4.11844 10.0474 4.11844 12 6.07106C13.9526 4.11844 17.1185 4.11844 19.0711 6.07106C21.0237 8.02369 21.0237 11.1895 19.0711 13.1421Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
											</g>
											<defs>
											<clipPath id="clip0_429_9297">
											<rect width="24" height="24" fill="white"/>
											</clipPath>
											</defs>
											</svg>
										</span>
			
										<!-- 장바구니 아이콘 -->
										<span class="cart-icon">
											<svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<g clip-path="url(#clip0_429_9132)">
											<path d="M4 9H20L19.1654 18.1811C19.0717 19.2112 18.208 20 17.1736 20H6.82643C5.79202 20 4.92829 19.2112 4.83464 18.1811L4 9Z" stroke="#292929" stroke-width="1.5" stroke-linejoin="round"/>
											<path d="M8 11V8C8 5.79086 9.79086 4 12 4C14.2091 4 16 5.79086 16 8V11" stroke="#292929" stroke-width="1.5" stroke-linecap="round"/>
											</g>
											<defs>
											<clipPath id="clip0_429_9132">
											<rect width="24" height="24" fill="white"/>
											</clipPath>
											</defs>
											</svg>	
										</span>
										
										<div class="product-image">
											<a href="detail/${row.pro_no}"><img src="/storage/${row.postername}" width="300px" height="400px"></a>
										</div>
									</div>
									</c:when>
									
									<c:otherwise>
										등록된 사진 없음!! <br>
									</c:otherwise>
								</c:choose> 
								
								
								<!-- 공연명 -->
								<div id="concert_name">
									<a href="#">PREP LIVE IN SEOUL</a>
								</div>
								
								<!-- 상품명 -->
								<div id="product_name">
									<a href="detail/${row.pro_no}">${row.pro_name}</a>
								</div>
					
								<!-- 가격 -->
								<div id="product_price">
								￦ <fmt:formatNumber value="${row.price}" pattern="#,###" />
									<span style="float: right;">
									<a href="detail/${row.pro_no}">
										<svg id="arrow-icon" width="45px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26.56 15.5">
										<defs>
										<style>.cls-1{fill:none;stroke:#231f20;stroke-miterlimit:10;stroke-width:1px;}</style>
										</defs>
										<g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1">
										<line class="cls-1" y1="7.75" x2="26.03" y2="7.75"/>
										<polyline class="cls-1" points="18.55 15.23 26.03 7.75 18.55 0.27"/>
										</g>
										</g>
										</svg>
										</a>
									</span>
									
								</div>
								
								<div id="cart" >좋아요 카트</div>
								<div id="list_line"></div>
							</td>
							</a>
							<!-- 테이블 한줄에 5칸씩 -->
							<c:if test="${vs.count mod 3==0}">
								<tr><tr>
							</c:if>
							</c:forEach>
							</div>
					</tr>
				</table>   
				
										
				<!-- 페이징 -->
<%-- 				
				<div style="width: 100%; display: block; text-align: center;">		
					<c:if test="${paging.startPage > 1 }">
						<a href="/list.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="/list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if> --%>
					

					
				<div style="width: 100%; display: block; text-align: center;">	
					<c:if test="${requestScope.count > 0}">
						<c:set var="pageCount" value="${requestScope.totalPage}" />
						<c:set var="startPage" value="${requestScope.startPage}" />
						<c:set var="endPage" value="${requestScope.endPage}" />
				
				
							<!-- endPage는 10단위이기에 총 페이지가 end 페이지보다 작으면 그 수를 대입한다 -->
							<!-- 즉, 만약 최종 페이지 수가 22라면 30까지 표시할 필요가 없으니 엔드 페이지 수를 22로 맞춘다 -->
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>
				
				
							<c:if test="${category == null}">
				
								<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
								<c:if test="${startPage > 1}">
									<a href="/list.do?pageNum=${startPage-1}">[이전]</a>
								</c:if>
					
								<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${pageNum == i}">
											<span style="font-weight: bold">${i}</span>
										</c:when>
										<c:when test="${pageNum != i}">
											<a href="/list.do?pageNum=${i}">${i}</a>
										</c:when>
									</c:choose>
								</c:forEach>
					
								<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
								<c:if test="${endPage < pageCount}">
									<a href="/list.do?pageNum=${startPage+10}">[다음]</a>
								</c:if>
							
							</c:if>
							
							
							
							<c:if test="${category != null}">
								
								<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
								<c:if test="${startPage > 1}">
									<a href="/list.do?category=${category}&pageNum=${startPage-1}">[이전]</a>
								</c:if>
					
								<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${pageNum == i}">
											<span style="font-weight: bold">${i}</span>
										</c:when>
										<c:when test="${pageNum != i}">
											<a href="/list.do?category=${category}&pageNum=${i}">${i}</a>
										</c:when>
									</c:choose>
								</c:forEach>
					
								<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
								<c:if test="${endPage < pageCount}">
									<a href="/list.do?category=${category}&pageNum=${startPage+10}">[다음]</a>
								</c:if>
							</c:if>
							
							
							
							
					</c:if>
				</div>	
						
			</div><!-- list_content -->
		</div><!-- list_container -->

</div><!-- wrapAll end -->

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>