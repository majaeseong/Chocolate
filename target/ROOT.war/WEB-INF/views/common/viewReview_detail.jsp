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
	<center>
		<table>
			<tr>
				<td>
					<a href="productdetail?id=${product.id}" target="_blank">
						<img src="/world/resources/image/${product.image }" style="width:100px; height:70px">
					</a>
					<h3>${product.name }</h3>
					
				</td>
			</tr>
		</table>
	
	<hr>
		<table>
			<tr>
				<th>Title</th>
				<td>${review.title }</td>
			</tr>
			<tr>
				<th>Content</th>
				<td>${review.content }</td>
			</tr>
			<tr>
				<th>Image</th>
				<td><img src="/world/resources/image/${review.image }" style="width:300px; hieght:200px;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${loginuser.id==review.memid }">
						<input type="button" value="수정" onclick="location.href='updateReview?id=${review.id}'">
						<input type="button" value="삭제" onclick="location.href='deleteReview?id=${review.id}'">
					</c:if>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>