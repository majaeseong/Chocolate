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
th{
width:15%;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
	</div>
	<!-- <form method="post" action="ttest" name="formm"> -->
	<table>
		<tr>
			<th>Image</th><th>Title</th><th>content</th><th>price</th><th>total</th><th>category</th>
		</tr>
		<c:forEach var="l" items="${list }" varStatus="status">
			<tr>
				
				<td><img src="${l.url }">
					<input type="hidden" id="url${status.count }" value="${l.url }">
				</td>
				<td>
					<a href="${l.href }" target="_blank">${l.title }</a>
					<input type="hidden" id="name${status.count }" value="${l.title }">
				</td>
				<td>
					<textarea id="content${status.count }"></textarea>
				</td>
				<td>
					<input type="text" id="price${status.count }">
				</td>
				<td>
					<input type="text" id="total${status.count }">
				</td>
				<td>
					<select id="category${status.count }">
						<option value="0">초콜릿</option>
						<option value="1">사탕</option>
						<option value="2">젤리</option>
						<option value="3">스낵</option>
						<option value="4">케이크</option>
					</select>
					<button name="button" onclick="aa(${status.count })">상품 등록</button> 
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<!-- </form> -->
	
	<script type="text/javascript">
		function aa(val){
			var _url="url"+val;
			var url = encodeURI(document.getElementById(_url).value);
			
			var _name="name"+val;
			var name = document.getElementById(_name).value;
			
			var _content="content"+val;
			var content = document.getElementById(_content).value;
			
			var _price ="price"+val;
			var price = document.getElementById(_price).value;
			
			var _total="total"+val;
			var total = document.getElementById(_total).value;
			
			var _category="category"+val;
			var category = document.getElementById(_category).value;

			var lo1="ttest?urld=";
			var locat = lo1.concat(url,"&name=",name,"&content=",content,"&price=",price,"&total=",total,"&category=",category);
			
			location.href = locat;
			
		}
	</script>
</body>
</html>