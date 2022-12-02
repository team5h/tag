<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문영역 -->
<br>
<br>
<br>

<h3 style="text-align: center;">글쓰기</h3>
<br>
<p>
	<button type="button" onclick="location.href='list'">목록</button>
</p>

<div>
<form name="form1" method="post" action="insert" enctype="multipart/form-data">
<table border="1">
<tr>
	<td>제목</td>
	<td><input type="text" name="subject"></td>
</tr>
<tr>
	<td>작성자</td>
	<td>관리자</td>
</tr>
<tr>
	<td>내용</td>
	<td>
		<textarea rows="5" cols="60" name="edit"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="공지사항 등록">
	</td>
</tr>

</table>
</form>
</div>

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>