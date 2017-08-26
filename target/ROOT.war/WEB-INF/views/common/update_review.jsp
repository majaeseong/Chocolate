<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form method="post" action="updateReview" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${review.id }">
	<center>
		<table>
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" value="${review.title }"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea name="content">${review.content }</textarea></td>
			</tr>
			<tr>
				<th>Old Image</th>
				<td><img src="/world/resources/image/${review.image }" style="width:300px; hieght:200px;">
					<input type="hidden" name="originalImage" value="${review.image }">
				</td>
			</tr>
			<tr>
				<th>New Image</th>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${loginuser.id==review.memid }">
						<input type="submit" value="수정">
					</c:if>
				</td>
			</tr>
		</table>
	</center>
	</form>
</body>
</html>