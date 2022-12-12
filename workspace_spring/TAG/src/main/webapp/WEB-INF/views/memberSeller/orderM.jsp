<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문영역 -->


<br>
	<h1 class="saem_title"> MY PAGE </h1>
<br> 


							<!-- position:sticky;  -->
<div class="leftcontent" style="float:left; width:15%; margin-right:5%; height:100%;">
	[회원id]님 <!-- 세션아이디 -->
<br><br>
	
	<ul style="font-size:13px; list-style-type: none; padding-left:0px;">
	
		<li style="font-weight:bold;">회원정보수정</li>
<br>
		<li style="font-weight:bold;"> PRODUCT </li>
			<li>&nbsp;<a href="/mypageS/create" style="color:black;" class="saem_a">  - 상품등록 &nbsp;</a></li>
			<li>&nbsp;<a href="/mypageS/productM" style="color:black;" class="saem_a">  - 상품관리 &nbsp;</a></li>
<br>	
		<li style="font-weight:bold; color:#cdf336;"> ORDER </li>
			<li>&nbsp;<a href="/mypageS/orderM" style="color:black;" class="saem_a"> - 주문관리 &nbsp;</a></li>	
<br>	
		<li style="font-weight:bold;"> QnA </li>
			<li>&nbsp; - 답변대기 &nbsp;</li>
			<li>&nbsp; - 답변완료 &nbsp;</li>
<br>	
		<li style="font-weight:bold;"> 판매통계 </li>	
	</ul>
	

</div><!-- "leftcontent" -->



<div class="rightcontent" id="rightcontent" style="float:right; width:80%; height:100%;"> 
	<table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed; font-size: 14px;" >
		<tr style=" border-bottom:1px solid black; font-size: 12px;">	
			<td style="padding:0 10px 5px 10px; width: 100px;"> 주문번호</td>
			<td colspan="5" style="padding:0 10px 5px 10px; width: 450px;"> 수령인 정보</td>
			<td style="padding:0 10px 5px 10px;"> 수량</td>
			<td style="padding:0 10px 5px 10px;"> 금액</td>
			<td style="padding:0 10px 5px 10px;"> 주문일</td>
			<td style="padding:0 10px 5px 10px;"> 상태</td>
		</tr>
		
		
			<c:forEach var="row" items="${orderlist}" varStatus="vs">
				<tr>
					<td style="border-bottom:1px solid #ededed;" > ${row.order_num} </td>
 
					<td colspan="5" style="border-bottom:1px solid #ededed; text-align: left; padding:5px 0px 5px 30px; word-break:break-all; ">  
						<a href="/mypageS/orderMdetail" style="color:black;">
							 ${row.m_id} 
							<br> ${row.rec_addr} ｜ ${row.rec_tel}	
						</a>	 
					</td> 
					
					<td style="border-bottom:1px solid #ededed;">
							${row.total_cnt}	
					</td> 
					
					<td style="border-bottom:1px solid #ededed;">
						<fmt:formatNumber value="${row.total_price}" pattern="#,###"/>
					</td> 
								
					<td style="border-bottom:1px solid #ededed;"> 
					   <fmt:parseDate var="dateString" value="${row.order_date}" pattern="yyyyMMdd" />
					   <fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
					</td>
					
					<td style="border-bottom:1px solid #ededed;">
							${row.stus}	
					</td> 
				</tr>	
			
			
			</c:forEach>
</table>
</div><!-- rightcontent -->

<!-- 본문영역 -->
 
<script>
	
</script>


<%@ include file="../footer.jsp" %>