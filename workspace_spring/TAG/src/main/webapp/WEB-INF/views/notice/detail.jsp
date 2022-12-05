<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <%@ include file="../header.jsp" %> -->

<!-- 본문영역 -->
<br>
<br>
<br>

<h3 style="text-align: center;">상세보기</h3>
<br>
<p>
	<button type="button" onclick="location.href='write'">글쓰기</button>
	<button type="button" onclick="location.href='list'">목록</button>
</p>

<div>
<form name="form1" method="post" enctype="multipart/form-data">
<table class="table">
<tr>
	<th class="info">작성일</th>
	<td>${notice.regdate}</td>
</tr>
<tr>
	<th class="info">제목</th>
	<td>${notice.subject}</td>
</tr>
<tr>
	<th class="info">작성자</th>
	<td>관리자</td>
</tr>
<tr>
	<th class="info">내용</th>
	<td>${notice.edit}</td>
</tr>

</table>
</form>
</div>

<!-- 본문영역 -->

<!-- <%@ include file="../footer.jsp" %> -->
