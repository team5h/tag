<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	function notice_updateProc(){
		if(confirm("수정하시겠습니까?")){
			document.form1.action="/notice/updateProc";
			document.form1.submit();
		}//if end
	}//notice_update() end
	
</script>
<!-- 본문영역 -->
<br>
<br>
<br>

<h3 style="text-align: center;">수정하기</h3>
<br>
<p>
	<button type="button" onclick="location.href='/notice/list'">목록</button>
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
	<td><input type="text" name="subject" value="${notice.subject}"></td>
</tr>
<tr>
	<th class="info">작성자</th>
	<td>관리자</td>
</tr>
<tr>
	<th class="info">내용</th>
	<td><input type="text" name="edit" value="${notice.edit}"></td>
</tr>
<tr>
	<td>
		<input type="hidden" name="n_no" value="${notice.n_no}">
		<input type="submit" value="수정" onclick="notice_updateProc()">
	</td>
</tr>

</table>
</form>
</div>
<!-- 본문영역 -->

