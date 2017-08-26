<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
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

	<form name="formm" method="post" action="login" onsubmit="return checkValue()">
		<input type="hidden" name="pid" value="${id}">
		<div>
			<%@include file='../common/header.jsp' %>
		</div>
		
		<br><br><br>
	
		<div class="container">
		  <div class="outer">
		    <div class="inner">
		      <div class="centered">
		      <fieldset>
						<legend>Log in</legend>
						<table>
							<tr>
								<td>User Id</td>
								<td><input type="text" name="id"></td>
							</tr>
							
							<tr>
								<td>Password</td>
								<td><input type="password" name="pwd"></td>
							</tr>
			
							<tr>
								<td colspan="2">
									<input type="submit" value="로그인">　
								</td>
							</tr>
						</table>
				</fieldset>
		        <h2>${msg}</h2>
		      </div>
		    </div>
		  </div>
		</div>

		
	</form>
	
	<script>
		function checkValue(){
			var form = document.formm;
			if(!form.id.value){
				alert("아이디를 입력하세요");
				return false;
			}
			
			if(!form.pwd.value){
				alert("비밀번호를 입력하세요");
				return false;
			}
		}
	</script>
</body>
</html>