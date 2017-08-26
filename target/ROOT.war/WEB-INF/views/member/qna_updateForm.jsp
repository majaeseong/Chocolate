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
	<form method="post" action="updateQna">
		<input type="hidden" name="id" value="${qna.id }">
		<center>
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${qna.title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content">${qna.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
					</td>
				</tr>
			</table>
		</center>
	</form>

</body>
</html>