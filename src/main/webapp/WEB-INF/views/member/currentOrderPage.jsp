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
		<table style="width:100%;text-align: center;">
			<tr>
				<th>주문 번호</th>
				<th>주문 제품명</th>
				<th>배송지</th>
				<th>주문 날짜</th>
				<th>진행 상황</th>
			</tr>
			<tr>
				<td>${title.id }</td>
				<td>${title.name }</td>
				<td>${title.addr }</td>
				<td>${title.ordertime }</td>
				<td>
					<c:if test="${title.cheory==0 }">처리 중</c:if>
					<c:if test="${title.cheory==1 }">배송 완료</c:if>
					<c:if test="${title.cheory==2 }">구매 확정</c:if>
					<c:if test="${title.cheory==3 }">주문 취소</c:if>
					<c:if test="${title.cheory!=2 && title.cheory!=3}">
						<input type="button" value="구매확정"
							onclick="confirm_order(${title.id })">
					</c:if>
				</td>
			</tr>
		</table>
		
		<hr>
		
		<table style="width:100%;text-align: center;">
			<tr>
				<th>Picture</th>
				<th>주문제품명</th>
				<th>제품 당 가격</th>
				<th>주문 수량</th>
				<th>가격</th>
				<th>주문 날짜</th>
				<th>처리 상태</th>
			</tr>
			<c:forEach var="l" items="${list }">
				<tr>
					<td>
						<a href="productdetail?id=${l.pid}" target="_blank">
							<img src="/world/resources/image/${l.pimage}" style="width:70px;height:50px;">
						</a>
					</td>
					<td>${l.name }</td>
					<td>${l.price }</td>
					<td>${l.amount }</td>
					<td>${l.totalprice }</td>
					<td>${l.ordertime }</td>
					<td>
						<c:if test="${l.cheory==0 }">처리 중</c:if>
						<c:if test="${l.cheory==1 }">배송 완료</c:if>
						<c:if test="${l.cheory==2 }">구매 확정</c:if>
						<c:if test="${l.cheory==3 }">주문 취소</c:if>
						<c:if test="${l.cheory!=2 && l.cheory!=3}">
							<input type="button" value="리뷰 쓰기"
								onclick="location.href='writeReview?pid=${l.pid }&orderdetailid=${l.id}'">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${title.cheory!=3 && title.cheory!=2}">
			<div style="text-align: right">
				<input type="button" value="주문 취소"
					onclick="delete_order(${title.id})">
					
			</div>
		</c:if>
		
		<c:if test="${loginuser.authority == 1 && title.cheory!=2}">
			<input type="hidden" id="id" value="${title.id }">
			<center>
				<h5>주문 처리 상태 변경</h5>
				
				<select id="choery" onchange="fn_viewwith()">
			<option value="0"
				<c:if test="${title.cheory==0 }">selected</c:if>
			>처리 중</option>
			<option value="1"
				<c:if test="${title.cheory==1 }">selected</c:if>
			>처리 완료</option>
			<option value="3"
				<c:if test="${title.cheory==3 }">selected</c:if>
			>주문 취소</option>
		</select>
			</center>
		</c:if>
	</div>
	
	<script type="text/javascript">
		
		function fn_viewwith(){
			var id = document.getElementById('id');
			var choery = document.getElementById('choery');
			location.href="changeChoery?id="+id.value+"&choery="+choery.value;

		}
		
		function confirm_order(val){
			if (confirm("구매확정 하시겠습니까?") == true){
				 location.href='changeChoery?id='+val+'&choery=2';
			    return true;
			}else{ 
			    return false;
			}
		}
		function delete_order(val){
			if (confirm("주문취소 하시겠습니까?") == true){
				 location.href='delete_order?id='+val;
			    return true;
			}else{ 
			    return false;
			}
		}
	    </script>
	
	
</body>
</html>