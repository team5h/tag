<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700;800;900&family=Mulish:wght@200;300;400;500;600;700;800;900;1000&display=swap" rel="stylesheet">

<style>

/* 상품 테이블 전체박스 */
#product_box {
width: 300px;
padding-left: 30px;
padding-bottom: 70px;
}

/* 좋아요, 카트 hover 되면 보이게 */
#cart{display: none;}

/* 상품마다 밑에 라인넣기 */
#list_line{
padding-top: 25px;
border-bottom: 1px solid black;
}

/* 상품 이름 밑에 여백주기 */
#product_price{margin-top: 3px;}


body {
font-family: 'Jost', sans-serif;
letter-spacing: 0.25px;
}

a{
color: black; !important;
}

#concert_name {
font-size: 13px;
margin-bottom: 3px;
font-weight: 300;
}

#product_name{
font-size: 18px;
}

h2{
font-size: 60px; !important;
font-family: 'Jost', sans-serif; !important;
font-weight: 600;
padding: 50px 0 70px 0;
}

h3{
font-family: 'Jost', sans-serif; !important;
font-weight: 600;
}


#product_search {
float: right;
}

select {
width: 200px;
border: none; 
border-bottom: 2px solid black;
font-size: 16px;
}

#pro_name {
border: none; 
border-bottom: 2px solid black;
}

#intro_wrap{
padding-bottom: 40px;
}



ul{
list-style:none;
margin:0px; padding:0px;
font-size: 20px;
}
   
   
img{
object-fit: contain;
}




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

.list_aside {
        width: 20%;
        padding-top: 20px;
        margin-bottom: 20px;
        float: left;
}

.list_content {
        width: 80%;
        padding-top: 20px;
        margin-bottom: 20px;
        float: left;
}

.footer {
    clear: both;
}


.h3_title{
padding-bottom: 10px;
}


</style>



<!-- 본문영역 -->
	<h2>Merchandise</h2>
<!-- 	
	<p>
		<button type="button" onclick="location.href='write'">상품등록</button>
		<button type="button" onclick="location.href='list'">상품전체목록</button>
	</p> 
-->
<div class="wrapAll">
	
		<div id="intro_wrap">
			<!-- 공연별 카테고리 -->
			<span class="catergory">
			<select name="c_no" id="c_no">
		         <option selected value="-">해당 공연을 선택해주세요.</option>
			         <c:forEach var="row" items="${concertlist}" varStatus="vs"> 
			           <option value="${row.c_no}">[${row.date}] &nbsp; ${row.title}</option>
			         </c:forEach>
	      	</select>
		    </span>
		    
		    <!-- 상품검색 -->
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
			</span>
		</div>			
		
		<div class="list_container">
			<div class="list_aside">
				<div class="h3_title">
				    <a href="#" onclick="location.href='/list.do'"><h3>All</h3></a>
			        <a href="#" onclick="location.href='/listConcert'"><h3 style="text-decoration: underline;">Concert</h3></a>
		        </div>
		        <div class="li_title">
			        <ul>
			          <li>Clothes</li>
			          <li>Poster</li>
			          <li>Album</li>
			          <li>Acc</li>
			        </ul>
			     </div>
			</div><!-- list_aside -->
			
			
			<div class="list_content">
			
			<div id= "product_count">
			상품개수 : ${fn:length(list)}
			</div>
			
			
				<table>
					<br>
					<tr>
						<!-- varStatus 상태용 변수 -->
						<c:forEach items="${list}" var="row" varStatus="vs">
						<td id="product_box">
						
						<%-- 			
							<c:choose>
								<c:when test="${row.FILENAME != '-'}">
									<img src="/storage/${row.FILENAME}" width="100px">
								</c:when>
								<c:otherwise>
									등록된 사진 없음!! <br>
								</c:otherwise>
							</c:choose> 
						--%>
				
				
							<a href="detail/${row.pro_no}"><img src="/storage/${row.postername}" width="260px" height="400px"></a>
							<%-- <a href="detail/${row.pro_no}"><img src="/images/해리스타일스티셔츠.png" width="260px" height="400px"></a> --%>
							
							
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
							</div>
							<div id="cart" >좋아요 카트</div>
							<div id="list_line"></div>
						</td>
						
						
						<!-- 테이블 한줄에 5칸씩 -->
						<c:if test="${vs.count mod 3==0}">
							<tr><tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>   
			</div><!-- list_content -->
		</div><!-- list_container -->

</div><!-- wrapAll end -->

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>