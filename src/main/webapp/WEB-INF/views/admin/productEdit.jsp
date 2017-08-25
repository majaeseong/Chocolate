<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Edit Page</title>
<style>
body{
margin-top:80px;
}
.container {
  width: 70%;
  height: 70%;
  margin: 40px auto;
}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
.centered {
  position: relative;
  display: inline-block;
 
  width: 50%;
  padding: 1em;
}
</style>
</head>
<body>
	<form name="formm" method="post" action="editsuccess" enctype="multipart/form-data"
		onsubmit="return check_form()">
		
		<div>
			<%@include file='../common/header.jsp' %>
		</div>

		<div class="container">
		  <div class="outer">
		    <div class="inner">
		      <div class="centered">
		        <fieldset>
					<legend>Product Edit</legend>
				        <table>
						<tr>
							<th>Product Name</th>
							<td><input type="text" name="name" value="${product.name }">
								<input type="hidden" name="id" value="${product.id }">
							</td>
							
						</tr>
						<tr>
							<th>Product Content</th>
							<td><input type="text" name="content" value="${product.content }"></td>
							<td></td>
						</tr>
						<tr>
							<th>Product Price</th>
							<td><input type="text" name="price" value="${product.price }"></td>
							<td></td>
						</tr>
						<tr>
							<th>UseYn</th>
							<td>
								<input type="radio" name="useyn" value="0" 
								<c:if test="${product.useyn==0 }">checked</c:if>>Use
								<input type="radio" name="useyn" value="1" 
								<c:if test="${product.useyn==1 }">checked</c:if>>None Use
							</td>
						</tr>
						
						<tr>
							<th>HitProduct</th>
							<td>
								<input type="radio" name="hityn" value="0" 
								<c:if test="${product.hityn==0 }">checked</c:if>>None Hit
								<input type="radio" name="hityn" value="1" 
								<c:if test="${product.hityn==1 }">checked</c:if>>Hit
							</td>
						</tr>
						<tr>
							<th>Product Category</th>
							<td>
								<select name="category">
									<option value="0"
										<c:if test="${product.category==0 }">selected</c:if>
									>초콜릿</option>
									<option value="1"
									<c:if test="${product.category==1 }">selected</c:if>
									>사탕</option>
									<option value="2"
									<c:if test="${product.category==2 }">selected</c:if>
									>젤리</option>
									<option value="3"
									<c:if test="${product.category==3 }">selected</c:if>
									>스낵</option>
									<option value="4"
									<c:if test="${product.category==4 }">selected</c:if>
									>케이크</option>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th>Product Image</th>
							<td>
								<img src="/world/resources/image/${product.image }" style="width:135px;height:70px;"><br>
								<input type="file" name="file"><br>
								<input type="hidden" name="originalImage" value="${product.image }">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="등록">　
							</td>
						</tr>
					</table>
				</fieldset>
		      </div>
		    </div>
		  </div>
		</div>

	</form>
	
	<script>
		function check_form(){
			var form = document.formm;
			
			if(!form.name.value){
				alert("이름을 입력하세요");
				return false;
			}
			if(!form.content.value){
				alert("내용을 입력하세요");
				return false;
			}
			
			if(!form.price.value){
				alert("가격을 입력하세요");
				return false;
			}
			if(isNaN(form.price.value)){
				alert("가격은 숫자만 입력하세요");
				return false;
			}
			
			if(!form.total.value){
				alert("총 개수를 입력하세요");
				return false;
			}
			if(isNaN(form.total.value)){
				alert("개수는 숫자만 입력하세요");
				return false;
			}

		}
	</script>
</body>
</html>