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
	<div>
		<%@include file='../common/Cart_Order.jsp' %>
	</div>
	<div style="float:left;width:20%">
	　
	</div>
	<div style="float:left;width:70%">
		<table>
			<tr>
				<th>Order No</th>
				<th>Name</th>
				<th>Price</th>
				<th>Order Time</th>
				<th>Proccess</th>
				<th>Detail</th>
			</tr>
		<c:forEach var="l" items="${order_list}">
			<tr>
				<td>${l.id }</td>
				<td>${l.name }</td>
				<td>${l.price }</td>
				<td>${l.ordertime }</td>
				<td>
					<c:if test="${l.cheory==0 }">처리중</c:if>
					<c:if test="${l.cheory==1 }">처리 완료</c:if>
					<c:if test="${l.cheory==2 }">구매 확정</c:if>
					<c:if test="${l.cheory==3 }">주문 취소</c:if>
				</td>
				<td><input type="button" value="Detail"
						onclick="location.href='orderdetail?id=${l.id}'"></td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>