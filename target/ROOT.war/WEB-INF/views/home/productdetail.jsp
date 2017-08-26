<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Detail</title>
<style>
body{
margin-top:80px;
}
div{
	display:inline-block;
	word-wrap:break-word;
}
.fixed {
  position: fixed;
  top:80px;
  right: 0;
}
</style>
</head>
<body>
<%
	String id = (String)request.getParameter("id");
	String name = "c"+id;
	
	Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals(name)){
			cookies[i].setMaxAge(0);
		}
	}
	
	Cookie temp = new Cookie(name,id);
	temp.setMaxAge(60*60*3);
	response.addCookie(temp);
%>
	<div>
		<jsp:include page="../common/header.jsp" />
	</div>
	
<form method="post" action="addtocart">
	<input type="hidden" name="id" value="${product.id }">
		<div style="width:85%;">
			<div style="float:left; width:11%">
				　
			</div>
			<div style="float:left; width:33%">
				<img src="/world/resources/image/${product.image }" style="width:350px;height:265px;">
			</div>
			<div style="float:left; width:33%">
				<h3>${product.name }</h3>
				<h5>${product.content }</h5>
				<h5>
					주문수량 : <input type="number" name="amount" min="1" value="1" max="${product.remain }">
					<input type="submit" value="add to cart" onclick="return amount_check(${product.remain })">
				</h5>
			</div>
			<c:if test="${loginuser.authority == 1 }">
				<input type="button" onclick="location.href='editproduct?id=${product.id}'" value="수정/삭제">
			</c:if>
		</div>
	</form>
	<div>
		<h3>추천 항목</h3>
		<table style="width:50%">
			<tr>
				<c:forEach var="l" items="${calist }">
					<td style="width:25%;">
						<a href="productdetail?id=${l.id }"><img src="/world/resources/image/${l.image }" style="height:100px; width:100px"></a>
						<p style="font-size:5px">${l.name }</p>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	
	<div style="width:10%" class="fixed">
		<h3>최근 본 항목</h3>
		<c:forEach var="l" items="${list }">
			<div>
				<a href="productdetail?id=${l.id }"><img src="/world/resources/image/${l.image }" style="height:100px; width:100px"></a>
				<p style="font-size:5px">${l.name }</p>
			</div><br>
		</c:forEach>
	</div>
	
	<script type="text/javascript">
		function amount_check(obj){
			if(obj==0){
				alert("죄송합니다. 품절제품입니다 ㅜㅜ");
				return false;
			}else{
				if (confirm("카트에 담으시겠습니까?") == true){    //확인
				    return true;
				}else{   //취소
				    return false;
				}
			}
		}
	</script>
</body>
</html>