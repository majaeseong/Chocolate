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
	<form name="formm" method="post" action="myPage" onsubmit="return checkValue()">
		
		<div>
			<%@include file='../common/header.jsp' %>
		</div>
		
		<br><br><br>

		<div class="container">
		  <div class="outer">
		    <div class="inner">
		      <div class="centered">
		        <fieldset>
					<legend>My Page</legend>
				        <table>
						<tr>
							<td>User Id</td>
							<td><input type="text" name="id" id="id" value="${member.id}" readonly>
							</td>
						</tr>
						
						<tr>
							<td>Current Password</td>
							<td>
								<input type="password" name="oldpwd">
								<input type="hidden" value="${member.pwd}" name="oldpwdCheck">
							</td>
								
						</tr>
						
						<tr>
							<td>New Password</td>
							<td><input type="password" name="pwd"></td>
					
						</tr>
						
						<tr>
							<td>Check New Psw</td>
							<td><input type="password" name="pwdCheck"></td>
						
						</tr>
						
						<tr>
							<td>Name</td>
							<td><input type="text" name="name" value="${member.name }"></td>
		
						</tr>
						
						<tr>
							<td>Address</td>
							<td><input type="text" name="addr" value="${member.addr }"></td>
		
						</tr>
						
						<tr>
							<td colspan="3">
								<input type="submit" value="수정">　
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
		function checkValue(){
			var form = document.formm;
			
			if(!form.oldpwd.value){
				alert("이전 비밀번호를 입력하세요");
				return false;
			}
			if(form.oldpwd.value != form.oldpwdCheck.value){
				alert("이전 비밀번호를 다시 확인하세요");
				return false;
			}
			
			if(form.pwd.value != form.pwdCheck.value){
				alert("새 비밀번호를 동일하게 입력하세요");
				return false;
			}
			if(!form.name.value){
				alert("이름을 입력하세요");
				return false;
			}
			if(!form.addr.value){
				alert("주소를 입력하세요");
				return false;
			}
		}
	</script>
</body>
</html>