<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
margin-top:80px;
}
</style>
</head>
<body>
	<div>
		<%@include file='../common/header.jsp' %>
	</div>
	
	<center>
		<table>
			<tr>
				<th>제목</th>
				<td>${qna.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qna.content }</td>
			</tr>
			<tr>
				<th>답변 여부</th>
				<td>
					<c:if test="${qna.repyn==0 }">답변 준비 중입니다 T-T</c:if>
					<c:if test="${qna.repyn==1 }">${qna.reply}</c:if>
				</td>
			</tr>
			<tr>
				<c:if test="${qna.repyn==0 && loginuser.id==qna.memid }">
					<td colspan="2">
						<input type="button" value="수정" onclick="location.href='updateQna?id=${qna.id}'">
						<input type="button" value="삭제" onclick="location.href='deleteQna?id=${qna.id}'">
					</td>
				</c:if>
			</tr>
		</table>
	</center>
	
	<hr>
	
	<center>
		
		<c:if test="${loginuser.authority==1 }">
			<form method="post" action="write_reply">
				<input type="hidden" name="id" value="${qna.id}">
				<textarea name="reply">${qna.reply}</textarea>
				<input type="submit" value="답변 달기">
			</form>
		</c:if>
		
	</center>

</body>
</html>