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
		<table style="width:80%;text-align: center">
			<tr>
				<th>작성자</th>
				<th>제품</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="l" items="${reviewList}"> 
				<tr>
					<td>${l.memid}</td>
					<td>
						<a href="productdetail?id=${l.pid }">
							<img src="/world/resources/image/${l.pimage }" style="width:70px;height:50px;">
						</a>
					</td>
					<td>
						<a href="reivewDetail?id=${l.id }">
							${l.title}
						</a>
					</td>
					<td>${l.regtime}</td>
				</tr>			
			</c:forEach>
		</table>
	</center>
</body>
</html>