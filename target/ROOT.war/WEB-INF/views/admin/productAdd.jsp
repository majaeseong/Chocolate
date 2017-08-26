<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Add Page</title>
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
	<form name="formm" method="post" action="addproduct" enctype="multipart/form-data"
		onsubmit="return check_form()">
		
		<div>
			<%@include file='../common/header.jsp' %>
		</div>

		<div class="container">
		  <div class="outer">
		    <div class="inner">
		      <div class="centered">
		        <fieldset>
					<legend>Product Add</legend>
				        <table>
						<tr>
							<th>Product Name</th>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<th>Product Content</th>
							<td><input type="text" name="content"></td>
							<td></td>
						</tr>
						<tr>
							<th>Product Price</th>
							<td><input type="text" name="price"></td>
							<td></td>
						</tr>
						<tr>
							<th>Product Quantity</th>
							<td><input type="text" name="total"></td>
							<td></td>
						</tr>
						<tr>
							<th>Product Category</th>
							<td>
								<select name="category">
									<option value="0">초콜릿</option>
									<option value="1">사탕</option>
									<option value="2">젤리</option>
									<option value="3">스낵</option>
									<option value="4">케이크</option>
								</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th>Product Image</th>
							<td>
								<input type="file" name="file"><br>
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
			if(!form.file.value){
				alert("파일을 추가해주세요");
				return false;
			}
		}
	</script>
</body>
</html>